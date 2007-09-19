package liquibase.change;

/**
 * This class is resposible for holding the information about all the
 * constraints imposed on the column.
 */
public class ConstraintsConfig {

    private Boolean nullable;
    private Boolean primaryKey;
    private String references;
    private Boolean unique;
    private String check;
    private Boolean deleteCascade;
    private String foreignKeyName;
    private Boolean initiallyDeferred;
    private Boolean deferrable;

    public Boolean isNullable() {
        return nullable;
    }

    public void setNullable(Boolean nullable) {
        this.nullable = nullable;
    }

    public Boolean isPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(Boolean primaryKey) {
        this.primaryKey = primaryKey;
    }

    public String getReferences() {
        return references;
    }

    public void setReferences(String references) {
        this.references = references;
    }

    public Boolean isUnique() {
        return unique;
    }

    public void setUnique(Boolean unique) {
        this.unique = unique;
    }

    public String getCheck() {
        return check;
    }

    public void setCheck(String check) {
        this.check = check;
    }

    public Boolean isDeleteCascade() {
        return deleteCascade;
    }

    public void setDeleteCascade(Boolean deleteCascade) {
        this.deleteCascade = deleteCascade;
    }

    public String getForeignKeyName() {
        return foreignKeyName;
    }

    public void setForeignKeyName(String foreignKeyName) {
        this.foreignKeyName = foreignKeyName;
    }

    public Boolean isInitiallyDeferred() {
        return initiallyDeferred;
    }

    public void setInitiallyDeferred(Boolean initiallyDeferred) {
        this.initiallyDeferred = initiallyDeferred;
    }

    public Boolean isDeferrable() {
        return deferrable;
    }

    public void setDeferrable(Boolean deferrable) {
        this.deferrable = deferrable;
    }
}