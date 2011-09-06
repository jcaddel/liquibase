package liquibase.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
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

    public static final int MILLIS_PER_MINUTE = 1000 * 60;
    public static final int MILLIS_PER_HOUR = MILLIS_PER_MINUTE * 60;
    public static final String UTC_ID = "UTC";
    public static final char[] PLUS_MINUS = { '+', '-' };
    public static final char[] INTEGER = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
    private final String ETC_GMT_FRAGMENT = "Etc/GMT";
    private final SortedMap<String, TimeZone> timeZoneMap = getTimeZoneMap();
    private final List<TimeZone> timeZoneList = getTimeZoneList();
    private final List<TimeZone> etcGMTList = getEtcGMTList();
    private final int minUtcOffset = timeZoneList.get(0).getRawOffset();
    private final int maxUtcOffset = timeZoneList.get(timeZoneList.size() - 1).getRawOffset();
    private final int maxIdLength = 32;

    public TimeZone getUTC() {
        return timeZoneMap.get(UTC_ID);
    }

    /**
     * Set the JVM to a new default TimeZone. This is done by calling TimeZone.setDefault(null) and then setting the
     * system property "user.timezone" to the id of the timezone passed in. Once those steps are taken,
     * TimeZone.getDefault() has essentially been "reset". The next time it is invoked, it uses it's internal rules to
     * figure out what timezone to use, and the system property "wins".
     */
    public void setJVMTimeZone(TimeZone timeZone) {
        TimeZone.setDefault(null);
        System.setProperty("user.timezone", timeZone.getID());
        TimeZone.getDefault();
    }

    /**
     * Return the maximum raw offset in milliseconds from UTC known to this JVM
     */
    public int getMaxRawUTCOffset() {
        return maxUtcOffset;
    }

    /**
     * Return the minimum raw offset in milliseconds from UTC known to this JVM
     */
    public int getMinRawUTCOffset() {
        return minUtcOffset;
    }

    /**
     * Return a map of all available timezones sorted by timezone id
     */
    public SortedMap<String, TimeZone> getTimeZoneMap() {
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
    public List<TimeZone> getTimeZoneList() {
        List<TimeZone> timeZoneList = new ArrayList<TimeZone>(getTimeZoneMap().values());
        Collections.sort(timeZoneList, new RawOffsetComparator());
        return timeZoneList;
    }

    public boolean isEtcGMTTimeZoneId(String timeZoneId) {
        return timeZoneId.startsWith(ETC_GMT_FRAGMENT);
    }

    /**
     * Return a list of all Etc/GMT time zones sorted by raw offset from UTC
     */
    public List<TimeZone> getEtcGMTList() {
        List<TimeZone> timeZones = getTimeZoneList();
        List<TimeZone> etcGMTList = new ArrayList<TimeZone>();
        for (TimeZone timeZone : timeZones) {
            if (isEtcGMTTimeZoneId(timeZone.getID())) {
                etcGMTList.add(timeZone);
            }
        }
        return etcGMTList;
    }

    /**
     * Return the TimeZone for this id. Return null if there is not an exact match on one of the timezones supplied with
     * the JDK. Note, this is a different behavior than the TimeZone.getTimeZone() method supplied with the JDK. If that
     * method does not come up with a match for the timezone id, it silently returns UTC.
     */
    public TimeZone getTimeZone(String timeZoneId) {
        return timeZoneMap.get(timeZoneId);
    }

    /**
     * Given the ISO notation for an offset from UTC (+00:00/-00:00), return the Etc/GMT timezone corresponding to that
     * offset. This method throws IllegalArgumentException if the string is not valid ISO notation for a valid offset
     * from UTC. To avoid an exception being thrown, use the isValidEtcGMTTimeZone() before calling this method. If that
     * method returns true, this method will successfully return an Etc/GMT timezone
     */
    public TimeZone getEtcGMTTimeZone(String utcOffset) {
        validateISONotation(utcOffset);
        int offset = getMillisFromISONotation(utcOffset);
        return getEtcGMTTimeZone(offset);
    }

    /**
     * Return true if the ISO notation for a UTC offset can successfully be translated to an Etc/GMT timezone, false
     * otherwise
     */
    public boolean isValidEtcGMTTimeZone(String utcOffset) {
        if (!isValidISONotation(utcOffset)) {
            return false;
        }
        int offset = getMillisFromISONotation(utcOffset);
        return isValidEtcGMTRawOffset(offset);
    }

    /**
     * Return true if offset matches a raw offset for one of the known Etc/GMT timezones, false otherwise.
     */
    public boolean isValidEtcGMTRawOffset(int offset) {
        for (TimeZone timeZone : etcGMTList) {
            if (offset == timeZone.getRawOffset()) {
                return true;
            }
        }
        return false;
    }

    /**
     * Throw IllegalArgumentException if the offset passed in does not match an offset for a known Etc/GMT timezone
     */
    protected void validateEtcGMTOffset(int offset) {
        if (!isValidEtcGMTRawOffset(offset)) {
            throw new IllegalArgumentException(offset + " is not a valid " + ETC_GMT_FRAGMENT + " offset");
        }
    }

    /**
     * Given an offset in milliseconds from UTC, return the id of the corresponding Etc/GMT timezone. One important
     * thing to understand about this timezone notation is that a UTC offset of -7 hours returns the timezone Etc/GMT+7.
     * The sign of the offset is reversed.
     */
    public String getEtcGMTTimeZoneId(int offset) {
        validateEtcGMTOffset(offset);
        int hours = getHours(offset);
        return ETC_GMT_FRAGMENT + getSign(hours * -1) + Math.abs(hours);
    }

    protected boolean isWholeMinute(int offset) {
        return (offset % MILLIS_PER_MINUTE) == 0;
    }

    protected boolean isWholeHour(int offset) {
        return (offset % MILLIS_PER_HOUR) == 0;
    }

    /**
     * Given an offset in milliseconds from UTC, return the corresponding Etc/GMT timezone. One important thing to
     * understand about this timezone notation is that a UTC offset of -7 returns the timezone Etc/GMT+7. The sign of
     * the offset in the display name of the timezone is reversed.
     */
    public TimeZone getEtcGMTTimeZone(int offset) {
        validateRawUTCOffset(offset);
        String timeZoneId = getEtcGMTTimeZoneId(offset);
        return timeZoneMap.get(timeZoneId);
    }

    /**
     * Given an offset in milliseconds from UTC, return the ISO 8601 notation for the offset. The output from this
     * method can be provided to the getMillisFromISONotation() method, and vice versa.
     *
     * <pre>
     * -10 translates to -10:00
     *  -1 translates to -01:00
     *   0 translates to +00:00
     *   1 translates to +01:00
     *  10 translates to +10:00
     * </pre>
     */
    public String getISONotationFromMillis(int offset) {
        validateRawUTCOffset(offset);
        int hours = getHours(offset);
        int minutes = getMinutes(offset);
        StringBuilder sb = new StringBuilder();
        sb.append(getSign(offset));
        sb.append(getPaddedTimeValue(hours));
        sb.append(":");
        sb.append(getPaddedTimeValue(minutes));
        return sb.toString();
    }

    /**
     * Return the number of minutes represented by this millisecond value. For example if the milliseconds represent 10
     * hours + 30 minutes, this method returns 30.
     */
    protected int getMinutes(int millis) {
        int hourMillis = getHours(millis) * MILLIS_PER_HOUR;
        int minuteMillis = millis - hourMillis;
        return minuteMillis / MILLIS_PER_MINUTE;
    }

    /**
     * Given the ISO 8601 notation for an offset from UTC, return the offset in milliseconds as an integer. The output
     * of this method can be provided as input to the getISONotationFromMillis() method and vice versa. This method
     * throws IllegalArgumentException if the string passed in is not a valid ISO notation. To avoid an exception being
     * thrown, use isValidISONotation() before invoking this method. If that method returns true, this method will
     * successfully return an integer.
     *
     * <pre>
     * -01:00 translates to -1
     * +00:00 translates to 0
     * -00:00 translates to 0
     * +01:00 translates to 1
     * </pre>
     */
    public int getMillisFromISONotation(String utcOffset) {
        validateISONotation(utcOffset);
        return getMillis(utcOffset.trim());
    }

    /**
     * Throw IllegalArgumentException if the string passed in is not a valid ISO notation for an offset from UTC (eg
     * +00:00, -00:00, -01:00)
     */
    protected void validateISONotation(String utcOffset) {
        if (!isValidISONotation(utcOffset)) {
            throw new IllegalArgumentException(utcOffset + " is not valid ISO notation for an offset from UTC");
        }
    }

    /**
     * Return true if this is a valid 6 character ISO notation for an offset from UTC (eg +00:00, -00:00, -01:00), false
     * otherwise.
     */
    public boolean isValidISONotation(String utcOffset) {
        if (utcOffset == null) {
            return false;
        }
        String trimmed = utcOffset.trim();
        if (trimmed.length() != 6) {
            return false;
        }
        if (trimmed.charAt(3) != ':') {
            return false;
        }
        if (!isInteger(trimmed.charAt(1))) {
            return false;
        }
        if (!isInteger(trimmed.charAt(2))) {
            return false;
        }
        if (!isInteger(trimmed.charAt(4))) {
            return false;
        }
        if (!isInteger(trimmed.charAt(5))) {
            return false;
        }
        int hours = getHours(trimmed);
        int minutes = getMinutes(trimmed);
        int millis = getMillis(hours, minutes);
        return isValidHourValue(hours) && isValidMinuteValue(minutes) && isValidRawUTCOffset(millis);
    }

    /**
     * Convert the ISO notation for an offset from UTC eg +10:00 into the equivalent number of milliseconds
     */
    protected int getMillis(String utcOffset) {
        int hours = getHours(utcOffset);
        int minutes = getMinutes(utcOffset);
        return getMillis(hours, minutes);
    }

    /**
     * Return the number of milliseconds equivalent to the hours/minutes passed in
     */
    protected int getMillis(int hours, int minutes) {
        return (hours * MILLIS_PER_HOUR) + (minutes * MILLIS_PER_MINUTE);
    }

    /**
     * Return true if the integer is 0-59, false otherwise
     */
    protected boolean isValidMinuteValue(int minutes) {
        return minutes >= 0 && minutes < 60;
    }

    /**
     * Return true if this number of hours represents a valid raw offset from UTC for a known timezone
     */
    protected boolean isValidHourValue(int hours) {
        int millis = hours * MILLIS_PER_HOUR;
        return isValidRawUTCOffset(millis);
    }

    /**
     * Return the number of whole hours for this millisecond value
     */
    protected int getHours(int millis) {
        return millis / MILLIS_PER_HOUR;
    }

    /**
     * Parse the hours portion of an ISO notation for raw UTC offset into an integer
     */
    protected int getHours(String utcOffset) {
        String hours = utcOffset.substring(0, 3);
        if (hours.startsWith("+")) {
            hours = hours.substring(1);
        }
        return new Integer(hours);
    }

    /**
     * Parse the minutes portion of an ISO notation for raw UTC offset into an integer
     */
    protected int getMinutes(String utcOffset) {
        String minutes = utcOffset.substring(4, 5);
        return new Integer(minutes);
    }

    /**
     * Return true if targetChar is the same as one of the chars in the array, false otherwise
     */
    protected boolean isMatchingChar(char targetChar, char[] chars) {
        for (char c : chars) {
            if (targetChar == c) {
                return true;
            }
        }
        return false;
    }

    /**
     * Return true if the character passed in is the plus symbol '+' or the minus symbol '-', false otherwise
     */
    protected boolean isPlusMinus(char c) {
        return isMatchingChar(c, PLUS_MINUS);
    }

    /**
     * Return true if the character passed in is 0-9, false otherwise
     */
    protected boolean isInteger(char c) {
        return isMatchingChar(c, INTEGER);
    }

    /**
     * Given a timezone, return the ISO 8601 notation for the raw offset from UTC. eg -10:00, +00:00, etc
     */
    public String getRawUTCOffsetISONotation(TimeZone timeZone) {
        int offset = timeZone.getRawOffset();
        return getISONotationFromMillis(offset);
    }

    /**
     * Given a timezone and a date, return the ISO 8601 notation for the offset from UTC in that timezone at that point
     * in time
     */
    public String getUTCOffsetISONotation(TimeZone timeZone, Date date) {
        int offset = timeZone.getOffset(date.getTime());
        return getISONotationFromMillis(offset);
    }

    /**
     * Return true if this is a valid offset in milliseconds from UTC.
     */
    public boolean isValidRawUTCOffset(int offset) {
        return offset >= minUtcOffset && offset <= maxUtcOffset;
    }

    /**
     * Throw IllegalArgumentException if this offset is not a valid offset in milliseconds from UTC
     */
    protected void validateRawUTCOffset(int offset) {
        if (!isValidRawUTCOffset(offset)) {
            throw new IllegalArgumentException("Invalid UTC offset: '" + offset + "'  Valid values fall between "
                    + minUtcOffset + " and " + maxUtcOffset + " inclusive");
        }
    }

    /**
     * <pre>
     * -10 translates to 10
     *  -1 translates to 01
     *   0 translates to 00
     *   1 translates to 01
     *  10 translates to 10
     * </pre>
     */
    protected String getPaddedTimeValue(int time) {
        int abs = Math.abs(time);
        return (abs < 10) ? "0" + abs : abs + "";
    }

    /**
     * Return the sign of the integer passed in
     *
     * <pre>
     *  -1 and smaller returns "-"
     *   0 returns "+"
     *   1 and greater returns "+"
     * </pre>
     */
    protected String getSign(int value) {
        return (value >= 0) ? "+" : "-";
    }

    /**
     * Returns a table describing all timezones known to this JVM. First column sorted by ID, second column sorted by
     * raw UTC offset.
     */
    public String getLogValue() {
        return getLogValue(timeZoneMap, timeZoneList);
    }

    public String getLogValue(SortedMap<String, TimeZone> map, List<TimeZone> list) {
        String title1 = "Timezones (sorted by name)       Offset";
        String title2 = "Timezones (sorted by offset)     Offset";
        String title = "| " + title1 + " | " + title2 + " |\n";
        String hyphens = "-----------------------------------------";
        String separator = "|" + hyphens + "|" + hyphens + "|\n";
        Iterator<TimeZone> itr1 = map.values().iterator();
        Iterator<TimeZone> itr2 = list.iterator();
        StringBuilder sb = new StringBuilder();
        sb.append(separator);
        sb.append(title);
        sb.append(separator);
        while (itr1.hasNext()) {
            TimeZone tz1 = itr1.next();
            TimeZone tz2 = itr2.next();
            sb.append("| ");
            sb.append(org.apache.commons.lang.StringUtils.rightPad(tz1.getID(), maxIdLength + 1));
            sb.append(getISONotationFromMillis(tz1.getRawOffset()));
            sb.append(" | ");
            sb.append(org.apache.commons.lang.StringUtils.rightPad(tz2.getID(), maxIdLength + 1));
            sb.append(getISONotationFromMillis(tz2.getRawOffset()));
            sb.append(" |");
            sb.append("\n");
        }
        sb.append(separator);
        return sb.toString();
    }

    public String getShortLogValue(TimeZone timeZone) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(timeZone.getID());
        sb.append(":");
        sb.append(getRawUTCOffsetISONotation(timeZone));
        sb.append("]");
        return sb.toString();
    }

    public String getLogValue(TimeZone timeZone) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(timeZone.getID());
        sb.append(":");
        sb.append(timeZone.getDisplayName());
        sb.append(":");
        sb.append(getRawUTCOffsetISONotation(timeZone));
        sb.append("]");
        return sb.toString();
    }

    /**
     * Print some information about the TimeZone to System.out
     */
    public void showTimeZone(String description, TimeZone timeZone) {
        System.out.println(description + " " + getLogValue(timeZone));
    }
}
