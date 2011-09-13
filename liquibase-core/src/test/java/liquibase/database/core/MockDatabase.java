package liquibase.database.core;

import java.io.IOException;
import java.io.Writer;
import java.sql.Connection;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Set;

import liquibase.Liquibase;
import liquibase.change.Change;
import liquibase.changelog.ChangeSet;
import liquibase.changelog.DatabaseChangeLog;
import liquibase.changelog.RanChangeSet;
import liquibase.database.Database;
import liquibase.database.DatabaseConnection;
import liquibase.database.DelimiterStyle;
import liquibase.database.structure.DatabaseObject;
import liquibase.database.structure.ForeignKeyConstraintType;
import liquibase.diff.DiffStatusListener;
import liquibase.exception.DatabaseException;
import liquibase.exception.DatabaseHistoryException;
import liquibase.exception.DateParseException;
import liquibase.exception.LiquibaseException;
import liquibase.exception.LockException;
import liquibase.exception.RollbackImpossibleException;
import liquibase.exception.StatementNotSupportedOnDatabaseException;
import liquibase.exception.UnsupportedChangeException;
import liquibase.lockservice.DatabaseChangeLogLock;
import liquibase.snapshot.DatabaseSnapshotGenerator;
import liquibase.sql.visitor.SqlVisitor;
import liquibase.statement.DatabaseFunction;
import liquibase.statement.SqlStatement;

public class MockDatabase implements Database {

    @Override
    public DelimiterStyle getDelimiterStyle() {
        return DelimiterStyle.NORMAL;
    }

    @Override
    public String getDelimiter() {
        return ";";
    }

    @Override
    public int getPriority() {
        return PRIORITY_DEFAULT;
    }

    @Override
    public DatabaseObject[] getContainingObjects() {
        return null;
    }

    @Override
    public void setCanCacheLiquibaseTableInfo(boolean canCacheLiquibaseTableInfo) {
        //
    }

    @Override
    public boolean requiresUsername() {
        return false;
    }

    @Override
    public boolean requiresPassword() {
        return false;
    }

    @Override
    public boolean isCorrectDatabaseImplementation(DatabaseConnection conn) throws DatabaseException {
        return false;
    }

    @Override
    public String getDefaultDriver(String url) {
        return null;
    }

    @Override
    public DatabaseConnection getConnection() {
        return null;
    }

    public void setConnection(Connection conn) {
    }

    @Override
    public void setConnection(DatabaseConnection conn) {
    }

    @Override
    public boolean getAutoCommitMode() {
        return false;
    }

    @Override
    public boolean isAutoCommit() throws DatabaseException {
        return false;
    }

    @Override
    public void setAutoCommit(boolean b) throws DatabaseException {

    }

    @Override
    public boolean supportsDDLInTransaction() {
        return false;
    }

    @Override
    public String getDatabaseProductName() {
        return null;
    }

    @Override
    public String getDatabaseProductVersion() throws DatabaseException {
        return null;
    }

    @Override
    public int getDatabaseMajorVersion() throws DatabaseException {
        return 0;
    }

    @Override
    public int getDatabaseMinorVersion() throws DatabaseException {
        return 0;
    }

    @Override
    public String getTypeName() {
        return null;
    }

    public String getDriverName() throws DatabaseException {
        return null;
    }

    public String getConnectionURL() throws DatabaseException {
        return null;
    }

    public String getConnectionUsername() throws DatabaseException {
        return null;
    }

    @Override
    public String getDefaultCatalogName() throws DatabaseException {
        return null;
    }

    @Override
    public String getDefaultSchemaName() {
        return null;
    }

    @Override
    public void setDefaultSchemaName(String schemaName) throws DatabaseException {

    }

    @Override
    public boolean supportsInitiallyDeferrableColumns() {
        return false;
    }

    @Override
    public boolean supportsSequences() {
        return true;
    }

    @Override
    public boolean supportsDropTableCascadeConstraints() {
        return false;
    }

    @Override
    public boolean supportsAutoIncrement() {
        return true;
    }

    @Override
    public String getDateLiteral(String isoDate) {
        return isoDate;
    }

    @Override
    public String getDateLiteral(java.sql.Date date) {
        return date.toString();
    }

    @Override
    public String getTimeLiteral(Time time) {
        return time.toString();
    }

    @Override
    public String getDateTimeLiteral(Timestamp timeStamp) {
        return timeStamp.toString();
    }

    @Override
    public String getCurrentDateTimeFunction() {
        return "DATETIME()";
    }

    @Override
    public void setCurrentDateTimeFunction(String function) {
    }

    @Override
    public String getLineComment() {
        return null;
    }

    @Override
    public String getAutoIncrementClause() {
        return "AUTO_INCREMENT_CLAUSE";
    }

    public SqlStatement getCommitSQL() {
        return null;
    }

    /**
     * @see liquibase.database.Database#getDatabaseChangeLogTableName()
     */
    @Override
    public String getDatabaseChangeLogTableName() {
        return "DATABASECHANGELOG";
    }

    /**
     * @see liquibase.database.Database#getDatabaseChangeLogLockTableName()
     */
    @Override
    public String getDatabaseChangeLogLockTableName() {
        return "DATABASECHANGELOGLOCK";
    }

    /**
     * Does nothing
     *
     * @see liquibase.database.Database#setDatabaseChangeLogLockTableName(java.lang.String)
     */
    @Override
    public void setDatabaseChangeLogLockTableName(String tableName) {
    }

    /**
     * Does nothing
     *
     * @see liquibase.database.Database#setDatabaseChangeLogTableName(java.lang.String)
     */
    @Override
    public void setDatabaseChangeLogTableName(String tableName) {
    }

    @Override
    public String getConcatSql(String... values) {
        return null;
    }

    public boolean acquireLock(Liquibase liquibase) throws LockException {
        return false;
    }

    public void releaseLock() throws LockException {
    }

    public DatabaseChangeLogLock[] listLocks() throws LockException {
        return new DatabaseChangeLogLock[0];
    }

    @Override
    public boolean hasDatabaseChangeLogTable() {
        return false;
    }

    @Override
    public boolean hasDatabaseChangeLogLockTable() {
        return false;
    }

    public void checkDatabaseChangeLogTable(Liquibase liquibase) throws DatabaseException, IOException {
    }

    public void checkDatabaseChangeLogLockTable(Liquibase liquibase) throws DatabaseException, IOException {
    }

    @Override
    public void dropDatabaseObjects(String schema) throws DatabaseException {
    }

    @Override
    public void tag(String tagString) throws DatabaseException {
    }

    @Override
    public boolean doesTagExist(String tag) throws DatabaseException {
        return false;
    }

    @Override
    public boolean isSystemTable(String catalogName, String schemaName, String tableName) {
        return false;
    }

    @Override
    public boolean isSystemView(String catalogName, String schemaName, String name) {
        return false;
    }

    @Override
    public boolean isLiquibaseTable(String tableName) {
        return false;
    }

    @Override
    public boolean shouldQuoteValue(String value) {
        return true;
    }

    @Override
    public boolean supportsTablespaces() {
        return false;
    }

    @Override
    public String getViewDefinition(String schemaName, String name) throws DatabaseException {
        return null;
    }

    public String getDatabaseProductName(DatabaseConnection conn) throws DatabaseException {
        return "Mock Database";
    }

    @Override
    public String getDateLiteral(Date defaultDateValue) {
        return defaultDateValue.toString();
    }

    @Override
    public String escapeTableName(String schemaName, String tableName) {
        if (schemaName == null) {
            return tableName;
        } else {
            return schemaName + "." + tableName;
        }
    }

    @Override
    public String escapeIndexName(String schemaName, String indexName) {
        return escapeTableName(schemaName, indexName);
    }

    @Override
    public String escapeColumnName(String schemaName, String tableName, String columnName) {
        return columnName;
    }

    @Override
    public String escapeColumnNameList(String columnNames) {
        return columnNames;
    }

    @Override
    public String escapeSequenceName(String schemaName, String sequenceName) {
        if (sequenceName == null) {
            return sequenceName;
        } else {
            return schemaName + "." + sequenceName;
        }
    }

    @Override
    public String convertRequestedSchemaToSchema(String requestedSchema) throws DatabaseException {
        return requestedSchema;
    }

    @Override
    public String convertRequestedSchemaToCatalog(String requestedSchema) throws DatabaseException {
        return null;
    }

    @Override
    public boolean supportsSchemas() {
        return true;
    }

    @Override
    public String generatePrimaryKeyName(String tableName) {
        return "PK_" + tableName;
    }

    @Override
    public String escapeViewName(String schemaName, String viewName) {
        return escapeTableName(schemaName, viewName);
    }

    public boolean acquireLock() throws LockException {
        return false;
    }

    @Override
    public void checkDatabaseChangeLogTable(boolean updateExistingNullChecksums, DatabaseChangeLog databaseChangeLog,
            String[] contexts) throws DatabaseException {
        ;
    }

    @Override
    public void checkDatabaseChangeLogLockTable() throws DatabaseException {
        ;
    }

    @Override
    public ChangeSet.RunStatus getRunStatus(ChangeSet changeSet) throws DatabaseException, DatabaseHistoryException {
        return null;
    }

    @Override
    public RanChangeSet getRanChangeSet(ChangeSet changeSet) throws DatabaseException, DatabaseHistoryException {
        return null;
    }

    @Override
    public void markChangeSetExecStatus(ChangeSet changeSet, ChangeSet.ExecType execType) throws DatabaseException {
        ;
    }

    @Override
    public List<RanChangeSet> getRanChangeSetList() throws DatabaseException {
        return null;
    }

    @Override
    public Date getRanDate(ChangeSet changeSet) throws DatabaseException, DatabaseHistoryException {
        return null;
    }

    @Override
    public void removeRanStatus(ChangeSet changeSet) throws DatabaseException {
        ;
    }

    @Override
    public void commit() {
        ;
    }

    @Override
    public void rollback() {
        ;
    }

    public SqlStatement getSelectChangeLogLockSQL() throws DatabaseException {
        return null;
    }

    @Override
    public String escapeStringForDatabase(String string) {
        return string;
    }

    @Override
    public void close() throws DatabaseException {
        ;
    }

    public DatabaseSnapshotGenerator createDatabaseSnapshot(String schema, Set<DiffStatusListener> statusListeners)
            throws DatabaseException {
        return null;
    }

    @Override
    public boolean supportsRestrictForeignKeys() {
        return true;
    }

    @Override
    public String escapeConstraintName(String constraintName) {
        return constraintName;
    }

    @Override
    public boolean isLocalDatabase() throws DatabaseException {
        return true;
    }

    @Override
    public String escapeDatabaseObject(String objectName) {
        return objectName;
    }

    @Override
    public void executeStatements(Change change, DatabaseChangeLog changeLog, List<SqlVisitor> sqlVisitors)
            throws LiquibaseException, UnsupportedChangeException {
        ;
    }

    @Override
    public void execute(SqlStatement[] statements, List<SqlVisitor> sqlVisitors) throws LiquibaseException {
        ;
    }

    @Override
    public void saveStatements(Change change, List<SqlVisitor> sqlVisitors, Writer writer) throws IOException,
            UnsupportedChangeException, StatementNotSupportedOnDatabaseException, LiquibaseException {
        ;
    }

    @Override
    public void executeRollbackStatements(Change change, List<SqlVisitor> sqlVisitors) throws LiquibaseException,
            UnsupportedChangeException, RollbackImpossibleException {
        ;
    }

    @Override
    public void saveRollbackStatement(Change change, List<SqlVisitor> sqlVisitors, Writer writer) throws IOException,
            UnsupportedChangeException, RollbackImpossibleException, StatementNotSupportedOnDatabaseException,
            LiquibaseException {
        ;
    }

    @Override
    public String getLiquibaseSchemaName() {
        return null;
    }

    @Override
    public int getNextChangeSetSequenceValue() throws LiquibaseException {
        return 1;
    }

    @Override
    public Date parseDate(String dateAsString) throws DateParseException {
        return new Date();
    }

    @Override
    public List<DatabaseFunction> getDatabaseFunctions() {
        return null;
    }

    @Override
    public void reset() {

    }

    @Override
    public boolean supportsForeignKeyDisable() {
        return false;
    }

    @Override
    public boolean disableForeignKeyChecks() throws DatabaseException {
        return false;
    }

    @Override
    public void enableForeignKeyChecks() throws DatabaseException {

    }

    public void updateChecksum(ChangeSet changeSet) throws DatabaseException {

    }

    @Override
    public boolean isReservedWord(String string) {
        return false;
    }

    @Override
    public boolean isDefaultUpdateRule(ForeignKeyConstraintType rule) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean isDefaultDeleteRule(ForeignKeyConstraintType rule) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public ForeignKeyConstraintType getDefaultUpdateRule() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public ForeignKeyConstraintType getDefaultDeleteRule() {
        // TODO Auto-generated method stub
        return null;
    }

}
