package liquibase.snapshot.ext;

import java.math.BigInteger;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import liquibase.Constants;
import liquibase.database.Database;
import liquibase.database.structure.Column;
import liquibase.database.structure.PrimaryKey;
import liquibase.database.structure.Sequence;
import liquibase.database.structure.Table;
import liquibase.database.structure.View;
import liquibase.exception.DatabaseException;
import liquibase.executor.Executor;
import liquibase.executor.ExecutorService;
import liquibase.snapshot.DatabaseSnapshot;
import liquibase.snapshot.SnapshotContext;
import liquibase.statement.SqlStatement;
import liquibase.statement.core.RawSqlStatement;
import liquibase.util.StringFilter;

/**
 * Provides MySQL specific logic for capturing a snapshot of a database via JDBC
 *
 * @author Jeff Caddel
 */
public class MySQLSnapshotGenerator extends liquibase.snapshot.jvm.MySQLDatabaseSnapshotGenerator {
    boolean ignorePrimaryKeyDefaultValues = true;
    boolean derivePrimaryKeyNameFromTableName = true;
    String defaultPrimaryKeyName = "PRIMARY";

    @Override
    public int getPriority(Database database) {
        return Constants.DEFAULT_EXT_PRIORITY;
    }

    protected void updatePKNames(DatabaseSnapshot snapshot) {
        if (!derivePrimaryKeyNameFromTableName) {
            return;
        }

        Set<Table> tables = snapshot.getTables();
        for (Table table : tables) {
            String tableName = table.getName();
            PrimaryKey pk = snapshot.getPrimaryKeyForTable(tableName);
            if (pk == null) {
                continue;
            }
            String pkName = pk.getName();
            if (isReplacePKName(pkName)) {
                String newPkName = tableName + "P1";
                pk.setName(newPkName);
            }
        }
    }

    protected boolean isReplacePKName(String name) {
        if (name == null || name.trim().equals("")) {
            return true;
        }
        if (defaultPrimaryKeyName.equalsIgnoreCase(name)) {
            return true;
        }
        return false;
    }

    protected void updatePKDefaultValues(DatabaseSnapshot snapshot) {
        if (!ignorePrimaryKeyDefaultValues) {
            return;
        }

        Set<Table> tables = snapshot.getTables();
        for (Table table : tables) {
            List<Column> columns = table.getColumns();
            for (Column column : columns) {
                if (column.isPrimaryKey()) {
                    column.setDefaultValue(null);
                }
            }
        }

    }

    @Override
    public DatabaseSnapshot createSnapshot(SnapshotContext context) throws DatabaseException {
        DatabaseSnapshot snapshot = super.createSnapshot(context);

        updatePKDefaultValues(snapshot);
        updatePKNames(snapshot);

        return snapshot;
    }

    protected boolean isSequenceTable(Table table) {
        String name = table.getName().toLowerCase();
        return name.endsWith("_s");
    }

    protected Sequence getSequence(Database database, Table table) throws DatabaseException {
        ExecutorService service = ExecutorService.getInstance();
        Executor executor = service.getExecutor(database);
        SqlStatement sql = new RawSqlStatement("SELECT ID FROM " + table.getName());
        List<String> idValues = (List<String>) executor.queryForList(sql, String.class);

        BigInteger startValue = getStartValue(idValues);

        Sequence sequence = new Sequence();
        sequence.setName(table.getName());
        sequence.setStartValue(startValue);
        return sequence;
    }

    protected BigInteger getStartValue(List<String> idValues) throws DatabaseException {
        if (idValues == null) {
            return null;
        }
        if (idValues.size() == 0) {
            return null;
        }
        if (idValues.size() > 1) {
            throw new DatabaseException("Expected 0 or 1 values");
        }
        return new BigInteger(idValues.get(1));
    }

    protected List<Sequence> getSequences(Database database, List<Table> sequenceTables) throws DatabaseException {
        List<Sequence> sequences = new ArrayList<Sequence>();
        for (Table table : sequenceTables) {
            Sequence sequence = getSequence(database, table);
            sequences.add(sequence);
        }
        return sequences;
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
        try {
            ResultSet rs = super.getAllTablesResultSet(schema, database, dbmd);
            List<Table> sequenceTables = getSequenceTables(database, rs);
            List<Sequence> sequences = getSequences(database, sequenceTables);
            snapshot.getSequences().addAll(sequences);
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
     * Override the super class method so tables being used to produce sequences do not get lumped in with the other
     * tables. Sequence tables need to produce <createSequence> tags instead of <creatTable> tags
     */
    @Override
    protected boolean isIgnoreTable(Database database, Table table, StringFilter filter) {
        return super.isIgnoreTable(database, table, filter) || isSequenceTable(table);
    }

    public boolean isIgnorePrimaryKeyDefaultValues() {
        return ignorePrimaryKeyDefaultValues;
    }

    public void setIgnorePrimaryKeyDefaultValues(boolean ignorePrimaryKeyDefaultValues) {
        this.ignorePrimaryKeyDefaultValues = ignorePrimaryKeyDefaultValues;
    }

    public boolean isDerivePrimaryKeyNameFromTableName() {
        return derivePrimaryKeyNameFromTableName;
    }

    public void setDerivePrimaryKeyNameFromTableName(boolean derivePrimaryKeyNameFromTableName) {
        this.derivePrimaryKeyNameFromTableName = derivePrimaryKeyNameFromTableName;
    }

    public String getDefaultPrimaryKeyName() {
        return defaultPrimaryKeyName;
    }

    public void setDefaultPrimaryKeyName(String defaultPrimaryKeyName) {
        this.defaultPrimaryKeyName = defaultPrimaryKeyName;
    }

}