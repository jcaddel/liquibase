package liquibase.database.ext;

import liquibase.database.DelimiterStyle;

public class OracleDatabase extends liquibase.database.core.OracleDatabase {
    public static final String SLASH = "/";
    public static final DelimiterStyle ROW = DelimiterStyle.ROW;
    private static final int PRIORITY = 6;

    public OracleDatabase() {
        super();
        setDelimiter(SLASH);
        setDelimiterStyle(ROW);
    }

    @Override
    public int getPriority() {
        return PRIORITY;
    }
}
