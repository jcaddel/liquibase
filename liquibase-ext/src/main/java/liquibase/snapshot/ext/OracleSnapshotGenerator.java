package liquibase.snapshot.ext;

import java.math.BigInteger;
import java.sql.DatabaseMetaData;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import liquibase.database.Database;
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
    public static final int PRIORITY = 6;

    @Override
    public int getPriority(Database database) {
        return PRIORITY;
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
}