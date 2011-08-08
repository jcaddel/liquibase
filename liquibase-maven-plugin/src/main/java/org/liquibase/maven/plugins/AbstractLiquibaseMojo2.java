package org.liquibase.maven.plugins;

import static liquibase.integration.commandline.CommandLineUtils.createDatabaseObject;

import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.exception.DatabaseException;
import liquibase.exception.LiquibaseException;
import liquibase.logging.LogFactory;
import liquibase.resource.CompositeResourceAccessor;
import liquibase.resource.FileSystemResourceAccessor;
import liquibase.resource.ResourceAccessor;
import liquibase.util.ui.UIFactory;

import org.apache.maven.artifact.manager.WagonManager;
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.MojoFailureException;
import org.apache.maven.project.MavenProject;
import org.apache.maven.wagon.authentication.AuthenticationInfo;

/**
 * A base class for providing Liquibase {@link liquibase.Liquibase} functionality.
 * 
 * @author Peter Murray
 * 
 *         Test dependency is used because when you run a goal outside the build phases you want to have the same
 *         dependencies that it would had if it was ran inside test phase
 * @requiresDependencyResolution test
 */
public abstract class AbstractLiquibaseMojo2 extends AbstractMojo {

    /**
     * The fully qualified name of the JDBC driver to use. This is optional as the correct driver to use can almost
     * always be inferred from the url.
     * 
     * @parameter expression="${liquibase.driver}"
     */
    protected String driver;

    /**
     * The Database URL to connect to when executing Liquibase.
     * 
     * @parameter expression="${liquibase.url}"
     * @required
     */
    protected String url;

    /**
     * The Maven Wagon manager to use when obtaining server authentication details.
     * 
     * @component role="org.apache.maven.artifact.manager.WagonManager"
     * @required
     * @readonly
     */
    protected WagonManager wagonManager;

    /**
     * The id of a server in settings.xml containing username/password to use. If server is provided, the corresponding
     * username/password from settings.xml overrides any other username/password supplied to the plugin.
     * 
     * @parameter expression="${liquibase.server}"
     */
    private String server;

    /**
     * The database username to use to connect to the specified database.
     * 
     * @parameter expression="${liquibase.username}"
     */
    protected String username;

    /**
     * The database password to use to connect to the specified database.
     * 
     * @parameter expression="${liquibase.password}"
     */
    protected String password;

    /**
     * The default schema name to use the for database connection.
     * 
     * @parameter expression="${liquibase.defaultSchemaName}"
     */
    protected String defaultSchemaName;

    /**
     * The class to use as the database object. This is optional as a default class to use can almost always be inferred
     * by the JDBC url. If a class name is supplied here it will override the default class inferred by the url.
     * 
     * @parameter expression="${liquibase.databaseClass}"
     */
    protected String databaseClass;

    /**
     * Controls the prompting of users as to whether or not they really want to run the changes on a database that is
     * not local to the machine that the user is current executing the plugin on.
     * 
     * @parameter expression="${liquibase.promptOnNonLocalDatabase}" default-value="true"
     */
    protected boolean promptOnNonLocalDatabase;

    /**
     * Controls the verbosity of the output from invoking the plugin.
     * 
     * @parameter expression="${liquibase.verbose}" default-value="false"
     * @description Controls the verbosity of the plugin when executing
     */
    protected boolean verbose;

    /**
     * Controls logging from Liquibase when executing. The value can be "all", "finest", "finer", "fine", "info",
     * "warning", "severe" or "off". The value is case insensitive.
     * 
     * @parameter expression="${liquibase.logging}" default-value="INFO"
     * @description Controls the verbosity of the plugin when executing
     */
    protected String logging;

    /**
     * Flag for forcing the checksums to be cleared from the DatabaseChangeLog table.
     * 
     * @parameter expression="${liquibase.clearCheckSums}" default-value="false"
     */
    protected boolean clearCheckSums;

    /**
     * Any properties provided here, will be set as System properties prior to invoking Liquibase
     * 
     * @parameter
     */
    protected Properties systemProperties;

    /**
     * Pointer to a properties file containing extra properties for the JDBC driver
     * 
     * @parameter expression="${liquibase.driverProperties}"
     */
    protected String driverProperties;

    /**
     * The Maven project the plugin is running under.
     * 
     * @parameter expression="${project}"
     * @required
     * @readonly
     */
    protected MavenProject project;

    /**
     * Any properties specified here get passed through to Liquibase as change log parameters
     * 
     * @parameter
     */
    private Properties changeLogParameters;

    /**
     * Set this to 'true' to skip execution
     * 
     * @parameter expression="${liquibase.skip}"
     */
    protected boolean skip;

    /**
     * Override username/password with values from settings.xml if a server id was supplied
     */
    protected void updateCredentials() {
        if (server == null) {
            return;
        }
        AuthenticationInfo info = wagonManager.getAuthenticationInfo(server);
        if (info == null) {
            getLog().warn("Server " + server + " was not located in settings.xml");
            return;
        }
        username = info.getUserName();
        password = info.getPassword();
    }

    protected void updateLiquibaseLoggingLevel() throws MojoExecutionException {
        try {
            LogFactory.setLoggingLevel(logging);
        } catch (IllegalArgumentException e) {
            throw new MojoExecutionException("Failed to set logging level: " + e.getMessage(), e);
        }
    }

    /**
     * Create a database object from the mojo configuration info.
     */
    protected Database getDatabaseObject() throws DatabaseException {
        String pw = ((password == null) ? "" : password);
        ClassLoader cl = this.getClass().getClassLoader();
        return createDatabaseObject(cl, url, username, pw, driver, defaultSchemaName, databaseClass, driverProperties);
    }

    /**
     * Initialize a Liquibase object using the database passed in. Also add any change log parameters configured on the
     * mojo
     */
    protected Liquibase getLiquibaseObject(Database database) throws MojoExecutionException {
        Liquibase liquibase = createLiquibase(getFileOpener(this.getClass().getClassLoader()), database);

        if (changeLogParameters == null) {
            return liquibase;
        }
        getLog().debug("changeLogParameters = " + String.valueOf(changeLogParameters));
        for (Map.Entry<Object, Object> var : changeLogParameters.entrySet()) {
            liquibase.setChangeLogParameter(var.getKey().toString(), var.getValue());
        }
        return liquibase;
    }

    /**
     * This method actually pops up a window with a prompt for continuing if it detects that a database modifiying task
     * is about to be run against a non-local database.
     */
    protected boolean isConfirmExecution(Liquibase liquibase) throws DatabaseException {
        // They may have turned off prompting
        if (!isPromptOnNonLocalDatabase()) {
            return true;
        }

        // Might be a read-only task
        if (liquibase.isSafeToRunMigration()) {
            return true;
        }

        // Splash a dialog asking if they are sure
        return UIFactory.getInstance().getFacade().promptForNonLocalDatabase(liquibase.getDatabase());
    }

    /**
     * Get a handle to a Database and Liquibase object, and invoke the performLiquibaseTask() method
     */
    protected void performTask() throws MojoExecutionException {
        Database database = null;
        Liquibase liquibase = null;
        try {
            database = getDatabaseObject();
            liquibase = getLiquibaseObject(database);

            getLog().info("Connecting to: " + url);

            // Give them a chance to cancel if we are performing an action against a non-local database that performs a
            // modification
            if (!isConfirmExecution(liquibase)) {
                throw new LiquibaseException("User decided not to run against non-local database");
            }

            if (clearCheckSums) {
                getLog().info("Clearing the Liquibase Checksums on the database");
                liquibase.clearCheckSums();
            }

            performLiquibaseTask(liquibase);
        } catch (LiquibaseException e) {
            throw new MojoExecutionException("Liquibase error: " + e.getMessage(), e);
        } finally {
            nullSafeCleanup(liquibase, database);
        }
    }

    @Override
    public void execute() throws MojoExecutionException, MojoFailureException {
        getLog().info(MavenUtils.LOG_SEPARATOR);

        // They asked us to skip execution
        if (skip) {
            getLog().info("Skipping execution due to Maven configuration");
            return;
        }

        // Might be using credentials from settings.xml
        updateCredentials();

        // Add System properties as requested
        addToSystemProperties();

        // Alter the liquibase logging level
        updateLiquibaseLoggingLevel();

        // Print diagnostic info if desired
        printSettings("   ");

        // Do the work
        performTask();

        getLog().info(MavenUtils.LOG_SEPARATOR);
    }

    protected void nullSafeCleanup(Liquibase liquibase, Database database) {
        nullSafeCleanup(liquibase);
        nullSafeCleanup(database);
    }

    protected void nullSafeCleanup(Database db) {
        if (db == null) {
            return;
        }
        try {
            db.rollback();
            db.close();
        } catch (DatabaseException e) {
            getLog().error("Failed to close open connection to database.", e);
        }

    }

    protected void nullSafeCleanup(Liquibase liquibase) {
        if (liquibase == null) {
            return;
        }
        try {
            liquibase.forceReleaseLocks();
        } catch (LiquibaseException e) {
            getLog().error(e.getMessage(), e);
        }
    }

    protected abstract void performLiquibaseTask(Liquibase liquibase) throws LiquibaseException;

    protected boolean isPromptOnNonLocalDatabase() {
        return promptOnNonLocalDatabase;
    }

    protected Liquibase createLiquibase(ResourceAccessor fo, Database db) throws MojoExecutionException {
        try {
            return new Liquibase("", fo, db);
        } catch (LiquibaseException ex) {
            throw new MojoExecutionException("Error creating liquibase: " + ex.getMessage(), ex);
        }
    }

    protected ResourceAccessor getFileOpener(ClassLoader cl) {
        ResourceAccessor mFO = new MavenResourceAccessor(cl);
        ResourceAccessor fsFO = new FileSystemResourceAccessor(project.getBasedir().getAbsolutePath());
        return new CompositeResourceAccessor(mFO, fsFO);
    }

    /**
     * Prints a few key settings for the plugin. These are only shown in verbose mode.
     */
    protected void printSettings(String indent) {
        if (!verbose) {
            return;
        }
        if (indent == null) {
            indent = "";
        }
        getLog().info(MavenUtils.LOG_SEPARATOR);
        getLog().info(indent + "driver: " + driver);
        getLog().info(indent + "url: " + url);
        getLog().info(indent + "username: " + username);
        getLog().info(indent + "password: " + password);
        getLog().info(indent + "prompt on non-local database? " + promptOnNonLocalDatabase);
        getLog().info(indent + "clear checksums? " + clearCheckSums);
        getLog().info(MavenUtils.LOG_SEPARATOR);
    }

    /**
     * Add any System level properties as needed
     */
    protected void addToSystemProperties() {
        if (systemProperties == null) {
            systemProperties = new Properties();
        }
        // Add any properties configured by the user as system properties
        Iterator<String> iter = systemProperties.stringPropertyNames().iterator();
        while (iter.hasNext()) {
            String key = iter.next();
            String value = systemProperties.getProperty(key);
            System.setProperty(key, value);
        }
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDefaultSchemaName() {
        return defaultSchemaName;
    }

    public void setDefaultSchemaName(String defaultSchemaName) {
        this.defaultSchemaName = defaultSchemaName;
    }

    public String getDatabaseClass() {
        return databaseClass;
    }

    public void setDatabaseClass(String databaseClass) {
        this.databaseClass = databaseClass;
    }

    public boolean isVerbose() {
        return verbose;
    }

    public void setVerbose(boolean verbose) {
        this.verbose = verbose;
    }

    public String getLogging() {
        return logging;
    }

    public void setLogging(String logging) {
        this.logging = logging;
    }

    public boolean isClearCheckSums() {
        return clearCheckSums;
    }

    public void setClearCheckSums(boolean clearCheckSums) {
        this.clearCheckSums = clearCheckSums;
    }

    public Properties getSystemProperties() {
        return systemProperties;
    }

    public void setSystemProperties(Properties systemProperties) {
        this.systemProperties = systemProperties;
    }

    public Properties getChangeLogParameters() {
        return changeLogParameters;
    }

    public void setChangeLogParameters(Properties expressionVars) {
        this.changeLogParameters = expressionVars;
    }

    public boolean isSkip() {
        return skip;
    }

    public void setSkip(boolean skip) {
        this.skip = skip;
    }

    public WagonManager getWagonManager() {
        return wagonManager;
    }

    public MavenProject getProject() {
        return project;
    }

    public void setPromptOnNonLocalDatabase(boolean promptOnNonLocalDatabase) {
        this.promptOnNonLocalDatabase = promptOnNonLocalDatabase;
    }
}