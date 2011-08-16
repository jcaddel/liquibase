package liquibase.precondition.core;

import liquibase.changelog.ChangeSet;
import liquibase.changelog.DatabaseChangeLog;
import liquibase.database.Database;
import liquibase.exception.DatabaseException;
import liquibase.exception.PreconditionErrorException;
import liquibase.exception.PreconditionFailedException;
import liquibase.exception.ValidationErrors;
import liquibase.exception.Warnings;
import liquibase.precondition.Precondition;
import liquibase.snapshot.DatabaseSnapshot;
import liquibase.snapshot.DatabaseSnapshotGeneratorFactory;
import liquibase.snapshot.SnapshotContext;
import liquibase.util.StringUtils;

public class ForeignKeyExistsPrecondition implements Precondition {
    private String schemaName;
    private String foreignKeyTableName;
    private String foreignKeyName;

    public String getSchemaName() {
        return schemaName;
    }

    public void setSchemaName(String schemaName) {
        this.schemaName = StringUtils.trimToNull(schemaName);
    }

    public String getForeignKeyTableName() {
        return foreignKeyTableName;
    }

    public void setForeignKeyTableName(String foreignKeyTableName) {
        this.foreignKeyTableName = foreignKeyTableName;
    }

    public String getForeignKeyName() {
        return foreignKeyName;
    }

    public void setForeignKeyName(String foreignKeyName) {
        this.foreignKeyName = foreignKeyName;
    }

    @Override
    public Warnings warn(Database database) {
        return new Warnings();
    }

    @Override
    public ValidationErrors validate(Database database) {
        return new ValidationErrors();
    }

    protected DatabaseSnapshot getSnapshot(Database database, String schemaName) throws DatabaseException {
        SnapshotContext context = new SnapshotContext();
        context.setDatabase(database);
        context.setSchema(schemaName);
        DatabaseSnapshotGeneratorFactory factory = DatabaseSnapshotGeneratorFactory.getInstance();
        return factory.createSnapshot(context);
    }

    @Override
    public void check(Database database, DatabaseChangeLog changeLog, ChangeSet changeSet)
            throws PreconditionFailedException, PreconditionErrorException {
        try {
            boolean checkPassed;
            if (getForeignKeyTableName() == null) {
                DatabaseSnapshot snapshot = getSnapshot(database, schemaName);
                checkPassed = snapshot.getForeignKey(getForeignKeyName()) != null;
            } else { // much faster if we can limit to correct table
                checkPassed = DatabaseSnapshotGeneratorFactory
                        .getInstance()
                        .getGenerator(database)
                        .getForeignKeyByForeignKeyTable(getSchemaName(), getForeignKeyTableName(), getForeignKeyName(),
                                database) != null;
            }
            if (!checkPassed) {
                String message = "Foreign Key " + database.escapeStringForDatabase(getForeignKeyName());
                if (getForeignKeyTableName() != null) {
                    message += " on table " + getForeignKeyTableName();
                }
                message += " does not exist";
                throw new PreconditionFailedException(message, changeLog, this);
            }
        } catch (DatabaseException e) {
            throw new PreconditionErrorException(e, changeLog, this);
        }
    }

    @Override
    public String getName() {
        return "foreignKeyConstraintExists";
    }
}