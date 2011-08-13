package liquibase.database.ext;

import liquibase.database.DelimiterStyle;

public class MySQLDatabase extends liquibase.database.core.MySQLDatabase {
    public static final DelimiterStyle ROW = DelimiterStyle.ROW;
    private static final int PRIORITY = 6;

    public MySQLDatabase() {
        super();
        setDelimiterStyle(ROW);
    }

    @Override
    public int getPriority() {
        return PRIORITY;
    }
}
