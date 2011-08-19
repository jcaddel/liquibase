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

    @Override
    public Sql[] generateSql(InsertStatement statement, Database database, SqlGeneratorChain sqlGeneratorChain) {
        StringBuffer sql = new StringBuffer("INSERT INTO "
                + database.escapeTableName(statement.getSchemaName(), statement.getTableName()) + " (");
        for (String column : statement.getColumnValues().keySet()) {
            sql.append(database.escapeColumnName(statement.getSchemaName(), statement.getTableName(), column)).append(
                    ", ");
        }
        sql.deleteCharAt(sql.lastIndexOf(" "));
        sql.deleteCharAt(sql.lastIndexOf(","));

        sql.append(") VALUES (");

        for (String column : statement.getColumnValues().keySet()) {
            String sqlValue = getSqlValue(statement.getColumnValues().get(column), database);
            sql.append(sqlValue);
            sql.append(", ");
        }

        sql.deleteCharAt(sql.lastIndexOf(" "));
        sql.deleteCharAt(sql.lastIndexOf(","));

        sql.append(")");

        return new Sql[] { new UnparsedSql(sql.toString()) };
    }

    protected String getSqlValue(Object newValue, Database database) {
        TypeConverter converter = TypeConverterFactory.getInstance().findTypeConverter(database);
        if (newValue == null || newValue.toString().equalsIgnoreCase("NULL")) {
            return "NULL";
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
