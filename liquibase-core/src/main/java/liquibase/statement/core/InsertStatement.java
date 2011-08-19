package liquibase.statement.core;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import liquibase.changelog.conversion.DataType;
import liquibase.statement.AbstractSqlStatement;

public class InsertStatement extends AbstractSqlStatement {
    private String schemaName;
    private String tableName;
    private SortedMap<String, Object> columnValues = new TreeMap<String, Object>();
    private SortedMap<String, DataType> columnTypes = new TreeMap<String, DataType>();
    private Set<String> primaryKeys = new HashSet<String>();

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

    public SortedMap<String, DataType> getColumnTypes() {
        return columnTypes;
    }

    public void setColumnTypes(SortedMap<String, DataType> columnTypes) {
        this.columnTypes = columnTypes;
    }

    public Set<String> getPrimaryKeys() {
        return primaryKeys;
    }

    public void setPrimaryKeys(Set<String> primaryKeys) {
        this.primaryKeys = primaryKeys;
    }
}
