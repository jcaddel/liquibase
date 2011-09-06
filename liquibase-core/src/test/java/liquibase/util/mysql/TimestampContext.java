package liquibase.util.mysql;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import liquibase.util.TimeZoneUtil;

public class TimestampContext {
    private static final String ISO_FORMAT = "yyyy-MM-dd HH:mm:ss.SSSZZZZZ";
    private static final SimpleDateFormat UTC_FORMATTER = new SimpleDateFormat(ISO_FORMAT);
    static {
        UTC_FORMATTER.setTimeZone(TimeZoneUtil.UTC);
    }
    SimpleDateFormat nonTimeZoneAwareFormatter;
    SimpleDateFormat timeZoneAwareFormatter;

    public TimestampContext() {
        super();
    }

    public SimpleDateFormat getNonTimeZoneAwareFormatter() {
        return nonTimeZoneAwareFormatter;
    }

    public void setNonTimeZoneAwareFormatter(SimpleDateFormat nonTimeZoneAwareFormatter) {
        this.nonTimeZoneAwareFormatter = nonTimeZoneAwareFormatter;
    }

    public SimpleDateFormat getTimeZoneAwareFormatter() {
        return timeZoneAwareFormatter;
    }

    public void setTimeZoneAwareFormatter(SimpleDateFormat timeZoneAwareFormatter) {
        this.timeZoneAwareFormatter = timeZoneAwareFormatter;
    }

    public Date parseStringNoTimeZone(String s) throws ParseException {
        return nonTimeZoneAwareFormatter.parse(s);
    }

    public Date parseStringWithTimeZone(String s) throws ParseException {
        return timeZoneAwareFormatter.parse(s);
    }

    public String formatWithTimezone(Timestamp timestamp) {
        return timeZoneAwareFormatter.format(timestamp);
    }

    public String formatNoTimezone(Timestamp timestamp) {
        return nonTimeZoneAwareFormatter.format(timestamp);
    }

    public static String formatUTC(Timestamp timestamp) {
        return UTC_FORMATTER.format(timestamp);
    }

    public static Date parseUTC(String s) throws ParseException {
        return UTC_FORMATTER.parse(s);
    }

}
