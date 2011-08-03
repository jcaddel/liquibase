package liquibase.sql;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import liquibase.database.structure.DatabaseObject;

public class UnparsedSql implements Sql {

    private String sql;
    private String endDelimiter;
    private Set<DatabaseObject> affectedDatabaseObjects = new HashSet<DatabaseObject>();

    public UnparsedSql(String sql, DatabaseObject... affectedDatabaseObjects) {
        this(sql, ";", affectedDatabaseObjects);
    }

    public UnparsedSql(String sql, String endDelimiter, DatabaseObject... affectedDatabaseObjects) {
        this.sql = sql.trim();
        this.endDelimiter = endDelimiter;

        this.affectedDatabaseObjects.addAll(Arrays.asList(affectedDatabaseObjects));
        List<DatabaseObject> moreAffectedDatabaseObjects = new ArrayList<DatabaseObject>();

        boolean foundMore = true;
        while (foundMore) {
            for (DatabaseObject object : this.affectedDatabaseObjects) {
                DatabaseObject[] containingObjects = object.getContainingObjects();
                if (containingObjects != null) {
                    for (DatabaseObject containingObject : containingObjects) {
                        if (containingObject != null && !this.affectedDatabaseObjects.contains(containingObject)
                                && !moreAffectedDatabaseObjects.contains(containingObject)) {
                            moreAffectedDatabaseObjects.add(containingObject);
                        }
                    }
                }
            }
            foundMore = moreAffectedDatabaseObjects.size() > 0;
            this.affectedDatabaseObjects.addAll(moreAffectedDatabaseObjects);
            moreAffectedDatabaseObjects.clear();
        }

        this.affectedDatabaseObjects.addAll(moreAffectedDatabaseObjects);
    }

    @Override
    public String toSql() {
        return sql;
    }

    @Override
    public String getEndDelimiter() {
        return endDelimiter;
    }

    @Override
    public Set<? extends DatabaseObject> getAffectedDatabaseObjects() {
        return affectedDatabaseObjects;
    }
}
