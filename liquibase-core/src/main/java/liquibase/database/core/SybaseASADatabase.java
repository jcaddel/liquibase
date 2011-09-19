/**
 *
 */
package liquibase.database.core;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Set;

import liquibase.database.AbstractDatabase;
import liquibase.database.DatabaseConnection;
import liquibase.database.DelimiterStyle;
import liquibase.exception.DatabaseException;

/**
 * @author otaranenko
 *
 */
public class SybaseASADatabase extends AbstractDatabase {

    private static final Set<String> SYSTEM_TABLES_AND_VIEWS;

    static {
        SYSTEM_TABLES_AND_VIEWS = new HashSet<String>();
        SYSTEM_TABLES_AND_VIEWS.add("dummy");
        SYSTEM_TABLES_AND_VIEWS.add("sysarticle");
        SYSTEM_TABLES_AND_VIEWS.add("sysarticlecol");
        SYSTEM_TABLES_AND_VIEWS.add("sysarticlecols");
        SYSTEM_TABLES_AND_VIEWS.add("sysarticles");
        SYSTEM_TABLES_AND_VIEWS.add("sysattribute");
        SYSTEM_TABLES_AND_VIEWS.add("sysattributename");
        SYSTEM_TABLES_AND_VIEWS.add("syscapabilities");
        SYSTEM_TABLES_AND_VIEWS.add("syscapability");
        SYSTEM_TABLES_AND_VIEWS.add("syscapabilityname");
        SYSTEM_TABLES_AND_VIEWS.add("syscatalog");
        SYSTEM_TABLES_AND_VIEWS.add("syscolauth");
        SYSTEM_TABLES_AND_VIEWS.add("syscollation");
        SYSTEM_TABLES_AND_VIEWS.add("syscollationmappings");
        SYSTEM_TABLES_AND_VIEWS.add("syscolperm");
        SYSTEM_TABLES_AND_VIEWS.add("syscolstat");
        SYSTEM_TABLES_AND_VIEWS.add("syscolstats");
        SYSTEM_TABLES_AND_VIEWS.add("syscolumn");
        SYSTEM_TABLES_AND_VIEWS.add("syscolumns");
        SYSTEM_TABLES_AND_VIEWS.add("sysdomain");
        SYSTEM_TABLES_AND_VIEWS.add("sysevent");
        SYSTEM_TABLES_AND_VIEWS.add("syseventtype");
        SYSTEM_TABLES_AND_VIEWS.add("sysextent");
        SYSTEM_TABLES_AND_VIEWS.add("sysexternlogins");
        SYSTEM_TABLES_AND_VIEWS.add("sysfile");
        SYSTEM_TABLES_AND_VIEWS.add("sysfkcol");
        SYSTEM_TABLES_AND_VIEWS.add("sysforeignkey");
        SYSTEM_TABLES_AND_VIEWS.add("sysforeignkeys");
        SYSTEM_TABLES_AND_VIEWS.add("sysgroup");
        SYSTEM_TABLES_AND_VIEWS.add("sysgroups");
        SYSTEM_TABLES_AND_VIEWS.add("sysindex");
        SYSTEM_TABLES_AND_VIEWS.add("sysindexes");
        SYSTEM_TABLES_AND_VIEWS.add("sysinfo");
        SYSTEM_TABLES_AND_VIEWS.add("sysixcol");
        SYSTEM_TABLES_AND_VIEWS.add("sysjar");
        SYSTEM_TABLES_AND_VIEWS.add("sysjarcomponent");
        SYSTEM_TABLES_AND_VIEWS.add("sysjavaclass");
        SYSTEM_TABLES_AND_VIEWS.add("syslogin");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptblock");
        SYSTEM_TABLES_AND_VIEWS.add("sysoption");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptions");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptjoinstrategy");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptorder");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptorders");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptplans");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptquantifier");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptrequest");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptrewrite");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptstat");
        SYSTEM_TABLES_AND_VIEWS.add("sysoptstrategies");
        SYSTEM_TABLES_AND_VIEWS.add("sysprocauth");
        SYSTEM_TABLES_AND_VIEWS.add("sysprocedure");
        SYSTEM_TABLES_AND_VIEWS.add("sysprocparm");
        SYSTEM_TABLES_AND_VIEWS.add("sysprocparms");
        SYSTEM_TABLES_AND_VIEWS.add("sysprocperm");
        SYSTEM_TABLES_AND_VIEWS.add("syspublication");
        SYSTEM_TABLES_AND_VIEWS.add("syspublications");
        SYSTEM_TABLES_AND_VIEWS.add("sysremoteoption");
        SYSTEM_TABLES_AND_VIEWS.add("sysremoteoptions");
        SYSTEM_TABLES_AND_VIEWS.add("sysremoteoptiontype");
        SYSTEM_TABLES_AND_VIEWS.add("sysremotetype");
        SYSTEM_TABLES_AND_VIEWS.add("sysremotetypes");
        SYSTEM_TABLES_AND_VIEWS.add("sysremoteuser");
        SYSTEM_TABLES_AND_VIEWS.add("sysremoteusers");
        SYSTEM_TABLES_AND_VIEWS.add("sysschedule");
        SYSTEM_TABLES_AND_VIEWS.add("sysservers");
        SYSTEM_TABLES_AND_VIEWS.add("syssqlservertype");
        SYSTEM_TABLES_AND_VIEWS.add("syssubscription");
        SYSTEM_TABLES_AND_VIEWS.add("syssubscriptions");
        SYSTEM_TABLES_AND_VIEWS.add("syssync");
        SYSTEM_TABLES_AND_VIEWS.add("syssyncdefinitions");
        SYSTEM_TABLES_AND_VIEWS.add("syssyncpublicationdefaults");
        SYSTEM_TABLES_AND_VIEWS.add("syssyncs");
        SYSTEM_TABLES_AND_VIEWS.add("syssyncsites");
        SYSTEM_TABLES_AND_VIEWS.add("syssyncsubscriptions");
        SYSTEM_TABLES_AND_VIEWS.add("syssynctemplates");
        SYSTEM_TABLES_AND_VIEWS.add("syssyncusers");
        SYSTEM_TABLES_AND_VIEWS.add("systabauth");
        SYSTEM_TABLES_AND_VIEWS.add("systable");
        SYSTEM_TABLES_AND_VIEWS.add("systableperm");
        SYSTEM_TABLES_AND_VIEWS.add("systrigger");
        SYSTEM_TABLES_AND_VIEWS.add("systriggers");
        SYSTEM_TABLES_AND_VIEWS.add("systypemap");
        SYSTEM_TABLES_AND_VIEWS.add("sysuserauth");
        SYSTEM_TABLES_AND_VIEWS.add("sysuserlist");
        SYSTEM_TABLES_AND_VIEWS.add("sysusermessages");
        SYSTEM_TABLES_AND_VIEWS.add("sysuseroptions");
        SYSTEM_TABLES_AND_VIEWS.add("sysuserperm");
        SYSTEM_TABLES_AND_VIEWS.add("sysuserperms");
        SYSTEM_TABLES_AND_VIEWS.add("sysusertype");
        SYSTEM_TABLES_AND_VIEWS.add("sysviews");
    }

    /**
     *
     */
    public SybaseASADatabase() {
        super();
        super.setDelimiterStyle(DelimiterStyle.ROW);
        super.setDelimiter("GO");
    }

    @Override
    public int getPriority() {
        return PRIORITY_DEFAULT;
    }

    /*
     * (non-Javadoc)
     *
     * @see liquibase.database.Database#getCurrentDateTimeFunction()
     */
    @Override
    public String getCurrentDateTimeFunction() {
        if (currentDateTimeFunction != null) {
            return currentDateTimeFunction;
        }

        return "now()";
    }

    /*
     * (non-Javadoc)
     *
     * @see liquibase.database.Database#getDefaultDriver(java.lang.String)
     */
    @Override
    public String getDefaultDriver(String url) {
        if (url.startsWith("jdbc:sybase")) {
            return "com.sybase.jdbc3.jdbc.SybDriver";
        } else {
            return null;
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see liquibase.database.Database#getTypeName()
     */
    @Override
    public String getTypeName() {

        return "asany";
    }

    /*
     * (non-Javadoc)
     *
     * @see liquibase.database.Database#isCorrectDatabaseImplementation(java.sql.Connection)
     */
    @Override
    public boolean isCorrectDatabaseImplementation(DatabaseConnection conn) throws DatabaseException {
        return "Adaptive Server Anywhere".equalsIgnoreCase(conn.getDatabaseProductName())
                || "SQL Anywhere".equalsIgnoreCase(conn.getDatabaseProductName());
    }

    @Override
    public String getDefaultCatalogName() throws DatabaseException {
        return getConnection().getCatalog();
    }

    @Override
    protected String getDefaultDatabaseSchemaName() throws DatabaseException {
        return null;
    }

    @Override
    public String convertRequestedSchemaToSchema(String requestedSchema) throws DatabaseException {
        if (requestedSchema == null) {
            requestedSchema = getDefaultDatabaseSchemaName();
        }

        if (requestedSchema == null) {
            return "DBA";
        }
        return requestedSchema;
    }

    @Override
    public String getDefaultSchemaName() {
        // TODO Auto-generated method stub
        return super.getDefaultSchemaName();
    }

    @Override
    public String getViewDefinition(String schemaName, String viewName) throws DatabaseException {
        // TODO Auto-generated method stub
        return super.getViewDefinition(schemaName, viewName);
    }

    /*
     * (non-Javadoc)
     *
     * @see liquibase.database.Database#supportsInitiallyDeferrableColumns()
     */
    @Override
    public boolean supportsInitiallyDeferrableColumns() {
        return false;
    }

    /*
     * (non-Javadoc)
     *
     * @see liquibase.database.Database#supportsTablespaces()
     */
    @Override
    public boolean supportsTablespaces() {
        return true;
    }

    @Override
    public String convertRequestedSchemaToCatalog(String requestedSchema) throws DatabaseException {
        // like in MS SQL
        return getDefaultCatalogName();

    }

    @Override
    public Set<String> getSystemTablesAndViews() {
        return SYSTEM_TABLES_AND_VIEWS;
    }

    @Override
    public boolean supportsSequences() {
        return false;
    }

    /*
     * (non-Javadoc)
     *
     * @see liquibase.database.AbstractDatabase#getAutoIncrementClause()
     */
    @Override
    protected String getAutoIncrementClause() {
        return "DEFAULT AUTOINCREMENT";
    }

    @Override
    protected boolean generateAutoIncrementStartWith(BigInteger startWith) {
        // not supported
        return false;
    }

    @Override
    protected boolean generateAutoIncrementBy(BigInteger incrementBy) {
        // not supported
        return false;
    }

    @Override
    public void setAutoCommit(boolean b) throws DatabaseException {
        // workaround for strange Sybase bug.
        // In some circumstances tds-driver thrown exception
        // JZ016: The AutoCommit option is already set to false.
        if (b || super.isAutoCommit()) {
            super.setAutoCommit(b);
        }
    }

    @Override
    public String escapeDatabaseObject(String objectName) {
        return "\"" + objectName + "\"";
    }

}
