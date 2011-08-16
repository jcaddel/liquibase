package liquibase.snapshot;

import java.util.Set;

import liquibase.database.Database;
import liquibase.database.structure.MetadataType;
import liquibase.diff.DiffStatusListener;

public class SnapshotContext {
    Database database;
    String schema;
    Set<DiffStatusListener> listeners;
    Set<MetadataType> metadataTypes;
    Set<String> includes;
    Set<String> excludes;

    public SnapshotContext() {
        this(null, null);
    }

    public SnapshotContext(Database database, String schema) {
        super();
        this.database = database;
        this.schema = schema;
    }

    public Database getDatabase() {
        return database;
    }

    public void setDatabase(Database database) {
        this.database = database;
    }

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

    public Set<DiffStatusListener> getListeners() {
        return listeners;
    }

    public void setListeners(Set<DiffStatusListener> listeners) {
        this.listeners = listeners;
    }

    public Set<MetadataType> getMetadataTypes() {
        return metadataTypes;
    }

    public void setMetadataTypes(Set<MetadataType> metadataTypes) {
        this.metadataTypes = metadataTypes;
    }

    public Set<String> getIncludes() {
        return includes;
    }

    public void setIncludes(Set<String> includes) {
        this.includes = includes;
    }

    public Set<String> getExcludes() {
        return excludes;
    }

    public void setExcludes(Set<String> excludes) {
        this.excludes = excludes;
    }
}
