package liquibase.sqlgenerator.ext;

import java.math.BigInteger;

import liquibase.database.Database;
import liquibase.database.core.MySQLDatabase;
import liquibase.sql.Sql;
import liquibase.sql.UnparsedSql;
import liquibase.sqlgenerator.SqlGeneratorChain;
import liquibase.sqlgenerator.core.CreateSequenceGenerator;
import liquibase.statement.core.CreateSequenceStatement;

public class CreateMySQLSequenceGenerator extends CreateSequenceGenerator {

    @Override
    public int getPriority() {
        return 6;
    }

    @Override
    public boolean supports(CreateSequenceStatement statement, Database database) {
        return database instanceof MySQLDatabase;
    }

    @Override
    public Sql[] generateSql(CreateSequenceStatement statement, Database database, SqlGeneratorChain sqlGeneratorChain) {
        String createTableSql = getCreateTableSql(statement);
        return new Sql[] { new UnparsedSql(createTableSql) };
    }

    protected String getCreateTableSql(CreateSequenceStatement statement) {
        BigInteger startValue = statement.getStartValue();
        String name = statement.getSequenceName();
        StringBuilder sb = new StringBuilder();
        sb.append("CREATE TABLE");
        sb.append(" " + name + " ");
        sb.append(" (id BIGINT NOT NULL AUTO_INCREMENT");
        sb.append(",");
        sb.append(" PRIMARY KEY (id)");
        sb.append(")");
        if (startValue != null) {
            sb.append(" AUTO_INCREMENT");
            sb.append(" = " + startValue);
        }
        return sb.toString();
    }
}
