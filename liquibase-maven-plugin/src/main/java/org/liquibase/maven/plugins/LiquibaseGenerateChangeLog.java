package org.liquibase.maven.plugins;

import static liquibase.integration.commandline.CommandLineUtils.createDatabaseObject;
import static liquibase.integration.commandline.CommandLineUtils.doGenerateChangeLog;
import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.exception.LiquibaseException;

import org.apache.maven.plugin.MojoExecutionException;

/**
 * @goal generateChangeLog
 */
public class LiquibaseGenerateChangeLog extends AbstractLiquibaseMojo2 {

    /**
     * Specifies the location of the change log file to generate
     * 
     * @parameter expression="${liquibase.changeLogFile}" default-value="${project.build.directory}/changelog.xml"
     * @required
     */
    protected String changeLogFile;

    /**
     * Specifies the author of the change log file. Defaults to the system property "user.name" if not specified
     * 
     * @parameter expression="${liquibase.author}"
     */
    protected String author;

    /**
     * Specifies the types of database information to include in the change log. Valid values are tables, columns,
     * views, primaryKeys, uniqueConstraints, indexes, foreignKeys, sequences, and data. Case insensitive. If not
     * specified, all types are included.
     * 
     * @parameter expression="${liquibase.types}"
     */
    protected String types;

    /**
     * Optional parameter for specifying a Liquibase "context" for this change log. Typically something like "dev",
     * "test", "staging", or "prod".
     * 
     * @parameter expression="${liquibase.context}"
     */
    protected String context;

    /**
     * Data from tables is written into this directory in CSV format
     * 
     * @parameter expression="${liquibase.dataDir}" default-value="${project.build.directory}/liquibase/data"
     */
    protected String dataDir;

    @Override
    protected void performTask() throws MojoExecutionException {
        ClassLoader cl = this.getClass().getClassLoader();
        try {
            Database database = createDatabaseObject(cl, url, username, password, driver, defaultSchemaName,
                    databaseClass, driverProperties);

            doGenerateChangeLog(changeLogFile, database, defaultSchemaName, types, author, context, dataDir);
        } catch (Exception e) {
            throw new MojoExecutionException("Liquibase error: " + e.getMessage(), e);
        }
    }

    @Override
    protected void performLiquibaseTask(Liquibase liquibase) throws LiquibaseException {
        // nothing to do
    }

    public String getChangeLogFile() {
        return changeLogFile;
    }

    public void setChangeLogFile(String changeLogFile) {
        this.changeLogFile = changeLogFile;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getDataDir() {
        return dataDir;
    }

    public void setDataDir(String dataDir) {
        this.dataDir = dataDir;
    }

}