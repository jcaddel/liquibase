package liquibase.sql;

import liquibase.database.structure.DatabaseObject;

import java.util.*;

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

    public String toSql() {
        return sql;
    }

    public String getEndDelimiter() {
        return endDelimiter;
    }

    public Set<? extends DatabaseObject> getAffectedDatabaseObjects() {
        return affectedDatabaseObjects;
    }
}
