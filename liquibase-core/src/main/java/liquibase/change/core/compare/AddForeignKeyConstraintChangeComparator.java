package liquibase.change.core.compare;

import java.util.Comparator;

import liquibase.change.core.AddForeignKeyConstraintChange;

public class AddForeignKeyConstraintChangeComparator implements Comparator<AddForeignKeyConstraintChange> {
    public static final int BOTH_ARE_NOT_NULL = 2;

    @Override
    public int compare(AddForeignKeyConstraintChange one, AddForeignKeyConstraintChange two) {
        int nullCompare = compareNull(one, two);
        if (nullCompare != BOTH_ARE_NOT_NULL) {
            return nullCompare;
        }
        String table1 = one.getBaseTableName();
        String table2 = two.getBaseTableName();

        String name1 = one.getConstraintName();
        String name2 = two.getConstraintName();

        int tableCompare = compare(table1, table2);
        int nameCompare = compare(name1, name2);

        return tableCompare == 0 ? nameCompare : tableCompare;
    }

    protected int compare(String one, String two) {
        int nullCompare = compareNull(one, two);
        return (nullCompare == BOTH_ARE_NOT_NULL) ? one.compareTo(two) : nullCompare;
    }

    protected int compareNull(Object one, Object two) {
        // They are both null and therefore equal
        if (one == null && two == null) {
            return 0;
        }
        // One is less than two (null is less than not null)
        if (one == null && two != null) {
            return -1;
        }
        // One is greater than two (not null is greater than null)
        if (one != null && two == null) {
            return 1;
        }

        // Neither one is null
        return BOTH_ARE_NOT_NULL;
    }

}
