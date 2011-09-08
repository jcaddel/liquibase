package liquibase.sqlgenerator.ext;

import liquibase.database.Database;
import liquibase.database.core.MySQLDatabase;
import liquibase.statement.core.InsertStatement;

public class InsertGeneratorMySQL extends FlattenInsertGenerator {
    @Override
    public boolean supports(InsertStatement statement, Database database) {
        return database instanceof MySQLDatabase;
    }
}
