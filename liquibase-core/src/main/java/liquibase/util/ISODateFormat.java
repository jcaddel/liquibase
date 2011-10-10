package liquibase.util;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Convert ISO formatted date strings into date objects and vice versa. Strings produced by this class representing a
 * timestamp contain UTC offset information. These strings can then be consumed by a JVM on a server with a different
 * timezone while still retaining the exact moment in time they refer to.
 */
public class ISODateFormat {

	public static final String DATE_FORMAT = "yyyy-MM-dd";
	public static final String TIME_FORMAT = "HH:mm:ss";

	public static final String DATE_TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ssZZZZZ";
	public static final String DATE_TIME_FORMAT_NO_OFFSET = "yyyy-MM-dd'T'HH:mm:ss.SSS";
	public static final String DATE_TIME_FORMAT_WITH_DECIMAL1 = "yyyy-MM-dd'T'HH:mm:ss.SZZZZZ";
	public static final String DATE_TIME_FORMAT_WITH_DECIMAL2 = "yyyy-MM-dd'T'HH:mm:ss.SSZZZZZ";
	public static final String DATE_TIME_FORMAT_WITH_DECIMAL3 = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ";

	public static final String DATE_TIME_FORMAT_WITH_SPACE = "yyyy-MM-dd HH:mm:ssZZZZZ";
	public static final String DATE_TIME_FORMAT_WITH_SPACE_AND_DECIMAL1 = "yyyy-MM-dd HH:mm:ss.SZZZZZ";
	public static final String DATE_TIME_FORMAT_WITH_SPACE_AND_DECIMAL2 = "yyyy-MM-dd HH:mm:ss.SSZZZZZ";
	public static final String DATE_TIME_FORMAT_WITH_SPACE_AND_DECIMAL3 = "yyyy-MM-dd HH:mm:ss.SSSZZZZZ";

	SimpleDateFormat timeFormat = new SimpleDateFormat(TIME_FORMAT);
	SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);
	SimpleDateFormat dateTimeFormat = new SimpleDateFormat(DATE_TIME_FORMAT_WITH_DECIMAL3);
	SimpleDateFormat dateTimeFormatNoOffset = new SimpleDateFormat(DATE_TIME_FORMAT_NO_OFFSET);
	String[] iso8601DateTimeFormats = { DATE_TIME_FORMAT, DATE_TIME_FORMAT_WITH_DECIMAL1,
			DATE_TIME_FORMAT_WITH_DECIMAL2, DATE_TIME_FORMAT_WITH_DECIMAL3 };
	String[] otherDateTimeFormats = { DATE_TIME_FORMAT_WITH_SPACE, DATE_TIME_FORMAT_WITH_SPACE_AND_DECIMAL1,
			DATE_TIME_FORMAT_WITH_SPACE_AND_DECIMAL2, DATE_TIME_FORMAT_WITH_SPACE_AND_DECIMAL3 };
	SimpleDateFormat[] iso8601DateTimeParsers = getDateFormatters(iso8601DateTimeFormats);
	SimpleDateFormat[] otherDateTimeParsers = getDateFormatters(otherDateTimeFormats);

	public ISODateFormat() {
		super();
		timeFormat.setLenient(false);
		dateFormat.setLenient(false);
		dateTimeFormat.setLenient(false);
	}

	public String format(java.sql.Date date) {
		return dateFormat.format(date);
	}

	public String format(java.sql.Time date) {
		return timeFormat.format(date);
	}

	public String format(Timestamp date) {
		return dateTimeFormat.format(date);
	}

	public String formatNoOffset(Timestamp date) {
		return dateTimeFormatNoOffset.format(date);
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

	protected boolean isEmpty(String s) {
		return (s == null || "".equals(s.trim()));
	}

	protected boolean isLengthMatch(String s, SimpleDateFormat sdf, int extraChars) {
		if (isEmpty(s)) {
			return false;
		}
		String pattern = sdf.toPattern();
		int length1 = s.trim().length();
		int length2 = pattern.length() - extraChars;
		return length1 == length2;
	}

	protected boolean isLengthMatch(String s, SimpleDateFormat sdf) {
		return isLengthMatch(s, sdf, 0);
	}

	protected boolean isTimeOnly(String dateAsString) {
		return isLengthMatch(dateAsString, timeFormat);
	}

	protected boolean isDateOnly(String dateAsString) {
		return isLengthMatch(dateAsString, dateFormat);
	}

	protected boolean isISO8601Format(String dateAsString) {
		return dateAsString.indexOf("T") == 10;
	}

	protected boolean isOtherFormat(String dateAsString) {
		return dateAsString.indexOf(" ") == 10;
	}

	protected SimpleDateFormat getFormatter(String s, SimpleDateFormat[] formatters, int extraChars) {
		for (SimpleDateFormat formatter : formatters) {
			if (isLengthMatch(s, formatter, extraChars)) {
				return formatter;
			}
		}
		return null;
	}

	protected SimpleDateFormat getFormatter(String dateAsString) {
		if (isISO8601Format(dateAsString)) {
			return getFormatter(dateAsString, iso8601DateTimeParsers, 2);
		}
		if (isOtherFormat(dateAsString)) {
			return getFormatter(dateAsString, otherDateTimeParsers, 0);
		}
		return null;
	}

	public Date parse(String dateAsString) throws ParseException {
		if (isTimeOnly(dateAsString)) {
			return new java.sql.Time(timeFormat.parse(dateAsString).getTime());
		}
		if (isDateOnly(dateAsString)) {
			return new java.sql.Date(dateFormat.parse(dateAsString).getTime());
		}
		SimpleDateFormat sdf = getFormatter(dateAsString);
		if (sdf == null) {
			throw new ParseException("Unknown date/time format " + dateAsString, -1);
		}
		Date date = sdf.parse(dateAsString);
		return new java.sql.Timestamp(date.getTime());
	}

	protected SimpleDateFormat[] getDateFormatters(String[] formats) {
		SimpleDateFormat[] formatters = new SimpleDateFormat[formats.length];
		for (int i = 0; i < formats.length; i++) {
			formatters[i] = new SimpleDateFormat(formats[i]);
			formatters[i].setLenient(false);
		}
		return formatters;
	}
}
