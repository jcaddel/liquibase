package liquibase.sqlgenerator.core;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import liquibase.database.Database;
import liquibase.database.core.CacheDatabase;
import liquibase.database.core.DB2Database;
import liquibase.database.core.DerbyDatabase;
import liquibase.database.core.H2Database;
import liquibase.database.core.MSSQLDatabase;
import liquibase.database.core.MySQLDatabase;
import liquibase.database.core.SQLiteDatabase;
import liquibase.database.core.SybaseASADatabase;
import liquibase.database.core.SybaseDatabase;
import liquibase.database.structure.Column;
import liquibase.database.structure.Table;
import liquibase.database.typeconversion.TypeConverterFactory;
import liquibase.exception.UnexpectedLiquibaseException;
import liquibase.exception.ValidationErrors;
import liquibase.sql.Sql;
import liquibase.sql.UnparsedSql;
import liquibase.sqlgenerator.SqlGeneratorChain;
import liquibase.sqlgenerator.SqlGeneratorFactory;
import liquibase.statement.ColumnConstraint;
import liquibase.statement.ForeignKeyConstraint;
import liquibase.statement.core.AddColumnStatement;
import liquibase.statement.core.AddForeignKeyConstraintStatement;

public class AddColumnGenerator extends AbstractSqlGenerator<AddColumnStatement> {

    @Override
    public ValidationErrors validate(AddColumnStatement statement, Database database,
            SqlGeneratorChain sqlGeneratorChain) {
        ValidationErrors validationErrors = new ValidationErrors();

        validationErrors.checkRequiredField("columnName", statement.getColumnName());
        validationErrors.checkRequiredField("columnType", statement.getColumnType());
        validationErrors.checkRequiredField("tableName", statement.getTableName());

        if (statement.isPrimaryKey()
                && (database instanceof CacheDatabase || database instanceof H2Database
                        || database instanceof DB2Database || database instanceof DerbyDatabase || database instanceof SQLiteDatabase)) {
            validationErrors.addError("Cannot add a primary key column");
        }

        if (database instanceof MySQLDatabase && statement.isAutoIncrement() && !statement.isPrimaryKey()) {
            validationErrors.addError("Cannot add a non-primary key identity column");
        }
        return validationErrors;
    }

    @Override
    public Sql[] generateSql(AddColumnStatement statement, Database database, SqlGeneratorChain sqlGeneratorChain) {

        String alterTable = "ALTER TABLE "
                + database.escapeTableName(statement.getSchemaName(), statement.getTableName())
                + " ADD "
                + database.escapeColumnName(statement.getSchemaName(), statement.getTableName(),
                        statement.getColumnName())
                + " "
                + TypeConverterFactory.getInstance().findTypeConverter(database)
                        .getDataType(statement.getColumnType(), statement.isAutoIncrement());

        if (statement.isAutoIncrement() && database.supportsAutoIncrement()) {
            alterTable += " " + database.getAutoIncrementClause(null, null); // startWith and incrementBy not supported
        }

        if (!statement.isNullable()) {
            alterTable += " NOT NULL";
        } else {
            if (database instanceof SybaseDatabase || database instanceof SybaseASADatabase) {
                alterTable += " NULL";
            }
        }

        if (statement.isPrimaryKey()) {
            alterTable += " PRIMARY KEY";
        }

        if (statement.isUnique()) {
            alterTable += " UNIQUE ";
        }

        alterTable += getDefaultClause(statement, database);

        List<Sql> returnSql = new ArrayList<Sql>();
        returnSql.add(new UnparsedSql(alterTable, new Column().setTable(
                new Table(statement.getTableName()).setSchema(statement.getSchemaName())).setName(
                statement.getColumnName())));

        addForeignKeyStatements(statement, database, returnSql);

        return returnSql.toArray(new Sql[returnSql.size()]);
    }

    protected void addForeignKeyStatements(AddColumnStatement statement, Database database, List<Sql> returnSql) {
        for (ColumnConstraint constraint : statement.getConstraints()) {
            if (constraint instanceof ForeignKeyConstraint) {
                ForeignKeyConstraint fkConstraint = (ForeignKeyConstraint) constraint;
                Matcher referencesMatcher = Pattern.compile("([\\w\\._]+)\\(([\\w_]+)\\)").matcher(
                        fkConstraint.getReferences());
                if (!referencesMatcher.matches()) {
                    throw new UnexpectedLiquibaseException("Don't know how to find table and column names from "
                            + fkConstraint.getReferences());
                }
                String refSchemaName = null;
                String refTableName = referencesMatcher.group(1);
                if (refTableName.indexOf(".") > 0) {
                    refSchemaName = refTableName.split("\\.")[0];
                    refTableName = refTableName.split("\\.")[0];
                }
                String refColName = referencesMatcher.group(2);

                AddForeignKeyConstraintStatement addForeignKeyConstraintStatement = new AddForeignKeyConstraintStatement(
                        fkConstraint.getForeignKeyName(), statement.getSchemaName(), statement.getTableName(),
                        statement.getColumnName(), refSchemaName, refTableName, refColName);
                returnSql.addAll(Arrays.asList(SqlGeneratorFactory.getInstance().generateSql(
                        addForeignKeyConstraintStatement, database)));
            }
        }
    }

    private String getDefaultClause(AddColumnStatement statement, Database database) {
        String clause = "";
        Object defaultValue = statement.getDefaultValue();
        if (defaultValue != null) {
            if (database instanceof MSSQLDatabase) {
                clause += " CONSTRAINT "
                        + ((MSSQLDatabase) database).generateDefaultConstraintName(statement.getTableName(),
                                statement.getColumnName());
            }
            clause += " DEFAULT "
                    + TypeConverterFactory.getInstance().findTypeConverter(database).getDataType(defaultValue)
                            .convertObjectToString(defaultValue, database);
        }
        return clause;
    }

}
