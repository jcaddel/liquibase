package liquibase.database.ext;

import liquibase.database.DelimiterStyle;
import liquibase.util.ISODateFormat;

public class MySQLDatabase extends liquibase.database.core.MySQLDatabase {
    public static final DelimiterStyle ROW = DelimiterStyle.ROW;
    private static final int PRIORITY = 6;
    ISODateFormat isoDateFormatter = new ISODateFormat();

    public MySQLDatabase() {
        super();
        setDelimiterStyle(ROW);
    }

    @Override
    public int getPriority() {
        return PRIORITY;
    }

}
