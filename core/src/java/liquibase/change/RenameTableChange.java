package liquibase.change;

import liquibase.database.*;
import liquibase.database.sql.SqlStatement;
import liquibase.database.sql.RawSqlStatement;
import liquibase.database.structure.DatabaseObject;
import liquibase.database.structure.Table;
import liquibase.exception.UnsupportedChangeException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Renames an existing table.
 */
public class RenameTableChange extends AbstractChange {
    private String oldTableName;
    private String newTableName;

    public RenameTableChange() {
        super("renameTable", "Rename Table");
    }

    public String getOldTableName() {
        return oldTableName;
    }

    public void setOldTableName(String oldTableName) {
        this.oldTableName = oldTableName;
    }

    public String getNewTableName() {
        return newTableName;
    }

    public void setNewTableName(String newTableName) {
        this.newTableName = newTableName;
    }


    public SqlStatement[] generateStatements(Database database) throws UnsupportedChangeException {
        if (database instanceof MSSQLDatabase) {
            return new SqlStatement[]{new RawSqlStatement("exec sp_rename '" + oldTableName + "', " + newTableName)};
        } else if (database instanceof MySQLDatabase) {
            return new SqlStatement[]{new RawSqlStatement("ALTER TABLE " + oldTableName + " RENAME " + newTableName)};
        } else if (database instanceof PostgresDatabase) {
            return new SqlStatement[]{new RawSqlStatement("ALTER TABLE " + oldTableName + " RENAME TO " + newTableName)};
        } else if (database instanceof DerbyDatabase) {
            return new SqlStatement[]{new RawSqlStatement("RENAME TABLE " + oldTableName + " TO " + newTableName)};
        } else if (database instanceof HsqlDatabase) {
            return new SqlStatement[]{new RawSqlStatement("ALTER TABLE " + oldTableName + " RENAME TO " + newTableName)};
        } else if (database instanceof DB2Database) {
            return new SqlStatement[]{
                    new RawSqlStatement("RENAME " + oldTableName + " TO " + newTableName),
                    new RawSqlStatement("CALL SYSPROC.ADMIN_CMD ('REORG TABLE " + newTableName + "')"),
            };
        } else if (database instanceof CacheDatabase) {
            throw new UnsupportedChangeException("Rename table not currently supported for Cache");
        }

        return new SqlStatement[]{new RawSqlStatement("RENAME " + oldTableName + " TO " + newTableName)};
    }

    protected Change[] createInverses() {
        RenameTableChange inverse = new RenameTableChange();
        inverse.setOldTableName(getNewTableName());
        inverse.setNewTableName(getOldTableName());

        return new Change[]{
                inverse
        };
    }

    public String getConfirmationMessage() {
        return "Table with the name " + oldTableName + " has been renamed to " + newTableName;
    }

    public Element createNode(Document currentChangeLogFileDOM) {
        Element element = currentChangeLogFileDOM.createElement("renameTable");
        element.setAttribute("oldTableName", getOldTableName());
        element.setAttribute("newTableName", getNewTableName());

        return element;
    }


    public Set<DatabaseObject> getAffectedDatabaseObjects() {
        Table oldTable = new Table();
        oldTable.setName(oldTableName);

        Table newTable = new Table();
        newTable.setName(newTableName);

        return new HashSet<DatabaseObject>(Arrays.asList(oldTable, newTable));
    }
}