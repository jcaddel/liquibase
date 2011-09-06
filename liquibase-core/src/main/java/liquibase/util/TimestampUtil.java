package liquibase.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

/**
 * Various utility methods related to java.sql.Timestamp
 *
 * @author Jeff Caddel
 */
public class TimestampUtil {

    private final TimeZoneUtil timeZoneUtil = new TimeZoneUtil();
    private final String isoFormatNoOffset = "yyyy-MM-dd'T'HH:mm:ss.SSS";
    private final String isoFormat = isoFormatNoOffset + "ZZZZZ";
    private final SimpleDateFormat utcFormatter = getUTCFormatter();
    private final SimpleDateFormat utcFormatterNoOffset = getUTCFormatterNoOffset();

    /**
     * Return true if clocks were moved forward due to Daylight Savings Time during the hour before the time passed in.
     * False otherwise.
     */
    public boolean isAfterDSTMovedForward(long time, TimeZone timeZone) {
        if (!timeZone.useDaylightTime()) {
            return false;
        }
        // Get the amount of time clocks are moved for a DST adjustment
        int dstSavings = timeZone.getDSTSavings();

        // Get the offset to UTC for the time passed in
        int offset = timeZone.getOffset(time);

        // Move the clock back by the amount of time in a DST adjustment
        long previousTime = time - dstSavings;

        // Get the offset to UTC for that moment in time
        int previousOffset = timeZone.getOffset(previousTime);

        // If the previous offset to UTC is smaller than the offset to UTC for the time passed in, clocks were moved
        // forwards because of DST
        return previousOffset < offset;
    }

    /**
     * Return true if clocks were moved backwards due to Daylight Savings Time during the hour after the time passed in.
     * False otherwise.
     */
    public boolean isBeforeDSTMovedBackwards(long time, TimeZone timeZone) {

        // The timezone does not deal with DST
        if (!timeZone.useDaylightTime()) {
            return false;
        }

        // Get the amount of time clocks are moved for a DST adjustment
        int dstSavings = timeZone.getDSTSavings();

        // Get the offset to UTC for the time passed in
        int offset = timeZone.getOffset(time);

        // Move the clock ahead by the amount of time in a DST adjustment
        long futureTime = time + dstSavings;

        // Get the offset to UTC for that moment in time
        int futureOffset = timeZone.getOffset(futureTime);

        // If the future offset to UTC is larger than the offset to UTC for the time passed in, clocks were moved
        // backwards because of DST
        return futureOffset < offset;
    }

    /**
     * Return true if clocks were moved backwards due to Daylight Savings Time during the hour previous to the time
     * passed in. False otherwise.
     */
    public boolean isAfterDSTMovedBackwards(long time, TimeZone timeZone) {

        // The timezone does not deal with DST
        if (!timeZone.useDaylightTime()) {
            return false;
        }

        // Get the amount of time clocks are moved for a DST adjustment
        int dstSavings = timeZone.getDSTSavings();

        // Get the offset to UTC for the time passed in
        int offset = timeZone.getOffset(time);

        // Move the clock back by the amount of time in a DST adjustment
        long previousTime = time - dstSavings;

        // Get the offset to UTC for that moment in time
        int previousOffset = timeZone.getOffset(previousTime);

        // If the previous offset to UTC is larger than the offset to UTC for the time passed in, clocks were moved
        // backwards because of DST
        return previousOffset > offset;
    }

    /**
     * Return true if this timestamp points to a time in this timezone that cannot be represented unambiguously as a
     * string without including UTC offset. This can happen if the timezone has DST adjustments that move the clock
     * backwards. When clocks are moved backwards, the same time occurs twice in that timezone.
     */
    public boolean isAmbiguousWithoutUTCOffset(Timestamp timestamp, TimeZone timeZone) {
        long time = timestamp.getTime();
        return isAfterDSTMovedBackwards(time, timeZone);
    }

    /**
     * Parse a timestamp from an ISO 8601 date/time string that does not contain an offset to UTC. This method assumes
     * the timestamp is in the TimeZone passed in.
     */
    public Timestamp getTimestampNoOffset(String timestamp, TimeZone timeZone) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(isoFormatNoOffset);
        sdf.setTimeZone(timeZone);
        sdf.setLenient(true);
        Date date = sdf.parse(timestamp);
        return new Timestamp(date.getTime());
    }

    /**
     * Parse a timestamp from an ISO 8601 date/time string that does not contain an offset to UTC. This method assumes
     * the timestamp is in the local TimeZone of the current JVM
     */
    public Timestamp getTimestampNoOffset(String timestamp) throws ParseException {
        return getTimestampNoOffset(timestamp, TimeZone.getDefault());
    }

    /**
     * Parse a timestamp from an ISO 8601 date/time string that does not contain an offset to UTC. This method assumes
     * the timestamp is in UTC
     */
    public Timestamp getUTCTimestampNoOffset(String timestamp) throws ParseException {
        Date date = utcFormatterNoOffset.parse(timestamp);
        return new Timestamp(date.getTime());
    }

    /**
     * Parse a timestamp from an ISO 8601 date/time string that contains an offset to UTC
     */
    public Timestamp getTimestamp(String timestamp) throws ParseException {
        Date date = utcFormatter.parse(timestamp);
        return new Timestamp(date.getTime());
    }

    /**
     * Format the timestamp into an ISO 8601 string in UTC but without the +0000 offset portion at the end
     */
    public String getUTCStringNoOffset(Timestamp timestamp) {
        return utcFormatterNoOffset.format(timestamp);
    }

    /**
     * Format the timestamp into an ISO 8601 string for the default TimeZone of the JVM but without the UTC offset
     * portion at the end
     */
    public String getStringNoOffset(Timestamp timestamp) {
        return getStringNoOffset(timestamp, TimeZone.getDefault());
    }

    /**
     * Format the timestamp into an ISO 8601 string for the TimeZone passed in but without the UTC offset portion at the
     * end
     */
    public String getStringNoOffset(Timestamp timestamp, TimeZone timeZone) {
        SimpleDateFormat sdf = new SimpleDateFormat(isoFormatNoOffset);
        sdf.setTimeZone(timeZone);
        return sdf.format(timestamp);
    }

    /**
     * Format the timestamp into an ISO 8601 string in UTC
     */
    public String getUTCString(Timestamp timestamp) {
        return utcFormatter.format(timestamp);
    }

    /**
     * Format the timestamp into an ISO 8601 string using the UTC offset from the default TimeZone of the JVM
     */
    public String getString(Timestamp timestamp) {
        return getString(timestamp, TimeZone.getDefault());
    }

    /**
     * Format the timestamp into an ISO 8601 string using the UTC offset from the TimeZone indicated
     */
    public String getString(Timestamp timestamp, TimeZone timeZone) {
        SimpleDateFormat sdf = new SimpleDateFormat(isoFormat);
        sdf.setTimeZone(timeZone);
        return sdf.format(timestamp);
    }

    /**
     * Return a SimpleDateFormat object that can parse strings using full ISO 8601 time/date notation (including UTC
     * offset). When formatting Timestamp objects always format them using UTC
     */
    protected SimpleDateFormat getUTCFormatter() {
        SimpleDateFormat sdf = new SimpleDateFormat(isoFormat);
        sdf.setTimeZone(timeZoneUtil.getUTC());
        sdf.setLenient(false);
        return sdf;
    }

    /**
     * Return a SimpleDateFormat object that can parse strings in ISO 8601 time/date notation that do not include UTC
     * offset. When formatting Timestamp objects always use UTC but do not include the explicit indicator for a zero
     * offset from UTC (+0000) at the end of the formatted string.
     */
    protected SimpleDateFormat getUTCFormatterNoOffset() {
        SimpleDateFormat sdf = new SimpleDateFormat(isoFormatNoOffset);
        sdf.setTimeZone(timeZoneUtil.getUTC());
        sdf.setLenient(false);
        return sdf;
    }

}
