package liquibase.database.ext;

import liquibase.Constants;
import liquibase.database.DelimiterStyle;

public class MySQLDatabase extends liquibase.database.core.MySQLDatabase {
    public static final DelimiterStyle DEFAULT_DELIMITER_STYLE = DelimiterStyle.DEFAULT;

    public MySQLDatabase() {
        super();
        setDelimiterStyle(DEFAULT_DELIMITER_STYLE);
    }

    @Override
    public int getPriority() {
        return Constants.DEFAULT_EXT_PRIORITY;
    }

    @Override
    public boolean supportsSequences() {
        return true;
    }

}
