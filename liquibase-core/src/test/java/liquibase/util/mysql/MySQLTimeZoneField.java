package liquibase.util.mysql;

/**
 * Helper class for building a SQL statement used to query MySQL for its timezone information
 *
 * See http://dev.mysql.com/doc/refman/5.6/en/time-zone-support.html for more information about this
 */
public enum MySQLTimeZoneField {
    /**
     * This defaults to the timezone of the host machine MySQL is running on unless otherwise specified at startup. Once
     * MySQL has started, this value does not change.
     */
    SYSTEM("@@system_time_zone", "systemTimeZone"),

    /**
     * This is the timezone used by MySQL. Unless otherwise specified at startup, it initially has the value 'SYSTEM'
     * meaning MySQL should use the value from system_time_zone. It can be altered at runtime by users with the SUPER
     * privilege.
     */
    GLOBAL("@@global.time_zone", "globalTimeZone"),

    /**
     * This is the timezone used by the current connection. This initially has the same value as global.time_zone. It
     * can be altered at runtime by the client, but doing so only affects the timezone MySQL uses for that clients
     * currrent connection.
     */
    SESSION("@@session.time_zone", "sessionTimeZone"),

    /**
     * This function produces an offset from UTC in minutes for the current connection.
     */
    OFFSET("timestampdiff(minute,utc_timestamp,current_timestamp)", "sessionOffsetFromUTC");

    private final String select;
    private final String column;

    MySQLTimeZoneField(String select, String column) {
        this.select = select;
        this.column = column;
    }

    public String getSelect() {
        return this.select;
    }

    public String getColumn() {
        return this.column;
    }

}
