package liquibase.migrator.change;

import liquibase.database.Database;
import liquibase.migrator.exception.UnsupportedChangeException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Inserts data into an existing table.
 */
public class InsertDataChange extends AbstractChange {

    private String tableName;
    private List<ColumnConfig> columns;

    public InsertDataChange() {
        super("insert", "Insert Row");
        columns = new ArrayList<ColumnConfig>();
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

    public void removeColumn(ColumnConfig column) {
        columns.remove(column);
    }

    public String[] generateStatements(Database database) throws UnsupportedChangeException {
        StringBuffer buffer = new StringBuffer();
        buffer.append("INSERT INTO ").append(getTableName()).append(" ");
        Iterator iterator = columns.iterator();
        StringBuffer columnNames = new StringBuffer();
        StringBuffer columnValues = new StringBuffer();

        columnNames.append("(");
        columnValues.append("(");
        while (iterator.hasNext()) {
            ColumnConfig column = (ColumnConfig) iterator.next();
            columnNames.append(column.getName());

            columnValues.append(getColumnValue(column, database));

            if (iterator.hasNext()) {
                columnNames.append(", ");
                columnValues.append(", ");
            }
        }
        columnNames.append(")");
        columnValues.append(")");
        buffer.append(columnNames);
        buffer.append(" VALUES ");
        buffer.append(columnValues);

        return new String[]{buffer.toString()};
    }

    private String getColumnValue(ColumnConfig column, Database database) {
        if (column.getValue() != null) {
            return "'"+column.getValue().replaceAll("'","''")+"'";
        } else if (column.getValueNumeric() != null) {
            return column.getValueNumeric();
        } else if (column.getValueBoolean() != null) {
            String returnValue;
            if (column.getValueBoolean()) {
                returnValue = database.getTrueBooleanValue();
            } else {
                returnValue = database.getFalseBooleanValue();
            }

            if (returnValue.matches("\\d+")) {
                return returnValue;
            } else {
                return "'"+returnValue+"'";
            }
        } else if (column.getValueDate() != null) {
            return database.getDateLiteral(column.getValueDate());
        } else {
            return "NULL";
        }
    }

    public String getConfirmationMessage() {
        return "New rows have been inserted into the table " + tableName;
    }

    public Element createNode(Document currentChangeLogFileDOM) {
        Element node = currentChangeLogFileDOM.createElement("insert");
        node.setAttribute("tableName", getTableName());

        for (ColumnConfig col : getColumns()) {
            Element subNode = col.createNode(currentChangeLogFileDOM);
            node.appendChild(subNode);
        }
        return node;
    }
}