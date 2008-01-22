package liquibase.parser.visitor;

import liquibase.ChangeSet;
import liquibase.DatabaseChangeLog;
import liquibase.RanChangeSet;
import liquibase.change.Change;
import liquibase.database.Database;
import liquibase.exception.PreconditionFailedException;
import liquibase.exception.SetupException;
import liquibase.preconditions.FailedPrecondition;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ValidatingVisitor implements ChangeSetVisitor {

    private List<ChangeSet> invalidMD5Sums = new ArrayList<ChangeSet>();
    private List<FailedPrecondition> failedPreconditions = new ArrayList<FailedPrecondition>();
    private Set<ChangeSet> duplicateChangeSets = new HashSet<ChangeSet>();
    private List<SetupException> setupExceptions = new ArrayList<SetupException>();

    private Set<String> seenChangeSets = new HashSet<String>();

    private List<RanChangeSet> ranChangeSets;

    public ValidatingVisitor(List<RanChangeSet> ranChangeSets) {
        this.ranChangeSets = ranChangeSets;
    }

    public void checkPreconditions(Database database, DatabaseChangeLog changeLog) {
        try {
            changeLog.getPreconditions().check(database, changeLog);
//            preconditions.check(migrator, new DatabaseChangeLog(migrator, physicalChangeLogLocation));
        } catch (PreconditionFailedException e) {
            failedPreconditions.addAll(e.getFailedPreconditions());
        }
    }

    public Direction getDirection() {
        return ChangeSetVisitor.Direction.FORWARD;
    }

    public void visit(ChangeSet changeSet) {
        for (Change change : changeSet.getChanges()) {
            try {
                change.setUp();
            } catch (SetupException se) {
                setupExceptions.add(se);
            }
        }

        for (RanChangeSet ranChangeSet : ranChangeSets) {
            if (ranChangeSet.getId().equals(changeSet.getId())
                    && ranChangeSet.getAuthor().equals(changeSet.getAuthor())
                    && ranChangeSet.getChangeLog().equals(changeSet.getFilePath())) {
                if (ranChangeSet.getMd5sum() != null && !ranChangeSet.getMd5sum().equals(changeSet.getMd5sum())) {
                    invalidMD5Sums.add(changeSet);
                }
            }
        }

        String changeSetString = changeSet.toString(false);
        if (seenChangeSets.contains(changeSetString)) {
            duplicateChangeSets.add(changeSet);
        } else {
            seenChangeSets.add(changeSetString);
        }
    }

    public List<ChangeSet> getInvalidMD5Sums() {
        return invalidMD5Sums;
    }


    public List<FailedPrecondition> getFailedPreconditions() {
        return failedPreconditions;
    }


    public Set<ChangeSet> getDuplicateChangeSets() {
        return duplicateChangeSets;
    }

    public List<SetupException> getSetupExceptions() {
        return setupExceptions;
    }

    public boolean validationPassed() {
        return invalidMD5Sums.size() == 0
                && failedPreconditions.size() == 0
                && duplicateChangeSets.size() == 0
                && setupExceptions.size() == 0;
    }

}