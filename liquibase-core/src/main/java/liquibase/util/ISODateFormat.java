package liquibase.util;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Convert ISO formatted date strings into date objects and vice versa. Strings produced by this class contain UTC
 * offset information. The strings can be read in by a JVM on a server with a different timezone without any loss of
 * data.
 */
public class ISODateFormat {

    private SimpleDateFormat dateTimeFormat = new SimpleDateFormat(DATE_TIME_FORMAT);
    private SimpleDateFormat dateTimeFormatWithDecimal = new SimpleDateFormat(DATE_TIME_FORMAT_WITH_DECIMAL);
    private SimpleDateFormat dateTimeFormatWithSpace = new SimpleDateFormat(DATE_TIME_FORMAT_WITH_SPACE);
    private SimpleDateFormat timeFormat = new SimpleDateFormat(TIME_FORMAT);
    private SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);
    public static final String DATE_FORMAT = "yyyy-MM-ddZZZZZ";
    public static final String TIME_FORMAT = "HH:mm:ssZZZZZ";
    public static final String DATE_TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ssZZZZZ";
    public static final String DATE_TIME_FORMAT_WITH_SPACE = "yyyy-MM-dd HH:mm:ssZZZZZ";
    public static final String DATE_TIME_FORMAT_WITH_DECIMAL = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ";

    public String format(java.sql.Date date) {
        return dateFormat.format(date);
    }

    public String format(java.sql.Time date) {
        return timeFormat.format(date);
    }

    public String format(java.sql.Timestamp date) {
        return dateTimeFormatWithDecimal.format(date);
    }

    public String format(Date date) {
        if (date instanceof java.sql.Date) {
            return format(((java.sql.Date) date));
        } else if (date instanceof Time) {
            return format(((java.sql.Time) date));
        } else if (date instanceof java.sql.Timestamp) {
            return format(((java.sql.Timestamp) date));
        } else {
            throw new RuntimeException("Unknown type: " + date.getClass().getName());
        }
    }

    public Date parse(String dateAsString) throws ParseException {
        SimpleDateFormat dateTimeFormat = this.dateTimeFormat;

        if (dateAsString.indexOf('.') >= 0) {
            dateTimeFormat = this.dateTimeFormatWithDecimal;
        } else if (dateAsString.indexOf(' ') >= 0) {
            dateTimeFormat = this.dateTimeFormatWithSpace;
        }

        if (dateAsString.length() != dateFormat.toPattern().length()
                && dateAsString.length() != timeFormat.toPattern().length()) {
            return new java.sql.Timestamp(dateTimeFormat.parse(dateAsString).getTime());
        } else {
            if (dateAsString.indexOf(':') > 0) {
                return new java.sql.Time(timeFormat.parse(dateAsString).getTime());
            } else {
                return new java.sql.Date(dateFormat.parse(dateAsString).getTime());
            }
        }
    }
}
