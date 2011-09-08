package liquibase.sqlgenerator.ext;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.SortedMap;

import liquibase.database.Database;
import liquibase.database.core.OracleDatabase;
import liquibase.sql.Sql;
import liquibase.sql.UnparsedSql;
import liquibase.sqlgenerator.SqlGeneratorChain;
import liquibase.statement.core.InsertStatement;
import liquibase.statement.core.InsertStatementColumn;
import liquibase.util.SqlType;
import liquibase.util.StringUtils;

public class InsertGeneratorOracle extends FlattenInsertGenerator {
    private static final int MAX_CLOB_LENGTH = 4000;

    @Override
    public boolean supports(InsertStatement statement, Database database) {
        return database instanceof OracleDatabase;
    }

    protected boolean isGiantClob(InsertStatementColumn column) {
        if (!isClob(column)) {
            return false;
        }
        if (!(column.getValue() instanceof String)) {
            return false;
        }
        String text = (String) column.getValue();
        return text.length() > MAX_CLOB_LENGTH;
    }

    protected boolean isClob(InsertStatementColumn column) {
        return column.getType().equals(SqlType.CLOB);
    }

    protected boolean containsGiantClob(InsertStatement statement) {
        Collection<InsertStatementColumn> columns = statement.getColumns().values();
        for (InsertStatementColumn column : columns) {
            if (isGiantClob(column)) {
                return true;
            }
        }
        return false;
    }

    protected String getSqlValue(InsertStatementColumn column, Database database) {
        if (isGiantClob(column)) {
            return "EMPTY_CLOB()";
        } else {
            return super.getSqlValue(column.getValue(), database);
        }
    }

    @Override
    protected String getValuesFragment(InsertStatement statement, Database database) {
        if (!containsGiantClob(statement)) {
            return super.getValuesFragment(statement, database);
        }
        StringBuilder sb = new StringBuilder();
        SortedMap<String, InsertStatementColumn> columns = statement.getColumns();
        for (String key : columns.keySet()) {
            InsertStatementColumn column = columns.get(key);
            String sqlValue = getSqlValue(column, database);
            sb.append(sqlValue);
            sb.append(", ");
        }
        sb.deleteCharAt(sb.lastIndexOf(","));
        sb.deleteCharAt(sb.lastIndexOf(" "));
        return sb.toString();
    }

    @Override
    public Sql[] generateSql(InsertStatement statement, Database database, SqlGeneratorChain sqlGeneratorChain) {
        // Determine if this insert statement has any oversized clobs that are going to require special handling
        List<InsertStatementColumn> giantClobs = getGiantClobs(statement);

        // If not, no special handling required
        if (giantClobs.size() == 0) {
            return super.generateSql(statement, database, sqlGeneratorChain);
        }

        Sql[] normalSql = super.generateSql(statement, database, sqlGeneratorChain);

        List<Sql> list = new ArrayList<Sql>(Arrays.asList(normalSql));
        list.addAll(getSql(giantClobs, database, statement));
        return list.toArray(new Sql[list.size()]);
    }

    protected List<Sql> getSql(List<InsertStatementColumn> clobs, Database database, InsertStatement statement) {
        List<Sql> sql = new ArrayList<Sql>();
        for (InsertStatementColumn clob : clobs) {
            sql.addAll(getSql(clob, database, statement));
        }
        return sql;

    }

    protected List<Sql> getSql(InsertStatementColumn clobColumn, Database database, InsertStatement statement) {
        boolean flattened = false;
        String text = (String) clobColumn.getValue();
        if (isShouldFlatten(text)) {
            text = StringUtils.flatten(text);
            clobColumn.setValue(text);
            flattened = true;
        }
        List<Sql> sql = new ArrayList<Sql>();
        int chunkCount = getChunkCount(text);
        int length = text.length();
        StringBuilder sb = new StringBuilder();
        sb.append("-- Length: " + length + "\n");
        sb.append("-- Chunks: " + chunkCount + "\n");
        if (flattened) {
            sb.append("-- Flattened: " + flattened + "\n");
        }
        sb.append("\n");
        OracleClobContext context = new OracleClobContext();
        context.setClobColumn(clobColumn);
        context.setDatabase(database);
        context.setStatement(statement);
        for (int i = 0; i < chunkCount; i++) {
            sb.append("-- Chunk Number: " + (i + 1) + "\n");
            context.setChunkIndex(i);
            sb.append(getOraclePlSqlFragment(context));
            sql.add(new UnparsedSql(sb.toString()));
            sb = new StringBuilder();
        }

        if (flattened) {
            String updateSql = getUpdateFlattenedClobSQL(context);
            sb = new StringBuilder();
            sb.append("-- Revert Flattened CLOB data\n");
            sb.append(updateSql);
            sql.add(new UnparsedSql(sb.toString()));
        }

        return sql;
    }

    protected String getUpdateFlattenedClobSQL(OracleClobContext context) {
        String schemaName = context.getStatement().getSchemaName();
        String tableName = context.getStatement().getTableName();
        String escapedTableName = context.getDatabase().escapeTableName(schemaName, tableName);
        String columnName = context.getClobColumn().getName();
        String cr = StringUtils.LIQUIBASE_CR;
        String lf = StringUtils.LIQUIBASE_LF;
        StringBuilder sb = new StringBuilder();
        sb.append("UPDATE " + escapedTableName);
        sb.append(" SET " + columnName + " = ");
        sb.append("replace(replace(" + columnName + ",'" + cr + "','\\r'),'" + lf + "','\\n')");
        sb.append(" WHERE " + getWhereClause(context));
        return sb.toString();
    }

    protected List<InsertStatementColumn> getGiantClobs(InsertStatement statement) {
        List<InsertStatementColumn> list = new ArrayList<InsertStatementColumn>();
        for (InsertStatementColumn column : statement.getColumns().values()) {
            if (isGiantClob(column)) {
                list.add(column);
            }
        }
        return list;
    }

    protected String getChunk(String text, int chunkIndex) {
        int length = text.length();
        int beginIndex = chunkIndex * MAX_CLOB_LENGTH;
        int endIndex = Math.min(beginIndex + MAX_CLOB_LENGTH, length);
        return text.substring(beginIndex, endIndex);
    }

    protected String getOraclePlSqlFragment(OracleClobContext context) {
        String schemaName = context.getStatement().getSchemaName();
        String tableName = context.getStatement().getTableName();
        String escapedTableName = context.getDatabase().escapeTableName(schemaName, tableName);
        String text = (String) context.getClobColumn().getValue();
        String textChunk = getChunk(text, context.getChunkIndex());
        String sqlValue = getStringSqlValue(textChunk, context.getDatabase());
        StringBuilder sb = new StringBuilder();
        sb.append("DECLARE    data CLOB; buffer VARCHAR2(32000);\n");
        sb.append("BEGIN\n");
        sb.append("    SELECT " + context.getClobColumn().getName() + " INTO data FROM " + escapedTableName + "\n");
        sb.append("    WHERE " + getWhereClause(context) + "\n");
        sb.append("    FOR UPDATE;\n");
        sb.append("    buffer := " + sqlValue + ";\n");
        sb.append("    DBMS_LOB.writeappend(data,LENGTH(buffer),buffer);\n");
        sb.append("END;");
        return sb.toString();
    }

    protected List<InsertStatementColumn> getPrimaryKeys(OracleClobContext context) {
        List<InsertStatementColumn> pks = new ArrayList<InsertStatementColumn>();
        for (InsertStatementColumn column : context.getStatement().getColumns().values()) {
            if (column.isPrimaryKey()) {
                pks.add(column);
            }
        }
        return pks;
    }

    protected String getWhereClause(OracleClobContext context) {
        List<InsertStatementColumn> pks = getPrimaryKeys(context);

        StringBuilder sb = new StringBuilder();
        for (InsertStatementColumn pk : pks) {
            sb.append(pk.getName());
            sb.append(" = ");
            sb.append(getSqlValue(pk, context.getDatabase()));
            sb.append(" AND");
        }
        sb.deleteCharAt(sb.lastIndexOf(" "));
        sb.deleteCharAt(sb.lastIndexOf("A"));
        sb.deleteCharAt(sb.lastIndexOf("N"));
        sb.deleteCharAt(sb.lastIndexOf("D"));
        return sb.toString();
    }

    protected int getChunkCount(String value) {
        int length = value.length();
        double count = Math.ceil((length * 1D) / MAX_CLOB_LENGTH);
        return new Double(count).intValue();
    }
}
