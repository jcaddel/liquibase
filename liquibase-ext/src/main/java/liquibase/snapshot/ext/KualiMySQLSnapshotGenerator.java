package liquibase.snapshot.ext;

import java.sql.DatabaseMetaData;
import java.sql.SQLException;

import liquibase.database.Database;
import liquibase.database.structure.View;
import liquibase.exception.DatabaseException;
import liquibase.snapshot.DatabaseSnapshot;
import liquibase.snapshot.jvm.MySQLDatabaseSnapshotGenerator;

/**
 * Provides MySQL specific logic for capturing a snapshot of a database via JDBC
 *
 * @author Jeff Caddel
 */
public class KualiMySQLSnapshotGenerator extends MySQLDatabaseSnapshotGenerator {
    public static final int PRIORITY = 6;

    @Override
    public int getPriority(Database database) {
        return PRIORITY;
    }

    /**
     * When a view is created in MySQL, the original SQL statement is parsed, and has some formatting applied to it
     * before being stored. The parsed version always contains the database name prefixed to the table names eg "select
     * * from `foo`.`bar`" This makes the SQL non-portable if you want to extract it and use it in another database. The
     * logic here, strips the database name from the SQL. It changes "select * from `foo`.`bar`" to "select * from bar"
     */
    @Override
    protected void readViews(DatabaseSnapshot snapshot, String schema, DatabaseMetaData databaseMetaData)
            throws SQLException, DatabaseException {

        // Fill in views using the logic from the super class
        super.readViews(snapshot, schema, databaseMetaData);

        Database db = snapshot.getDatabase();
        String convertedSchema = db.convertRequestedSchemaToSchema(schema);
        String quotedSchema = "`" + convertedSchema.toLowerCase() + "`.";
        String[] tokens = { quotedSchema, "`" };

        // Iterate through the view definitions and strip out the database name
        for (View view : snapshot.getViews()) {
            String definition = view.getDefinition().trim();
            String newDefinition = replaceTokens(definition, tokens, "");
            view.setDefinition(newDefinition);
        }
    }

    protected String replaceTokens(String s, String[] tokens, String replacement) {
        if (tokens == null) {
            return s;
        }
        for (String token : tokens) {
            s = s.replace(token, replacement);
        }
        return s;
    }

}