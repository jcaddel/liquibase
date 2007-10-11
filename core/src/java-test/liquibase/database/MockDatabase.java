package liquibase.database;

import liquibase.exception.JDBCException;
import liquibase.exception.LockException;
import liquibase.database.sql.SqlStatement;
import liquibase.migrator.Migrator;
import liquibase.DatabaseChangeLogLock;

import java.sql.Connection;
import java.io.IOException;

public class MockDatabase implements Database {

    public boolean isCorrectDatabaseImplementation(Connection conn) throws JDBCException {
        return false;
    }

    public String getDefaultDriver(String url) {
        return null;
    }

    public DatabaseConnection getConnection() {
        return null;
    }

    public void setConnection(Connection conn) {
    }

    public void setConnection(DatabaseConnection conn) {
    }

    public boolean getAutoCommitMode() {
        return false;
    }

    public boolean supportsDDLInTransaction() {
        return false;
    }

    public String getDatabaseProductName() {
        return null;
    }

    public String getDatabaseProductVersion() throws JDBCException {
        return null;
    }

    public String getProductName() {
        return null;
    }

    public String getTypeName() {
        return null;
    }

    public String getDriverName() throws JDBCException {
        return null;
    }

    public String getConnectionURL() throws JDBCException {
        return null;
    }

    public String getConnectionUsername() throws JDBCException {
        return null;
    }

    public String getCatalogName() throws JDBCException {
        return null;
    }

    public String getSchemaName() throws JDBCException {
        return null;
    }

    public boolean supportsInitiallyDeferrableColumns() {
        return false;
    }

    public boolean supportsSequences() {
        return false;
    }

    public boolean supportsAutoIncrement() {
        return false;
    }

    public String getColumnType(String columnType, Boolean autoIncrement) {
        return columnType;
    }

    public String getFalseBooleanValue() {
        return "FALSE";
    }

    public String getTrueBooleanValue() {
        return "TRUE";
    }

    public String getDateLiteral(String isoDate) {
        return isoDate;
    }

    public String getCurrentDateTimeFunction() {
        return "DATETIME()";
    }

    public void setCurrentDateTimeFunction(String function) {
        ;
    }    

    public String getLineComment() {
        return null;
    }

    public String getAutoIncrementClause() {
        return null;
    }

    public SqlStatement getCommitSQL() {
        return null;
    }

    public String getDatabaseChangeLogTableName() {
        return "DATABASECHANGELOG";
    }

    public String getDatabaseChangeLogLockTableName() {
        return "DATABASECHANGELOGLOCK";
    }

    public String getConcatSql(String... values) {
        return null;
    }

    public boolean acquireLock(Migrator migrator) throws LockException {
        return false;
    }

    public void releaseLock() throws LockException {
    }

    public DatabaseChangeLogLock[] listLocks() throws LockException {
        return new DatabaseChangeLogLock[0];
    }

    public boolean doesChangeLogTableExist() {
        return false;
    }

    public boolean doesChangeLogLockTableExist() {
        return false;
    }

    public void checkDatabaseChangeLogTable(Migrator migrator) throws JDBCException, IOException {
    }

    public void checkDatabaseChangeLogLockTable(Migrator migrator) throws JDBCException, IOException {
    }

    public void dropDatabaseObjects() throws JDBCException {
    }

    public void tag(String tagString) throws JDBCException {
    }

    public boolean doesTagExist(String tag) throws JDBCException {
        return false;
    }

    public boolean isSystemTable(String catalogName, String schemaName, String tableName) {
        return false;
    }

    public boolean isLiquibaseTable(String tableName) {
        return false;
    }

    public SqlStatement createFindSequencesSQL() throws JDBCException {
        return null;
    }

    public boolean shouldQuoteValue(String value) {
        return true;
    }

    public boolean supportsTablespaces() {
        return false;
    }

    public String getViewDefinition(String name) throws JDBCException {
        return null;
    }

    public int getDatabaseType(int type) {
        return type;
    }

    public String getDatabaseProductName(Connection conn) throws JDBCException {
        return "Mock Database";
    }

    public String getBooleanType() {
        return "BOOLEAN";
    }

    public String getCurrencyType() {
        return "CURRENCY";
    }

    public String getUUIDType() {
        return "UUID";
    }

    public String getClobType() {
        return "CLOB";
    }

    public String getBlobType() {
        return "BLOB";
    }

    public String getDateType() {
        return "DATE";
    }

    public String getDateTimeType() {
        return "DATETIME";
    }

    public String getTimeType() {
        return "TIME";
    }

}