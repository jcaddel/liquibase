package org.liquibase.maven.plugins;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.exception.DatabaseException;
import liquibase.exception.LiquibaseException;
import liquibase.integration.commandline.CommandLineUtils;
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
     * Suffix for fields that are representing a default value for a another field.
     */
    private static final String DEFAULT_FIELD_SUFFIX = "Default";

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
     * The class to use as the database object.
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
     * Allows for the maven project artifact to be included in the class loader for obtaining the Liquibase property and
     * DatabaseChangeLog files.
     * 
     * @parameter expression="${liquibase.includeArtifact}" default-value="true"
     */
    protected boolean includeArtifact;

    /**
     * Allows for the maven test output directory to be included in the class loader for obtaining the Liquibase
     * property and DatabaseChangeLog files.
     * 
     * @parameter expression="${liquibase.includeTestOutputDirectory}" default-value="true"
     */
    protected boolean includeTestOutputDirectory;

    /**
     * Controls the verbosity of the output from invoking the plugin.
     * 
     * @parameter expression="${liquibase.verbose}" default-value="false"
     * @description Controls the verbosity of the plugin when executing
     */
    protected boolean verbose;

    /**
     * Controls the level of logging from Liquibase when executing. The value can be "all", "finest", "finer", "fine",
     * "info", "warning", "severe" or "off". The value is case insensitive.
     * 
     * @parameter expression="${liquibase.logging}" default-value="INFO"
     * @description Controls the verbosity of the plugin when executing
     */
    protected String logging;

    /**
     * The Liquibase properties file used to configure the Liquibase {@link liquibase.Liquibase}.
     * 
     * @parameter expression="${liquibase.propertyFile}"
     */
    protected String propertyFile;

    /**
     * Flag allowing for the Liquibase properties file to override any settings provided in the Maven plugin
     * configuration. By default if a property is explicity specified it is not overridden if it also appears in the
     * properties file.
     * 
     * @parameter expression="${liquibase.propertyFileWillOverride}" default-value="false"
     */
    protected boolean propertyFileWillOverride;

    /**
     * Flag for forcing the checksums to be cleared from the DatabaseChangeLog table.
     * 
     * @parameter expression="${liquibase.clearCheckSums}" default-value="false"
     */
    protected boolean clearCheckSums;

    /**
     * Any properties provided here, will be set as System properties
     * 
     * @parameter
     */
    protected Properties systemProperties;

    /**
     * The Maven project the plugin is running under.
     * 
     * @parameter expression="${project}"
     * @required
     * @readonly
     */
    protected MavenProject project;

    /**
     * The {@link Liquibase} object used to modify the database.
     */
    private Liquibase liquibase;

    /**
     * Any properties specified here are passed through to Liquibase as change log parameters
     * 
     * @parameter
     */
    private Properties expressionVars;

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

    protected Database getDatabaseObject() throws DatabaseException {
        String pw = ((password == null) ? "" : password);
        ClassLoader cl = this.getClass().getClassLoader();
        return CommandLineUtils.createDatabaseObject(cl, url, username, pw, driver, defaultSchemaName, databaseClass,
                null);
    }

    protected Liquibase getLiquibaseObject(Database database) throws MojoExecutionException {
        Liquibase liquibase = createLiquibase(getFileOpener(this.getClass().getClassLoader()), database);

        if (expressionVars == null) {
            return liquibase;
        }
        getLog().debug("expressionVars = " + String.valueOf(expressionVars));
        for (Map.Entry<Object, Object> var : expressionVars.entrySet()) {
            liquibase.setChangeLogParameter(var.getKey().toString(), var.getValue());
        }
        return liquibase;
    }

    protected boolean isConfirmExecution(Liquibase liquibase) throws DatabaseException {
        if (!isPromptOnNonLocalDatabase()) {
            return true;
        }
        if (liquibase.isSafeToRunMigration()) {
            return true;
        }

        return UIFactory.getInstance().getFacade().promptForNonLocalDatabase(liquibase.getDatabase());
    }

    @Override
    public void execute() throws MojoExecutionException, MojoFailureException {
        getLog().info(MavenUtils.LOG_SEPARATOR);

        if (skip) {
            getLog().info("Skipping execution due to Maven configuration");
            return;
        }

        updateCredentials();
        addToSystemProperties();
        updateLiquibaseLoggingLevel();
        displayMojoSettings();

        Database database = null;
        try {
            database = getDatabaseObject();
            this.liquibase = getLiquibaseObject(database);

            getLog().info("Executing on Database: " + url);

            if (!isConfirmExecution(liquibase)) {
                throw new LiquibaseException("User decided not to run against non-local database");
            }

            if (clearCheckSums) {
                getLog().info("Clearing the Liquibase Checksums on the database");
                liquibase.clearCheckSums();
            }

            performLiquibaseTask(liquibase);
        } catch (LiquibaseException e) {
            throw new MojoExecutionException("Error setting up or running Liquibase: " + e.getMessage(), e);
        } finally {
            cleanup(database);
        }
        getLog().info(MavenUtils.LOG_SEPARATOR);
    }

    protected Liquibase getLiquibase() {
        return liquibase;
    }

    protected abstract void performLiquibaseTask(Liquibase liquibase) throws LiquibaseException;

    protected boolean isPromptOnNonLocalDatabase() {
        return promptOnNonLocalDatabase;
    }

    private void displayMojoSettings() {
        if (verbose) {
            getLog().info(MavenUtils.LOG_SEPARATOR);
            printSettings("    ");
            getLog().info(MavenUtils.LOG_SEPARATOR);
        }
    }

    protected Liquibase createLiquibase(ResourceAccessor fo, Database db) throws MojoExecutionException {
        try {
            return new Liquibase("", fo, db);
        } catch (LiquibaseException ex) {
            throw new MojoExecutionException("Error creating liquibase: " + ex.getMessage(), ex);
        }
    }

    public void configureFieldsAndValues(ResourceAccessor fo) throws MojoExecutionException, MojoFailureException {
        // Load the properties file if there is one, but only for values that the user has not
        // already specified.
        if (propertyFile != null) {
            getLog().info("Parsing Liquibase Properties File");
            getLog().info("  File: " + propertyFile);
            try {
                InputStream is = fo.getResourceAsStream(propertyFile);
                if (is == null) {
                    throw new MojoFailureException("Failed to resolve the properties file.");
                }
                parsePropertiesFile(is);
                getLog().info(MavenUtils.LOG_SEPARATOR);
            } catch (IOException e) {
                throw new MojoExecutionException("Failed to resolve properties file", e);
            }
        }
    }

    protected ClassLoader getMavenArtifactClassLoader() throws MojoExecutionException {
        try {
            return MavenUtils.getArtifactClassloader(project, includeArtifact, includeTestOutputDirectory, getClass(),
                    getLog(), verbose);
        } catch (MalformedURLException e) {
            throw new MojoExecutionException("Failed to create artifact classloader", e);
        }
    }

    protected ResourceAccessor getFileOpener(ClassLoader cl) {
        ResourceAccessor mFO = new MavenResourceAccessor(cl);
        ResourceAccessor fsFO = new FileSystemResourceAccessor(project.getBasedir().getAbsolutePath());
        return new CompositeResourceAccessor(mFO, fsFO);
    }

    /**
     * Prints the settings that have been set of defaulted for the plugin. These will only be shown in verbose mode.
     * 
     * @param indent
     *            The indent string to use when printing the settings.
     */
    protected void printSettings(String indent) {
        if (indent == null) {
            indent = "";
        }
        getLog().info(indent + "driver: " + driver);
        getLog().info(indent + "url: " + url);
        getLog().info(indent + "username: " + username);
        getLog().info(indent + "password: " + password);
        getLog().info(indent + "properties file: " + propertyFile);
        getLog().info(indent + "properties file will override? " + propertyFileWillOverride);
        getLog().info(indent + "prompt on non-local database? " + promptOnNonLocalDatabase);
        getLog().info(indent + "clear checksums? " + clearCheckSums);
    }

    protected void cleanup(Database db) {
        // Release any locks that we may have on the database.
        if (getLiquibase() != null) {
            try {
                getLiquibase().forceReleaseLocks();
            } catch (LiquibaseException e) {
                getLog().error(e.getMessage(), e);
            }
        }

        // Clean up the connection
        if (db != null) {
            try {
                db.rollback();
                db.close();
            } catch (DatabaseException e) {
                getLog().error("Failed to close open connection to database.", e);
            }
        }
    }

    /**
     * Parses a properties file and sets the assocaited fields in the plugin.
     * 
     * @param propertiesInputStream
     *            The input stream which is the Liquibase properties that needs to be parsed.
     * @throws org.apache.maven.plugin.MojoExecutionException
     *             If there is a problem parsing the file.
     */
    protected void parsePropertiesFile(InputStream propertiesInputStream) throws MojoExecutionException {
        if (propertiesInputStream == null) {
            throw new MojoExecutionException("Properties file InputStream is null.");
        }
        Properties props = new Properties();
        try {
            props.load(propertiesInputStream);
        } catch (IOException e) {
            throw new MojoExecutionException("Could not load the properties Liquibase file", e);
        }

        for (Iterator<?> it = props.keySet().iterator(); it.hasNext();) {
            String key = null;
            try {
                key = (String) it.next();
                Field field = MavenUtils.getDeclaredField(this.getClass(), key);

                if (propertyFileWillOverride) {
                    getLog().debug("  properties file setting value: " + field.getName());
                    setFieldValue(field, props.get(key).toString());
                } else {
                    if (!isCurrentFieldValueSpecified(field)) {
                        getLog().debug("  properties file setting value: " + field.getName());
                        setFieldValue(field, props.get(key).toString());
                    }
                }
            } catch (Exception e) {
                getLog().info("  '" + key + "' in properties file is not being used by this " + "task.");
            }
        }
    }

    /**
     * This method will check to see if the user has specified a value different to that of the default value. This is
     * not an ideal solution, but should cover most situations in the use of the plugin.
     * 
     * @param f
     *            The Field to check if a user has specified a value for.
     * @return <code>true</code> if the user has specified a value.
     */
    private boolean isCurrentFieldValueSpecified(Field f) throws IllegalAccessException {
        Object currentValue = f.get(this);
        if (currentValue == null) {
            return false;
        }

        Object defaultValue = getDefaultValue(f);
        if (defaultValue == null) {
            return currentValue != null;
        } else {
            // There is a default value, check to see if the user has selected something other
            // than the default
            return !defaultValue.equals(f.get(this));
        }
    }

    private Object getDefaultValue(Field field) throws IllegalAccessException {
        List<Field> allFields = new ArrayList<Field>();
        allFields.addAll(Arrays.asList(getClass().getDeclaredFields()));
        allFields.addAll(Arrays.asList(AbstractLiquibaseMojo2.class.getDeclaredFields()));

        for (Field f : allFields) {
            if (f.getName().equals(field.getName() + DEFAULT_FIELD_SUFFIX)) {
                f.setAccessible(true);
                return f.get(this);
            }
        }
        return null;
    }

    private void setFieldValue(Field field, String value) throws IllegalAccessException {
        if (field.getType().equals(Boolean.class) || field.getType().equals(boolean.class)) {
            field.set(this, Boolean.valueOf(value));
        } else {
            field.set(this, value);
        }
    }

    private void addToSystemProperties() {
        if (systemProperties == null) {
            systemProperties = new Properties();
        }
        // Add all system properties configured by the user
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

    public boolean isIncludeArtifact() {
        return includeArtifact;
    }

    public void setIncludeArtifact(boolean includeArtifact) {
        this.includeArtifact = includeArtifact;
    }

    public boolean isIncludeTestOutputDirectory() {
        return includeTestOutputDirectory;
    }

    public void setIncludeTestOutputDirectory(boolean includeTestOutputDirectory) {
        this.includeTestOutputDirectory = includeTestOutputDirectory;
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

    public String getPropertyFile() {
        return propertyFile;
    }

    public void setPropertyFile(String propertyFile) {
        this.propertyFile = propertyFile;
    }

    public boolean isPropertyFileWillOverride() {
        return propertyFileWillOverride;
    }

    public void setPropertyFileWillOverride(boolean propertyFileWillOverride) {
        this.propertyFileWillOverride = propertyFileWillOverride;
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

    public Properties getExpressionVars() {
        return expressionVars;
    }

    public void setExpressionVars(Properties expressionVars) {
        this.expressionVars = expressionVars;
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

    public void setLiquibase(Liquibase liquibase) {
        this.liquibase = liquibase;
    }

}