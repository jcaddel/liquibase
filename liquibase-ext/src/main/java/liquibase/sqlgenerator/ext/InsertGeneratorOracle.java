package liquibase.sqlgenerator.ext;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import liquibase.database.Database;
import liquibase.database.core.OracleDatabase;
import liquibase.database.typeconversion.TypeConverter;
import liquibase.database.typeconversion.TypeConverterFactory;
import liquibase.sql.Sql;
import liquibase.sql.UnparsedSql;
import liquibase.sqlgenerator.SqlGeneratorChain;
import liquibase.sqlgenerator.core.InsertGenerator;
import liquibase.statement.core.InsertStatement;

public class InsertGeneratorOracle extends InsertGenerator {
    private static final int MAX_TEXT_LENGTH = 4000;
    private static final int PRIORITY = -1;

    @Override
    public int getPriority() {
        return PRIORITY;
    }

    @Override
    public boolean supports(InsertStatement statement, Database database) {
        return database instanceof OracleDatabase;
    }

    protected boolean isGiantText(Object object) {
        if (!(object instanceof String)) {
            return false;
        }
        String text = (String) object;
        return text.length() > MAX_TEXT_LENGTH;
    }

    protected boolean containsGiantText(Map<String, Object> columnValues) {
        for (String col : columnValues.keySet()) {
            Object value = columnValues.get(col);
            if (isGiantText(value)) {
                return true;
            }
        }
        return false;
    }

    protected String getInsertInto(Database database, InsertStatement statement) {
        String escapedTableName = database.escapeTableName(statement.getSchemaName(), statement.getTableName());
        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO ");
        sb.append(escapedTableName);
        sb.append(" (");
        return sb.toString();
    }

    protected String getColumns(Database database, InsertStatement statement) {
        String schemaName = statement.getSchemaName();
        String tableName = statement.getTableName();
        Set<String> columnNames = statement.getColumnValues().keySet();
        StringBuilder sb = new StringBuilder();
        for (String columnName : columnNames) {
            String escapedColumnName = database.escapeColumnName(schemaName, tableName, columnName);
            sb.append(escapedColumnName + ", ");
        }
        sb.deleteCharAt(sb.lastIndexOf(" "));
        sb.deleteCharAt(sb.lastIndexOf(","));
        return sb.toString();
    }

    @Override
    public Sql[] generateSql(InsertStatement statement, Database database, SqlGeneratorChain sqlGeneratorChain) {
        // Determine if this insert statement requires special handling
        boolean containsGiantText = containsGiantText(statement.getColumnValues());

        // If not, no special handling required
        if (!containsGiantText) {
            return super.generateSql(statement, database, sqlGeneratorChain);
        }

        // Create custom SQL for values bigger than Oracle's 4K limit for SQL statements
        StringBuffer sb = new StringBuffer();
        sb.append(getInsertInto(database, statement));
        sb.append(getColumns(database, statement));
        sb.append(") VALUES (");

        for (String column : statement.getColumnValues().keySet()) {
            // Pull out the raw value
            Object rawValue = statement.getColumnValues().get(column);
            // Convert it to an SQL friendly value
            String sqlValue = getSqlValue(rawValue, database);
            // Add it to the SQL
            sb.append(sqlValue);
            // Append the delimiter
            sb.append(", ");
        }

        // Remove the trailing whitespace and comma
        sb.deleteCharAt(sb.lastIndexOf(" "));
        sb.deleteCharAt(sb.lastIndexOf(","));

        // Close off the sql
        sb.append(")");

        List<NameValue> giantTextFields = getGiantTextFields(statement.getColumnValues());
        List<Sql> list = new ArrayList<Sql>();
        Sql sql = new UnparsedSql(sb.toString());
        list.add(sql);
        list.addAll(getSql(giantTextFields, database, statement));
        return list.toArray(new Sql[list.size()]);
    }

    protected List<Sql> getSql(List<NameValue> giantTextFields, Database database, InsertStatement statement) {
        List<Sql> sql = new ArrayList<Sql>();
        for (NameValue giantTextField : giantTextFields) {
            sql.addAll(getSql(giantTextField, database, statement));
        }
        return sql;

    }

    protected List<Sql> getSql(NameValue giantField, Database database, InsertStatement statement) {
        List<Sql> sql = new ArrayList<Sql>();
        int chunkCount = getChunkCount(giantField.getValue());
        int length = giantField.getValue().length();
        StringBuilder sb = new StringBuilder();
        sb.append("-- Length: " + length + "\n");
        sb.append("-- Chunks: " + chunkCount + "\n");
        for (int i = 0; i < chunkCount; i++) {
            sb.append(getOraclePlSqlFragment(i, giantField, database, statement));
            sql.add(new UnparsedSql(sb.toString()));
            sb = new StringBuilder();
        }
        return sql;
    }

    protected List<NameValue> getGiantTextFields(Map<String, Object> columnValues) {
        List<NameValue> list = new ArrayList<NameValue>();
        for (Map.Entry<String, Object> entry : columnValues.entrySet()) {
            // Pull out the raw value
            Object rawValue = entry.getValue();
            if (!isGiantText(rawValue)) {
                continue;
            }
            String text = (String) rawValue;
            list.add(new NameValue(entry.getKey(), text));
        }
        return list;
    }

    protected String getData(String s, int chunkIndex) {
        int length = s.length();
        int beginIndex = chunkIndex * MAX_TEXT_LENGTH;
        int endIndex = Math.min(beginIndex + MAX_TEXT_LENGTH, length);
        return s.substring(beginIndex, endIndex);
    }

    protected String getOraclePlSqlFragment(int chunkIndex, NameValue pair, Database database, InsertStatement statement) {
        String schemaName = statement.getSchemaName();
        String tableName = statement.getTableName();
        String escapedTableName = database.escapeTableName(schemaName, tableName);
        String data = getData(pair.getValue(), chunkIndex);
        StringBuilder sb = new StringBuilder();
        sb.append("DECLARE    data CLOB; buffer VARCHAR2(32000);\n");
        sb.append("BEGIN\n");
        sb.append("    SELECT " + pair.getName() + " INTO data FROM " + escapedTableName + "\n");
        sb.append("    WHERE \n");
        sb.append(" MSG_QUE_ID = 2340    FOR UPDATE;\n");
        sb.append("    buffer := '" + data + "';\n");
        sb.append("    DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);\n");
        sb.append("END;");
        return sb.toString();
    }

    protected int getChunkCount(String value) {
        int length = value.length();
        double count = Math.ceil((length * 1D) / MAX_TEXT_LENGTH);
        return new Double(count).intValue();
    }

    protected String getSqlValue(Object newValue, Database database) {
        TypeConverter converter = TypeConverterFactory.getInstance().findTypeConverter(database);
        if (newValue == null || newValue.toString().equalsIgnoreCase("NULL")) {
            return "NULL";
        } else if (isGiantText(newValue)) {
            return "EMPTY_CLOB()";
        } else if (newValue instanceof String && database.shouldQuoteValue(((String) newValue))) {
            return "'" + database.escapeStringForDatabase((String) newValue) + "'";
        } else if (newValue instanceof Date) {
            return database.getDateLiteral(((Date) newValue));
        } else if (newValue instanceof Boolean) {
            if (((Boolean) newValue)) {
                return converter.getBooleanType().getTrueBooleanValue();
            } else {
                return converter.getBooleanType().getFalseBooleanValue();
            }
        } else {
            return newValue.toString();
        }
    }
}
