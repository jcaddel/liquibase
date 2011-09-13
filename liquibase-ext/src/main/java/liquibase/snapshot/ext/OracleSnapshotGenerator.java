package liquibase.snapshot.ext;

import java.math.BigInteger;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import liquibase.Constants;
import liquibase.database.Database;
import liquibase.database.structure.Column;
import liquibase.database.structure.PrimaryKey;
import liquibase.database.structure.Sequence;
import liquibase.exception.DatabaseException;
import liquibase.executor.Executor;
import liquibase.executor.ExecutorService;
import liquibase.snapshot.DatabaseSnapshot;
import liquibase.statement.SqlStatement;
import liquibase.statement.core.SelectSequencesStatement;

/**
 * Provides Oracle specific logic for capturing a snapshot of a database via JDBC
 *
 * @author Jeff Caddel
 */
public class OracleSnapshotGenerator extends liquibase.snapshot.jvm.OracleDatabaseSnapshotGenerator {
    boolean ignoreTablespace = true;

    @Override
    public int getPriority(Database database) {
        return Constants.DEFAULT_EXT_PRIORITY;
    }

    @Override
    protected void readColumns(DatabaseSnapshot snapshot, String schema, DatabaseMetaData databaseMetaData)
            throws DatabaseException, SQLException {
        super.readColumns(snapshot, schema, databaseMetaData);
        Collection<Column> columns = snapshot.getColumns();
        if (columns == null) {
            return;
        }
        if (ignoreTablespace) {
            for (Column column : columns) {
                column.setTablespace(null);
            }
        }
    }

    @Override
    protected void readPrimaryKeys(DatabaseSnapshot snapshot, String schema, DatabaseMetaData databaseMetaData)
            throws DatabaseException, SQLException {
        super.readPrimaryKeys(snapshot, schema, databaseMetaData);
        Set<PrimaryKey> pks = snapshot.getPrimaryKeys();
        if (pks == null) {
            return;
        }

        if (ignoreTablespace) {
            for (PrimaryKey pk : pks) {
                pk.setTablespace(null);
            }
        }

    }

    @Override
    protected void readSequences(DatabaseSnapshot snapshot, String schema, DatabaseMetaData dbmd)
            throws DatabaseException {

        Database database = snapshot.getDatabase();

        updateListeners("Reading sequences for " + database.toString() + " ...");
        ExecutorService service = ExecutorService.getInstance();
        Executor executor = service.getExecutor(database);
        SqlStatement sql = new SelectSequencesStatement(schema);
        List<Map> sequenceData = (List<Map>) executor.queryForList(sql);
        List<Sequence> sequences = getSequences(sequenceData);
        snapshot.getSequences().addAll(sequences);
    }

    protected List<Sequence> getSequences(List<Map> sequenceData) {
        List<Sequence> sequences = new ArrayList<Sequence>();
        for (Map<?, ?> map : sequenceData) {
            Sequence sequence = getSequence(map);
            sequences.add(sequence);
        }
        return sequences;
    }

    protected Sequence getSequence(Map<?, ?> map) {
        String name = (String) map.get("SEQUENCE_NAME");
        BigInteger startValue = new BigInteger(map.get("LAST_NUMBER") + "");

        Sequence sequence = new Sequence();
        sequence.setName(name);
        sequence.setStartValue(startValue);
        return sequence;
    }

    public boolean isIgnoreTablespace() {
        return ignoreTablespace;
    }

    public void setIgnoreTablespace(boolean ignorePrimaryKeyTablespace) {
        this.ignoreTablespace = ignorePrimaryKeyTablespace;
    }
}