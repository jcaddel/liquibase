package liquibase.sqlgenerator.core;

import java.util.Date;

import liquibase.database.Database;
import liquibase.database.typeconversion.TypeConverter;
import liquibase.database.typeconversion.TypeConverterFactory;
import liquibase.exception.ValidationErrors;
import liquibase.sql.Sql;
import liquibase.sql.UnparsedSql;
import liquibase.sqlgenerator.SqlGeneratorChain;
import liquibase.statement.core.InsertStatement;

public class InsertGenerator extends AbstractSqlGenerator<InsertStatement> {

    @Override
    public ValidationErrors validate(InsertStatement insertStatement, Database database,
            SqlGeneratorChain sqlGeneratorChain) {
        ValidationErrors validationErrors = new ValidationErrors();
        validationErrors.checkRequiredField("tableName", insertStatement.getTableName());
        validationErrors.checkRequiredField("columns", insertStatement.getColumnValues());

        if (insertStatement.getSchemaName() != null && !database.supportsSchemas()) {
            validationErrors.addError("Database does not support schemas");
        }

        return validationErrors;
    }

    protected String getInsertIntoFragment(InsertStatement statement, Database database) {
        String tableName = database.escapeTableName(statement.getSchemaName(), statement.getTableName());
        StringBuffer sb = new StringBuffer();
        sb.append("INSERT INTO ");
        sb.append(tableName);
        sb.append(" (");
        sb.append(getColumnNamesFragment(statement, database));
        return sb.toString();
    }

    protected String getColumnNamesFragment(InsertStatement statement, Database database) {
        StringBuffer sb = new StringBuffer();
        for (String column : statement.getColumnValues().keySet()) {
            String columnName = database.escapeColumnName(statement.getSchemaName(), statement.getTableName(), column);
            sb.append(columnName);
            sb.append(", ");
        }
        sb.deleteCharAt(sb.lastIndexOf(" "));
        sb.deleteCharAt(sb.lastIndexOf(","));
        return sb.toString();
    }

    protected String getValuesFragment(InsertStatement statement, Database database) {
        StringBuilder sb = new StringBuilder();
        for (String column : statement.getColumnValues().keySet()) {
            String sqlValue = getSqlValue(statement.getColumnValues().get(column), database);
            sb.append(sqlValue);
            sb.append(", ");
        }
        sb.deleteCharAt(sb.lastIndexOf(" "));
        sb.deleteCharAt(sb.lastIndexOf(","));
        return sb.toString();
    }

    @Override
    public Sql[] generateSql(InsertStatement statement, Database database, SqlGeneratorChain sqlGeneratorChain) {
        StringBuffer sql = new StringBuffer();
        sql.append(getInsertIntoFragment(statement, database));
        sql.append(") VALUES (");
        sql.append(getValuesFragment(statement, database));
        sql.append(")");
        return new Sql[] { new UnparsedSql(sql.toString()) };
    }

    protected String getSqlValue(Object newValue, Database database) {
        TypeConverter converter = TypeConverterFactory.getInstance().findTypeConverter(database);
        if (newValue == null || newValue.toString().equalsIgnoreCase("NULL")) {
            return "NULL";
        } else if (newValue instanceof String) {
            return getStringSqlValue((String) newValue, database);
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

    protected String getStringSqlValue(String value, Database database) {
        if (!database.shouldQuoteValue(value)) {
            return value;
        }
        return "'" + database.escapeStringForDatabase(value) + "'";
    }
}
