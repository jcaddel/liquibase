package liquibase.sqlgenerator.ext;

import liquibase.Constants;
import liquibase.database.Database;
import liquibase.database.core.OracleDatabase;
import liquibase.exception.DatabaseException;
import liquibase.exception.UnexpectedLiquibaseException;
import liquibase.sql.Sql;
import liquibase.sql.UnparsedSql;
import liquibase.sqlgenerator.SqlGeneratorChain;
import liquibase.sqlgenerator.core.SelectSequencesGeneratorOracle;
import liquibase.statement.core.SelectSequencesStatement;

public class OracleSelectSequencesGenerator extends SelectSequencesGeneratorOracle {
    @Override
    public int getPriority() {
        return Constants.DEFAULT_EXT_PRIORITY;
    }

    @Override
    public boolean supports(SelectSequencesStatement statement, Database database) {
        return database instanceof OracleDatabase;
    }

    @Override
    public Sql[] generateSql(SelectSequencesStatement statement, Database database, SqlGeneratorChain sqlGeneratorChain) {
        try {
            String rawSql = getSql(statement, database);
            return new Sql[] { new UnparsedSql(rawSql) };
        } catch (DatabaseException e) {
            throw new UnexpectedLiquibaseException(e);
        }
    }

    protected String getSql(SelectSequencesStatement statement, Database database) throws DatabaseException {
        String schema = database.convertRequestedSchemaToSchema(statement.getSchemaName());
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT SEQUENCE_NAME\n");
        sb.append(" , LAST_NUMBER\n");
        sb.append("FROM ALL_SEQUENCES\n");
        sb.append("WHERE SEQUENCE_OWNER = '" + schema + "'");
        return sb.toString();
    }
}