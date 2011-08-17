package liquibase.integration.commandline;

import liquibase.database.Database;

public class GenerateChangeLogContext {
    String changeLogFile;
    Database database;
    String schema;
    String diffTypes;
    String author;
    String changeSetContext;
    String dataDir;
    String includes;
    String excludes;

    public String getChangeLogFile() {
        return changeLogFile;
    }

    public void setChangeLogFile(String changeLogFile) {
        this.changeLogFile = changeLogFile;
    }

    public Database getDatabase() {
        return database;
    }

    public void setDatabase(Database originalDatabase) {
        this.database = originalDatabase;
    }

    public String getSchema() {
        return schema;
    }

    public void setSchema(String defaultSchemaName) {
        this.schema = defaultSchemaName;
    }

    public String getDiffTypes() {
        return diffTypes;
    }

    public void setDiffTypes(String diffTypes) {
        this.diffTypes = diffTypes;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getChangeSetContext() {
        return changeSetContext;
    }

    public void setChangeSetContext(String changeSetContext) {
        this.changeSetContext = changeSetContext;
    }

    public String getDataDir() {
        return dataDir;
    }

    public void setDataDir(String dataDir) {
        this.dataDir = dataDir;
    }

    public String getIncludes() {
        return includes;
    }

    public void setIncludes(String includes) {
        this.includes = includes;
    }

    public String getExcludes() {
        return excludes;
    }

    public void setExcludes(String excludes) {
        this.excludes = excludes;
    }

}
