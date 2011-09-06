package liquibase.util.mysql;

import liquibase.util.TimeZoneUtil;

public class MySQL {
    private static TimeZoneUtil tzu = new TimeZoneUtil();

    /**
     * SQL query that provides timezone information about the MySQL server we are connecting to
     */
    public static final String getMySQLTimeZoneQuery() {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT ");
        for (MySQLTimeZoneField field : MySQLTimeZoneField.values()) {
            sb.append(field.getSelect() + " as " + field.getColumn() + "\n , ");
        }
        sb.deleteCharAt(sb.lastIndexOf(" "));
        sb.deleteCharAt(sb.lastIndexOf(","));
        sb.deleteCharAt(sb.lastIndexOf(" "));
        sb.deleteCharAt(sb.lastIndexOf("\n"));
        return sb.toString();
    }

    /**
     * Return a SQL statement that will set the currently connected session to a timezone with the indicated UTC offset
     */
    public static final String getSetSessionTimeZoneSql(int offset) {
        return getSetTimeZoneSql("SESSION", offset);
    }

    /**
     * Return a SQL statement that will set the MySQL timezone (GLOBAL or SESSION) to the indicated UTC offset
     */
    public static final String getSetTimeZoneSql(String level, int offset) {
        String iso8601Offset = tzu.getISONotationFromMillis(offset);
        return "SET " + level + " time_zone='" + iso8601Offset + "'";
    }

}
