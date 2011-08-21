package liquibase.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.SortedMap;
import java.util.TimeZone;
import java.util.TreeMap;

/**
 * Various timezone related utility methods
 *
 * @author Jeff Caddel
 */
public class TimeZoneUtil {

    public static final int MILLIS_PER_HOUR = 1000 * 60 * 60;
    public static final String ETC_GMT_FRAGMENT = "Etc/GMT";
    public static final String ISO_OFFSET_FRAGMENT = ":00";
    private static final SortedMap<String, TimeZone> TIMEZONES = getAvailableTimeZones();
    private static final List<TimeZone> TIMEZONELIST = getTimeZonesByUTCOffset();
    private static final int MIN_UTC_OFFSET = TIMEZONELIST.get(0).getRawOffset() / MILLIS_PER_HOUR;
    private static final int SIZE = TIMEZONELIST.size();
    private static final int MAX_UTC_OFFSET = TIMEZONELIST.get(SIZE - 1).getRawOffset() / MILLIS_PER_HOUR;

    /**
     * Return the maximum offset in hours from UTC known to this JVM
     */
    public int getMaxUTCOffset() {
        return MAX_UTC_OFFSET;
    }

    /**
     * Return the minimum offset in hours from UTC known to this JVM
     */
    public int getMinUTCOffset() {
        return MIN_UTC_OFFSET;
    }

    /**
     * Return a map of all available timezones sorted by timezone id
     */
    public static SortedMap<String, TimeZone> getAvailableTimeZones() {
        SortedMap<String, TimeZone> timeZones = new TreeMap<String, TimeZone>();
        String[] timeZoneIds = TimeZone.getAvailableIDs();
        for (String timeZoneId : timeZoneIds) {
            timeZones.put(timeZoneId, TimeZone.getTimeZone(timeZoneId));
        }
        return timeZones;
    }

    /**
     * Return a list of all available timezones sorted by raw offset from UTC
     */
    public static List<TimeZone> getTimeZonesByUTCOffset() {
        List<TimeZone> timeZones = new ArrayList<TimeZone>(TIMEZONES.values());
        Collections.sort(timeZones, new RawOffsetComparator());
        return timeZones;
    }

    /**
     * Return the TimeZone for this id. Return null if there is not an exact match on one of the timezones supplied with
     * the JDK. Note, this is a different behavior than the TimeZone.getTimeZone() method supplied with the JDK. If that
     * method does not come up with a match for the timezone id, it silently returns UTC.
     */
    public TimeZone getTimeZone(String timeZoneId) {
        return TIMEZONES.get(timeZoneId);
    }

    /**
     * Given an offset in hours from UTC, return the id of the corresponding Etc/GMT timezone. One important thing to
     * understand about this timezone notation is that a UTC offset of -7 returns the timezone Etc/GMT+7. The sign of
     * the offset is reversed.
     */
    public String getEtcGMTTimeZoneId(int offset) {
        validateUTCOffset(offset);
        return ETC_GMT_FRAGMENT + getSign(offset * -1) + Math.abs(offset);
    }

    /**
     * Given an offset in hours from UTC, return the corresponding Etc/GMT timezone. One important thing to understand
     * about this timezone notation is that a UTC offset of -7 returns the timezone Etc/GMT+7. The sign of the offset is
     * reversed.
     */
    public TimeZone getEtcGMTTimeZone(int offset) {
        validateUTCOffset(offset);
        String timeZoneId = getEtcGMTTimeZoneId(offset);
        return TIMEZONES.get(timeZoneId);
    }

    /**
     * Given a TimeZone, return the raw offset in hours to UTC
     */
    public int getUTCOffsetInHours(TimeZone timeZone) {
        return timeZone.getRawOffset() / MILLIS_PER_HOUR;
    }

    /**
     * Given an offset in hours from UTC, return the ISO 8601 notation for the offset.
     *
     * <pre>
     * -10 translates to -10:00
     *  -1 translates to -01:00
     *   0 translates to +00:00
     *   1 translates to +01:00
     *  10 translates to +10:00
     * </pre>
     */
    public String getUTCOffset(int offset) {
        validateUTCOffset(offset);
        StringBuilder sb = new StringBuilder();
        sb.append(getSign(offset));
        sb.append(getPaddedAbsoluteValue(offset));
        sb.append(ISO_OFFSET_FRAGMENT);
        return sb.toString();
    }

    /**
     * Return true if this is a valid offset in hours from UTC.
     */
    public boolean isValidUTCOffset(int offset) {
        return offset >= MIN_UTC_OFFSET && offset <= MAX_UTC_OFFSET;
    }

    /**
     * Throw IllegalArgumentException if this offset is not a valid offset in hours from UTC
     */
    protected void validateUTCOffset(int offset) {
        if (!isValidUTCOffset(offset)) {
            throw new IllegalArgumentException("Invalid UTC offset: '" + offset + "'  Valid values fall between "
                    + MIN_UTC_OFFSET + " and " + MAX_UTC_OFFSET + " inclusive");
        }
    }

    /**
     * Given an offset in hours from UTC, return the 2 digit absolute value of the offset
     *
     * <pre>
     * -10 translates to 10
     *  -1 translates to 01
     *   0 translates to 00
     *   1 translates to 01
     *  10 translates to 10
     * </pre>
     */
    protected String getPaddedAbsoluteValue(int offset) {
        validateUTCOffset(offset);
        int abs = Math.abs(offset);
        return (abs < 10) ? "0" + abs : abs + "";
    }

    /**
     * Return the sign of the integer passed in
     *
     * <pre>
     *  -1 returns "-"
     *   0 returns "+"
     *   1 returns "+"
     * </pre>
     */
    protected String getSign(int value) {
        return (value >= 0) ? "+" : "-";
    }

    /**
     * Print some information about the TimeZone to System.out
     */
    public void showTimeZone(String description, TimeZone timeZone) {
        int offset = timeZone.getRawOffset() / MILLIS_PER_HOUR;
        System.out.println("-----------------------------");
        System.out.println(description + " Timezone: " + timeZone.getID());
        System.out.println("UTC Offset: " + getUTCOffset(offset));
        System.out.println("-----------------------------");
    }
}
