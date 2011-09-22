package liquibase.snapshot.jvm;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import liquibase.database.Database;
import liquibase.database.core.MySQLDatabase;
import liquibase.database.jvm.JdbcConnection;
import liquibase.database.structure.Column;
import liquibase.database.structure.ForeignKeyInfo;
import liquibase.database.typeconversion.TypeConverter;
import liquibase.database.typeconversion.TypeConverterFactory;
import liquibase.exception.DatabaseException;
import liquibase.util.JdbcUtils;

public class MySQLDatabaseSnapshotGenerator extends JdbcDatabaseSnapshotGenerator {

    /**
     * Table schema cache
     */
    private static Map<String, Map<String, List<String>>> schemaCache = new HashMap<String, Map<String, List<String>>>();

    @Override
    public int getPriority(Database database) {
        return PRIORITY_DATABASE;
    }

    @Override
    public boolean supports(Database database) {
        return database instanceof MySQLDatabase;
    }

    /**
     * MySQL specific implementation
     */
    @Override
    protected void getColumnTypeAndDefValue(Column columnInfo, ResultSet rs, Database database) throws SQLException,
            DatabaseException {

        String columnTypeName = rs.getString("TYPE_NAME");
        String columnName = rs.getString("COLUMN_NAME");
        String tableName = rs.getString("TABLE_NAME");
        String schemaName = rs.getString("TABLE_CAT");

        Map<String, List<String>> tableSchema = new HashMap<String, List<String>>();

        if (!schemaCache.containsKey(tableName)) {

            Statement stmt = null;
            ResultSet rsColumnType = null;
            try {
                stmt = ((JdbcConnection) database.getConnection()).getUnderlyingConnection().createStatement();
                rsColumnType = stmt.executeQuery("DESC " + database.escapeTableName(schemaName, tableName));

                while (rsColumnType.next()) {
                    List<String> colSchema = new ArrayList<String>();
                    colSchema.add(rsColumnType.getString("Type"));
                    colSchema.add(rsColumnType.getString("Default"));
                    tableSchema.put(rsColumnType.getString("Field"), colSchema);
                }
            } finally {
                JdbcUtils.closeResultSet(rsColumnType);
                JdbcUtils.closeStatement(stmt);
            }
            schemaCache.put(tableName, tableSchema);
        }

        tableSchema = schemaCache.get(tableName);

        // Parse ENUM and SET column types correctly
        if (columnTypeName.toLowerCase().startsWith("enum") || columnTypeName.toLowerCase().startsWith("set")) {

            columnInfo.setTypeName(tableSchema.get(columnName).get(0));
            try {
                TypeConverterFactory factory = TypeConverterFactory.getInstance();
                TypeConverter converter = factory.findTypeConverter(database);

                Object defaultValue = tableSchema.get(columnName).get(1);
                int dataType = columnInfo.getDataType();
                int columnSize = columnInfo.getColumnSize();
                int decimalDigits = columnInfo.getDecimalDigits();
                String tmpDefaultValue = (String) converter.convertDatabaseValueToObject(defaultValue, dataType,
                        columnSize, decimalDigits, database);
                // this just makes explicit the following implicit behavior defined in the mysql docs:
                // "If an ENUM column is declared to permit NULL, the NULL value is a legal value for
                // the column, and the default value is NULL. If an ENUM column is declared NOT NULL,
                // its default value is the first element of the list of permitted values."
                if (tmpDefaultValue == null && columnInfo.isNullable()) {
                    columnInfo.setDefaultValue("NULL");
                }
                // column is NOT NULL, and this causes no "DEFAULT VALUE XXX" to be generated at all. per
                // the above from MySQL docs, this will cause the first value in the enumeration to be the
                // default.
                else if (tmpDefaultValue == null) {
                    columnInfo.setDefaultValue(null);
                } else {
                    columnInfo.setDefaultValue("'" + database.escapeStringForDatabase(tmpDefaultValue) + "'");
                }
            } catch (ParseException e) {
                throw new DatabaseException(e);
            }

            // TEXT and BLOB column types always have null as default value
        } else if (columnTypeName.toLowerCase().equals("text") || columnTypeName.toLowerCase().equals("blob")) {
            columnInfo.setTypeName(columnTypeName);
            columnInfo.setDefaultValue(null);

            // Parsing TIMESTAMP database.convertDatabaseValueToObject() produces incorrect results
            // eg. for default value 0000-00-00 00:00:00 we have 0002-11-30T00:00:00.0 as parsing result
        } else if (columnTypeName.toLowerCase().equals("timestamp")
                && !"CURRENT_TIMESTAMP".equals(tableSchema.get(columnName).get(1))) {
            columnInfo.setTypeName(columnTypeName);
            columnInfo.setDefaultValue(tableSchema.get(columnName).get(1));
        } else {
            super.getColumnTypeAndDefValue(columnInfo, rs, database);
        }
    }

    @Override
    protected String convertPrimaryKeyName(String pkName) throws SQLException {
        if (pkName.equals("PRIMARY")) {
            return null;
        } else {
            return pkName;
        }
    }

    @Override
    protected ForeignKeyInfo fillForeignKeyInfo(ResultSet rs) throws DatabaseException, SQLException {
        ForeignKeyInfo fkinfo = super.fillForeignKeyInfo(rs);
        // MySQL in reality doesn't has schemas. It has databases that can have relations like schemas.
        fkinfo.setPkTableSchema(convertFromDatabaseName(rs.getString("PKTABLE_CAT")));
        fkinfo.setFkSchema(convertFromDatabaseName(rs.getString("FKTABLE_CAT")));
        return fkinfo;
    }

}
