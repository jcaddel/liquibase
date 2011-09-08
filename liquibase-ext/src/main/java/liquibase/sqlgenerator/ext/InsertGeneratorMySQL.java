package liquibase.sqlgenerator.ext;

import liquibase.database.Database;
import liquibase.database.core.MySQLDatabase;
import liquibase.sqlgenerator.core.InsertGenerator;
import liquibase.statement.core.InsertStatement;
import liquibase.util.StringUtils;

public class InsertGeneratorMySQL extends InsertGenerator {
    private static final int PRIORITY = 6;

    boolean flatten = true;

    @Override
    public int getPriority() {
        return PRIORITY;
    }

    @Override
    public boolean supports(InsertStatement statement, Database database) {
        return database instanceof MySQLDatabase;
    }

    public boolean isFlatten() {
        return flatten;
    }

    public void setFlatten(boolean flatten) {
        this.flatten = flatten;
    }

    protected boolean isShouldFlatten(String value) {
        if (!flatten) {
            return false;
        }
        int cr = value.indexOf('\r');
        int lf = value.indexOf('\n');
        return cr >= 0 || lf >= 0;
    }

    @Override
    protected String getStringSqlValue(String value, Database database) {
        if (!isShouldFlatten(value)) {
            return super.getStringSqlValue(value, database);
        }
        String cr = StringUtils.LIQUIBASE_CR;
        String lf = StringUtils.LIQUIBASE_LF;
        String flattened = StringUtils.flatten(value);
        String escapedAndQuoted = super.getStringSqlValue(flattened, database);
        return "replace(replace(" + escapedAndQuoted + ",'" + cr + "','\\r'),'" + lf + "','\\n')";

    }
}
