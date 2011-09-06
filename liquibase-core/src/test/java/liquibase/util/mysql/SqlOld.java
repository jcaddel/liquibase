package liquibase.util.mysql;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

import liquibase.util.TimeZoneUtil;

public class SqlOld {
    private static TimeZoneUtil tzu = new TimeZoneUtil();

    /**
     * Select data from the timestamp table that is relevant for our current database offset
     */
    public static final String getSelectSimpleSql(int id) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT id\n");
        sb.append(" , millis\n");
        sb.append(" , jvm_timestamp\n");
        sb.append(" , jvm_time_zone\n");
        sb.append(" , jvm_utc_offset\n");
        sb.append(" , mysql_time_zone\n");
        sb.append("FROM ts\n");
        sb.append("WHERE mysql_time_zone = @@session.time_zone\n");
        sb.append(" AND id = " + id);
        return sb.toString();
    }

    /**
     * Select data from the timestamp table that is relevant for our current database offset
     */
    public static final String getSelectSql(int id) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT jvm_tz\n");
        sb.append(" , millis\n");
        sb.append(" , mysql_iso\n");
        sb.append(" , jvm\n");
        sb.append(" , utc\n");
        sb.append(" , current\n");
        sb.append("FROM ts\n");
        sb.append("WHERE mysql_iso = @@session.time_zone\n");
        sb.append(" AND id = " + id);
        return sb.toString();
    }

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

    /**
     * Return a SQL statement for creating the table we'll need for timestamp testing
     */
    public static final String getCreateSimpleTableSQL() {
        StringBuilder sb = new StringBuilder();
        sb.append("CREATE TABLE ts (id integer\n");
        sb.append(" , millis bigint\n");
        sb.append(" , jvm_timestamp timestamp\n");
        sb.append(" , jvm_utc_offset varchar(6)\n");
        sb.append(" , jvm_time_zone varchar(50)\n");
        sb.append(" , mysql_time_zone varchar(6)\n");
        sb.append(")\n");
        return sb.toString();
    }

    /**
     * Return a SQL statement for creating the table we'll need for timestamp testing
     */
    public static final String getCreateTableSQL() {
        StringBuilder sb = new StringBuilder();
        sb.append("CREATE TABLE ts (id integer\n");
        sb.append(" , jvm_tz varchar(50)\n");
        sb.append(" , millis bigint\n");
        sb.append(" , jvm_raw_offset varchar(6)\n");
        sb.append(" , jvm_offset varchar(6)\n");
        sb.append(" , mysql_iso varchar(6)\n");
        sb.append(" , jvm timestamp\n");
        sb.append(" , utc timestamp\n");
        sb.append(" , current timestamp");
        sb.append(")\n");
        return sb.toString();
    }

    /**
     * Return a SQL statement for inserting values into the timestamp table
     */
    public static final String getInsertSimpleSql() {
        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO ts (id\n");
        sb.append(" , jvm_time_zone\n");
        sb.append(" , jvm_utc_offset\n");
        sb.append(" , millis\n");
        sb.append(" , jvm_timestamp\n");
        sb.append(" , mysql_time_zone\n");
        sb.append(") VALUES (?\n");
        sb.append(" , ?\n");
        sb.append(" , ?\n");
        sb.append(" , ?\n");
        sb.append(" , ?\n");
        sb.append(" , @@session.time_zone\n");
        sb.append(")\n");
        return sb.toString();
    }

    /**
     * Return a SQL statement for inserting values into the timestamp table
     */
    public static final String getInsertSql() {
        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO ts (id\n");
        sb.append(" , jvm_tz\n");
        sb.append(" , millis\n");
        sb.append(" , jvm_raw_offset\n");
        sb.append(" , jvm_offset\n");
        sb.append(" , mysql_iso\n");
        sb.append(" , jvm\n");
        sb.append(" , utc\n");
        sb.append(" , current\n");
        sb.append(") VALUES (?\n");
        sb.append(" , ?\n");
        sb.append(" , ?\n");
        sb.append(" , ?\n");
        sb.append(" , ?\n");
        sb.append(" , @@session.time_zone\n");
        sb.append(" , ?\n");
        sb.append(" , UTC_TIMESTAMP\n");
        sb.append(" , CURRENT_TIMESTAMP)\n");
        return sb.toString();
    }

    public static final List<?> getInsertSimpleValues(TimeZone javaTimeZone, Timestamp timestamp, int id)
            throws SQLException {
        String offset = tzu.getUTCOffsetISONotation(javaTimeZone, timestamp);

        List<Object> values = new ArrayList<Object>();
        values.add(id);
        values.add(javaTimeZone.getID());
        values.add(offset);
        values.add(timestamp.getTime());
        values.add(timestamp);
        return values;
    }

    /**
     * Return 4 values to be inserted into the timestamp table:<br>
     *
     * 1) Our timestamp value formatted as an ISO string in the UTC timezone<br>
     * 2) The id of the TimeZone the JVM is using<br>
     * 3) The ISO notation for offset to UTC for the TimeZone the JVM is using<br>
     * 4) Our timestamp value as a Timestamp object<br>
     */
    public static final List<?> getInsertValues(TimeZone javaTimeZone, Timestamp timestamp, int id) throws SQLException {

        String rawOffset = tzu.getRawUTCOffsetISONotation(javaTimeZone);
        String offset = tzu.getUTCOffsetISONotation(javaTimeZone, timestamp);

        List<Object> values = new ArrayList<Object>();
        values.add(id);
        values.add(javaTimeZone.getID());
        values.add(timestamp.getTime());
        values.add(rawOffset);
        values.add(offset);
        values.add(timestamp);
        return values;
    }
}
