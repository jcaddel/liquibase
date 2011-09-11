package liquibase.database.ext;

import liquibase.Constants;
import liquibase.database.DelimiterStyle;

public class OracleDatabase extends liquibase.database.core.OracleDatabase {
    public static final String SLASH = "/";
    public static final DelimiterStyle ROW = DelimiterStyle.ROW;

    public OracleDatabase() {
        super();
        setDelimiter(SLASH);
        setDelimiterStyle(ROW);
    }

    @Override
    public int getPriority() {
        return Constants.DEFAULT_EXT_PRIORITY;
    }
}
