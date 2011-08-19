package liquibase.diff;

import java.util.List;
import java.util.Map;

import liquibase.database.structure.Table;

public class LoadDataContext {
    Table table;
    List<Map<String, Object>> data;

    String schema;

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
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

}
