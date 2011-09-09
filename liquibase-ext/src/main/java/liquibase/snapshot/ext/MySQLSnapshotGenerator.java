package liquibase.snapshot.ext;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import liquibase.database.Database;
import liquibase.database.structure.Table;
import liquibase.database.structure.View;
import liquibase.exception.DatabaseException;
import liquibase.snapshot.DatabaseSnapshot;
import liquibase.util.StringFilter;
import liquibase.util.TimeZoneUtil;

/**
 * Provides MySQL specific logic for capturing a snapshot of a database via JDBC
 *
 * @author Jeff Caddel
 */
public class MySQLSnapshotGenerator extends liquibase.snapshot.jvm.MySQLDatabaseSnapshotGenerator {
    public static final int PRIORITY = 6;
    TimeZoneUtil tzu = new TimeZoneUtil();

    @Override
    public int getPriority(Database database) {
        return PRIORITY;
    }

    protected boolean isSequenceTable(Table table) {
        String name = table.getName().toLowerCase();
        return name.endsWith("_s");
    }

    protected List<Table> getSequenceTables(Database database, ResultSet rs) throws SQLException {
        List<Table> sequences = new ArrayList<Table>();
        while (rs.next()) {
            Table table = readTable(rs, database);
            if (isSequenceTable(table)) {
                sequences.add(table);
            }
        }
        return sequences;
    }

    @Override
    protected void readSequences(DatabaseSnapshot snapshot, String schema, DatabaseMetaData dbmd)
            throws DatabaseException {

        Database database = snapshot.getDatabase();
        if (!database.supportsSequences()) {
            updateListeners("Sequences not supported for " + database.toString() + " ...");
            return;
        }

        try {
            ResultSet rs = super.getAllTablesResultSet(schema, database, dbmd);
            List<Table> sequences = getSequenceTables(database, rs);
            System.out.println("found " + sequences.size() + " sequences");
            for (Table sequence : sequences) {
                System.out.println(sequence.getName());
            }
        } catch (SQLException e) {
            throw new DatabaseException(e);
        }
    }

    /**
     * When a view is created in MySQL, the original SQL statement is parsed, and has some formatting applied to it
     * before being stored. The parsed version always contains the database name prefixed to the table names eg "select
     * * from `foo`.`bar`" This makes the SQL non-portable if you want to extract it for use in another database. The
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

    /**
     * Override the super class method so tables that are only being used to produce sequences do not get lumped in with
     * the other tables. Sequence only tables need to produce <createSequence> tags instead of <creatTable> tags
     */
    @Override
    protected boolean isIgnoreTable(Database database, Table table, StringFilter filter) {
        return super.isIgnoreTable(database, table, filter) || isSequenceTable(table);
    }

}