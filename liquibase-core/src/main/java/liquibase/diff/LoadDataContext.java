package liquibase.diff;

import java.util.List;
import java.util.Map;

import liquibase.database.structure.Table;
import liquibase.util.SqlType;

public class LoadDataContext {
    Table table;
    List<String> columnNames;
    List<SqlType> columnTypes;
    List<Map<String, Object>> data;

    String schema;

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

    public List<String> getColumnNames() {
        return columnNames;
    }

    public void setColumnNames(List<String> columnNames) {
        this.columnNames = columnNames;
    }

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

    public List<Map<String, Object>> getData() {
        return data;
    }

    public void setData(List<Map<String, Object>> data) {
        this.data = data;
    }

    public List<SqlType> getColumnTypes() {
        return columnTypes;
    }

    public void setColumnTypes(List<SqlType> columnTypes) {
        this.columnTypes = columnTypes;
    }
}
