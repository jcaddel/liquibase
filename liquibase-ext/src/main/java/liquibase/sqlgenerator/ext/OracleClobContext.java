package liquibase.sqlgenerator.ext;

import liquibase.database.Database;
import liquibase.statement.core.InsertStatement;
import liquibase.statement.core.InsertStatementColumn;

public class OracleClobContext {
    int chunkIndex;
    InsertStatementColumn clob;
    Database database;
    InsertStatement statement;

    public int getChunkIndex() {
        return chunkIndex;
    }

    public void setChunkIndex(int chunkIndex) {
        this.chunkIndex = chunkIndex;
    }

    public InsertStatementColumn getClob() {
        return clob;
    }

    public void setClob(InsertStatementColumn clob) {
        this.clob = clob;
    }

    public Database getDatabase() {
        return database;
    }

    public void setDatabase(Database database) {
        this.database = database;
    }

    public InsertStatement getStatement() {
        return statement;
    }

    public void setStatement(InsertStatement statement) {
        this.statement = statement;
    }
}
