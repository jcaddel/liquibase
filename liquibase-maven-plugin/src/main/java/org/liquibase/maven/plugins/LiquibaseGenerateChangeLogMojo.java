package org.liquibase.maven.plugins;

import java.io.File;
import java.io.IOException;

import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.exception.LiquibaseException;
import liquibase.integration.commandline.CommandLineUtils;
import liquibase.util.file.FilenameUtils;

import org.apache.maven.plugin.MojoExecutionException;
import org.codehaus.plexus.util.StringUtils;

/**
 * This goal takes a snapshot of a JDBC accessible database and creates a Liquibase change log XML file from it
 *
 * @goal generateChangeLog
 */
public class LiquibaseGenerateChangeLogMojo extends AbstractLiquibaseMojo2 {

    private static final String EXPORT_DATA_TYPE = "data";

    /**
     * Specifies the location of the change log file to generate
     *
     * @parameter expression="${liquibase.changeLogFile}"
     *            default-value="${project.build.directory}/liquibase/changelog.xml"
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
     * Specifies the types of database information to include in the change log.
     *
     * @parameter expression="${liquibase.types}"
     *            default-value="tables,columns,views,primaryKeys,uniqueConstraints,indexes,foregnKeys,sequences,data"
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
     * Data from tables is written into this directory in CSV format. If dataDir is not specified, all of the
     * information (schema + data) is written to one XML file
     *
     * @parameter expression="${liquibase.dataDir}" default-value="${project.build.directory}/liquibase/data"
     */
    protected String dataDir;

    @Override
    protected void performTask() throws MojoExecutionException {
        ClassLoader cl = getClass().getClassLoader();
        try {
            createDirectories();
            Database database = CommandLineUtils.createDatabaseObject(cl, url, username, password, driver,
                    defaultSchemaName, databaseClass, driverProperties);

            CommandLineUtils.doGenerateChangeLog(changeLogFile, database, defaultSchemaName, types, author, context,
                    dataDir);
        } catch (Exception e) {
            throw new MojoExecutionException("Liquibase error: " + e.getMessage(), e);
        }
    }

    protected boolean isExportData() {
        if (StringUtils.isEmpty(dataDir)) {
            return false;
        }
        if (StringUtils.isEmpty(types)) {
            return true;
        }
        if (types.indexOf(EXPORT_DATA_TYPE) == -1) {
            return false;
        }
        return true;
    }

    protected void createDirectories() throws IOException {
        createDirectoryFromFilename(changeLogFile);
        if (!isExportData()) {
            return;
        }
        getLog().info("Creating " + dataDir);
        createDir(new File(dataDir));
    }

    protected void createDir(File f) throws IOException {
        if (f.exists()) {
            return;
        }
        if (!f.mkdirs()) {
            throw new IOException("Unable to create directory " + f.getAbsolutePath());
        }
    }

    protected void createDirectoryFromFilename(String filename) throws IOException {
        if (StringUtils.isEmpty(filename)) {
            return;
        }
        File file = new File(filename);
        if (file.exists()) {
            return;
        }
        String path = FilenameUtils.getFullPathNoEndSeparator(filename);
        createDir(new File(path));
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