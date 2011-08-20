package liquibase.statement.core;

import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import liquibase.statement.AbstractSqlStatement;

public class InsertStatement extends AbstractSqlStatement {
    private String schemaName;
    private String tableName;
    private SortedMap<String, Object> columnValues = new TreeMap<String, Object>();
    private SortedMap<String, InsertStatementColumn> columns = new TreeMap<String, InsertStatementColumn>();

    public InsertStatement(String schemaName, String tableName) {
        this.schemaName = schemaName;
        this.tableName = tableName;
    }

    public String getSchemaName() {
        return schemaName;
    }

    public String getTableName() {
        return tableName;
    }

    public InsertStatement addColumnValue(String columnName, Object newValue) {
        columnValues.put(columnName, newValue);

        return this;
    }

    public Object getColumnValue(String columnName) {
        return columnValues.get(columnName);
    }

    public Map<String, Object> getColumnValues() {
        return columnValues;
    }

    public void setSchemaName(String schemaName) {
        this.schemaName = schemaName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public void setColumnValues(SortedMap<String, Object> columnValues) {
        this.columnValues = columnValues;
    }

    public SortedMap<String, InsertStatementColumn> getColumns() {
        return columns;
    }

    public void setColumns(SortedMap<String, InsertStatementColumn> columns) {
        this.columns = columns;
    }
}
