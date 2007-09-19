package liquibase.change;

import liquibase.database.DB2Database;
import liquibase.database.Database;
import liquibase.database.MSSQLDatabase;
import liquibase.database.sql.SqlStatement;
import liquibase.database.sql.RawSqlStatement;
import liquibase.database.structure.DatabaseObject;
import liquibase.database.structure.Index;
import liquibase.database.structure.Table;
import liquibase.exception.UnsupportedChangeException;
import liquibase.util.StringUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.util.*;

/**
 * Creates an index on an existing column.
 */
public class CreateIndexChange extends AbstractChange {

    private String tableName;
    private String indexName;
    private String tablespace;
    private List<ColumnConfig> columns;


    public CreateIndexChange() {
        super("createIndex", "Create Index");
        columns = new ArrayList<ColumnConfig>();
    }

    public String getIndexName() {
        return indexName;
    }

    public void setIndexName(String indexName) {
        this.indexName = indexName;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public List<ColumnConfig> getColumns() {
        return columns;
    }

    public void setColumns(List<ColumnConfig> columns) {
        this.columns = columns;
    }

    public void addColumn(ColumnConfig column) {
        columns.add(column);
    }


    public String getTablespace() {
        return tablespace;
    }

    public void setTablespace(String tablespace) {
        this.tablespace = tablespace;
    }

    public SqlStatement[] generateStatements(Database database) throws UnsupportedChangeException {
        StringBuffer buffer = new StringBuffer();
        buffer.append("CREATE INDEX ");
        buffer.append(getIndexName()).append(" ON ");
        buffer.append(getTableName()).append("(");
        Iterator<ColumnConfig> iterator = columns.iterator();
        while (iterator.hasNext()) {
            ColumnConfig column = (ColumnConfig) iterator.next();
            buffer.append(column.getName());
            if (iterator.hasNext()) {
                buffer.append(", ");
            }
        }
        buffer.append(")");

        if (StringUtils.trimToNull(tablespace) != null && database.supportsTablespaces()) {
            if (database instanceof MSSQLDatabase) {
                buffer.append(" ON ").append(tablespace);
            } else if (database instanceof DB2Database) {
                // cannot add indexes to tablespace in DB2
            } else {
                buffer.append(" TABLESPACE ").append(tablespace);
            }
        }
        return new SqlStatement []{new RawSqlStatement(buffer.toString())};
    }

    protected Change[] createInverses() {
        DropIndexChange inverse = new DropIndexChange();
        inverse.setTableName(getTableName());
        inverse.setIndexName(getIndexName());

        return new Change[]{
                inverse
        };
    }

    public String getConfirmationMessage() {
        return "Index " + indexName + " has been created";
    }

    public Element createNode(Document currentChangeLogFileDOM) {
        Element element = currentChangeLogFileDOM.createElement("createIndex");
        element.setAttribute("indexName", getIndexName());
        element.setAttribute("tableName", getTableName());

        for (ColumnConfig column : getColumns()) {
            Element columnElement = currentChangeLogFileDOM.createElement("column");
            columnElement.setAttribute("name", column.getName());
            element.appendChild(columnElement);
        }

        return element;
    }

    public Set<DatabaseObject> getAffectedDatabaseObjects() {
        Index index = new Index();
        index.setTableName(tableName);
        index.setName(indexName);

        Table table= new Table();
        table.setName(tableName);
        
        return new HashSet<DatabaseObject>(Arrays.asList(index, table));
    }

}