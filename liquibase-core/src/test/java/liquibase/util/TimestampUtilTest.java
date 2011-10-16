package liquibase.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.TimeZone;

import junit.framework.Assert;

import org.junit.Test;

public class TimestampUtilTest {
	long millisPerSecond = 1000;
	long millisPerMinute = 60 * millisPerSecond;
	long millisPerHour = 60 * millisPerMinute;
	long millisPerDay = 24 * millisPerHour;

	TimeZoneUtil tzu = new TimeZoneUtil();
	TimestampUtil tsu = new TimestampUtil();

	/**
	 * Test Java timestamp parsing and formatting when there is a Daylight Savings Time adjustment that moved clocks
	 * forward.<br>
	 *
	 * Clocks in the "America/Los_Angeles" timezone moved forward by an hour at 2am on April 26, 1970. The 2am-3am hour
	 * never happened in this time zone on that day. Clocks ticked over from 1:59:59am to 3:00:00am. However, Java
	 * timestamp parsing routines automatically recognize and convert Strings that describe times from 2am-3am. If you
	 * create a String that references a time during the 2am hour on April 26, 1970, Java automatically converts the
	 * String into the equivalent time for 3am. This means there is more than one way to represent time during the 3am
	 * hour on that day. The strings "1970-04-26 02:30" and "1970-04-26 03:30" both represent "1970-04-26 03:30". This
	 * test verifies the handling of strings representing times that "never happened" due to clocks being moved forward
	 * for Daylight Savings Time.
	 */
	@Test
	public void testDSTMoveForward() throws ParseException {

		// Get a handle to the America/Los_Angeles timezone
		TimeZone losAngeles = tzu.getTimeZone("America/Los_Angeles");

		String value1 = "1970-04-26T02:30:00.000"; // This is 10:30am in UTC
		String value2 = "1970-04-26T03:30:00.000"; // This is 10:30am in UTC as well

		// Create Timestamp objects from the strings
		Timestamp timestamp1 = tsu.getTimestampNoOffset(value1, losAngeles);
		Timestamp timestamp2 = tsu.getTimestampNoOffset(value2, losAngeles);

		// The strings are different, but the Timestamp objects are the same
		Assert.assertFalse(value1.equals(value2));
		Assert.assertTrue(timestamp1.equals(timestamp2));

		showDST("1970-04-26T00:00:00.000", losAngeles);
	}

	@Test
	public void testIsAfterDSTMovedForwardNegativeOffsetFromUTC() throws ParseException {

		// Get a handle to the America/Los_Angeles timezone
		TimeZone losAngeles = tzu.getTimeZone("America/Los_Angeles");

		String value1 = "1970-04-26T01:00:00.000";
		String value2 = "1970-04-26T01:30:00.000";
		String value3 = "1970-04-26T03:00:00.000";
		String value4 = "1970-04-26T03:30:00.000";
		String value5 = "1970-04-26T04:00:00.000";

		// Create Timestamp objects from the strings
		Timestamp timestamp1 = tsu.getTimestampNoOffset(value1, losAngeles);
		Timestamp timestamp2 = tsu.getTimestampNoOffset(value2, losAngeles);
		Timestamp timestamp3 = tsu.getTimestampNoOffset(value3, losAngeles);
		Timestamp timestamp4 = tsu.getTimestampNoOffset(value4, losAngeles);
		Timestamp timestamp5 = tsu.getTimestampNoOffset(value5, losAngeles);

		// Examine the timestamps
		boolean after1 = tsu.isAfterDSTMovedForward(timestamp1.getTime(), losAngeles);
		boolean after2 = tsu.isAfterDSTMovedForward(timestamp2.getTime(), losAngeles);
		boolean after3 = tsu.isAfterDSTMovedForward(timestamp3.getTime(), losAngeles);
		boolean after4 = tsu.isAfterDSTMovedForward(timestamp4.getTime(), losAngeles);
		boolean after5 = tsu.isAfterDSTMovedForward(timestamp5.getTime(), losAngeles);

		// Make sure flags are set correctly
		Assert.assertFalse(after1);
		Assert.assertFalse(after2);
		Assert.assertTrue(after3);
		Assert.assertTrue(after4);
		Assert.assertFalse(after5);
	}

	/**
	 * Test Java timestamp parsing and formatting when there is a Daylight Savings Time adjustment that moved clocks
	 * backwards.<br>
	 *
	 * Clocks in the "America/Los_Angeles" timezone moved backwards by an hour at 2am on October 25, 1970. The 1am-2am
	 * hour effectively happened twice in this time zone on that day. When clocks ticked over from 1:59:59am, they moved
	 * back to 1:00:00am. The string "1970-10-25 01:30" is therefore ambiguous. What real world time is meant? Does it
	 * represent the first time clocks were showing 1:30am or the second? To describe a time between 1am and 2am on that
	 * day unambiguously an offset to UTC must be included. 1970-10-25 01:30:00.000-0700 describes the "first" 1:30am on
	 * that day. The first 1:30am occurred at 8:30am in UTC. 1970-10-25 01:30:00.000-0800 describes the "second" 1:30am
	 * on that day. The "second" 1:30am occurred at 9:30am in UTC. Java interprets a string without an offset to UTC as
	 * the "second" value. The string "1970-10-25 01:30" is interpreted to mean "1970-10-25 01:30-0800" (9:30am UTC).<br>
	 *
	 * This test verifies the handling of ambiguous strings that represent times when a Daylight Savings Time adjustment
	 * moved clocks backwards.
	 */
	@Test
	public void testDSTMoveBackwards() throws ParseException {

		// Get a handle to the America/Los_Angeles timezone
		TimeZone losAngeles = tzu.getTimeZone("America/Los_Angeles");

		String value1 = "1970-10-25T01:30:00.000-0700"; // The "first" 1:30am, this is 8:30am in UTC
		String value2 = "1970-10-25T01:30:00.000-0800"; // The "second" 1:30am, this is 9:30am in UTC
		String ambiguousValue = "1970-10-25T01:30:00.000"; // Java treats this as the "second" 1:30am, 9:30am in UTC

		Timestamp timestamp1 = tsu.getTimestamp(value1); // 8:30am in UTC
		Timestamp timestamp2 = tsu.getTimestamp(value2); // 9:30am in UTC
		Timestamp timestamp3 = tsu.getTimestampNoOffset(ambiguousValue, losAngeles); // 9:30am in UTC

		Assert.assertFalse(timestamp1.equals(timestamp2));
		Assert.assertTrue(timestamp2.equals(timestamp3));

		showDST("1970-10-25T00:00:00.000", losAngeles);
		showDST("1970-10-25T00:00:00.000", tzu.getTimeZone("America/Chicago"));
	}

	@Test
	public void testIsBeforeDSTMovedBackward() throws Exception {
		// Get a handle to the America/Los_Angeles timezone
		TimeZone losAngeles = tzu.getTimeZone("America/Los_Angeles");

		// Clocks moved backwards in LA at 2am on October 10, 1970
		String value1 = "1970-10-25T00:30:00.000-0700";
		String value2 = "1970-10-25T01:00:00.000-0700";
		String value3 = "1970-10-25T01:30:00.000-0700";
		String value4 = "1970-10-25T01:00:00.000-0800";
		String value5 = "1970-10-25T01:30:00.000-0800";
		String value6 = "1970-10-25T02:00:00.000-0800";

		Timestamp timestamp1 = tsu.getTimestamp(value1);
		Timestamp timestamp2 = tsu.getTimestamp(value2);
		Timestamp timestamp3 = tsu.getTimestamp(value3);
		Timestamp timestamp4 = tsu.getTimestamp(value4);
		Timestamp timestamp5 = tsu.getTimestamp(value5);
		Timestamp timestamp6 = tsu.getTimestamp(value6);

		boolean before1 = tsu.isBeforeDSTMovedBackwards(timestamp1.getTime(), losAngeles);
		boolean before2 = tsu.isBeforeDSTMovedBackwards(timestamp2.getTime(), losAngeles);
		boolean before3 = tsu.isBeforeDSTMovedBackwards(timestamp3.getTime(), losAngeles);
		boolean before4 = tsu.isBeforeDSTMovedBackwards(timestamp4.getTime(), losAngeles);
		boolean before5 = tsu.isBeforeDSTMovedBackwards(timestamp5.getTime(), losAngeles);
		boolean before6 = tsu.isBeforeDSTMovedBackwards(timestamp6.getTime(), losAngeles);

		Assert.assertFalse(before1);
		Assert.assertTrue(before2);
		Assert.assertTrue(before3);
		Assert.assertFalse(before4);
		Assert.assertFalse(before5);
		Assert.assertFalse(before6);
	}

	@Test
	public void testIsAfterDSTMovedBackward() throws Exception {
		// Get a handle to the America/Los_Angeles timezone
		TimeZone losAngeles = tzu.getTimeZone("America/Los_Angeles");

		// Clocks moved backwards in LA at 2am on October 10, 1970
		String value1 = "1970-10-25T00:30:00.000-0700";
		String value2 = "1970-10-25T01:00:00.000-0700";
		String value3 = "1970-10-25T01:30:00.000-0700";
		String value4 = "1970-10-25T01:00:00.000-0800";
		String value5 = "1970-10-25T01:30:00.000-0800";
		String value6 = "1970-10-25T02:00:00.000-0800";

		Timestamp timestamp1 = tsu.getTimestamp(value1);
		Timestamp timestamp2 = tsu.getTimestamp(value2);
		Timestamp timestamp3 = tsu.getTimestamp(value3);
		Timestamp timestamp4 = tsu.getTimestamp(value4);
		Timestamp timestamp5 = tsu.getTimestamp(value5);
		Timestamp timestamp6 = tsu.getTimestamp(value6);

		boolean after1 = tsu.isAfterDSTMovedBackwards(timestamp1.getTime(), losAngeles);
		boolean after2 = tsu.isAfterDSTMovedBackwards(timestamp2.getTime(), losAngeles);
		boolean after3 = tsu.isAfterDSTMovedBackwards(timestamp3.getTime(), losAngeles);
		boolean after4 = tsu.isAfterDSTMovedBackwards(timestamp4.getTime(), losAngeles);
		boolean after5 = tsu.isAfterDSTMovedBackwards(timestamp5.getTime(), losAngeles);
		boolean after6 = tsu.isAfterDSTMovedBackwards(timestamp6.getTime(), losAngeles);

		Assert.assertFalse(after1);
		Assert.assertFalse(after2);
		Assert.assertFalse(after3);
		Assert.assertTrue(after4);
		Assert.assertTrue(after5);
		Assert.assertFalse(after6);
	}

	@Test
	public void testIsAfterDSTMovedBackwardPositveOffsetFromUTC() throws Exception {
		// Get a handle to the America/Los_Angeles timezone
		TimeZone westernEurope = tzu.getTimeZone("WET");

		// Clocks moved ahead in Western Europe at 2am on March 26th, 2000
		String value1 = "2000-03-26T00:00:00.000+0000";
		String value2 = "2000-03-26T00:30:00.000+0000";
		String value3 = "2000-03-26T02:00:00.000+0100";
		String value4 = "2000-03-26T02:30:00.000+0100";
		String value5 = "2000-03-26T03:00:00.000+0100";
		String value6 = "2000-03-26T03:30:00.000+0100";

		Timestamp timestamp1 = tsu.getTimestamp(value1);
		Timestamp timestamp2 = tsu.getTimestamp(value2);
		Timestamp timestamp3 = tsu.getTimestamp(value3);
		Timestamp timestamp4 = tsu.getTimestamp(value4);
		Timestamp timestamp5 = tsu.getTimestamp(value5);
		Timestamp timestamp6 = tsu.getTimestamp(value6);

		boolean after1 = tsu.isAfterDSTMovedBackwards(timestamp1.getTime(), westernEurope);
		boolean after2 = tsu.isAfterDSTMovedBackwards(timestamp2.getTime(), westernEurope);
		boolean after3 = tsu.isAfterDSTMovedBackwards(timestamp3.getTime(), westernEurope);
		boolean after4 = tsu.isAfterDSTMovedBackwards(timestamp4.getTime(), westernEurope);
		boolean after5 = tsu.isAfterDSTMovedBackwards(timestamp5.getTime(), westernEurope);
		boolean after6 = tsu.isAfterDSTMovedBackwards(timestamp6.getTime(), westernEurope);

		Assert.assertFalse(after1);
		Assert.assertFalse(after2);
		Assert.assertFalse(after3);
		Assert.assertFalse(after4);
		Assert.assertFalse(after5);
		Assert.assertFalse(after6);
		showDST("2000-03-26T00:00:00.000+0000", westernEurope);
	}

	@Test
	public void testIsAfterDSTMovedBackwardPositiveUTCOffset() throws Exception {
		// Get a handle to the Australia/Melbourne timezone
		TimeZone melbourne = tzu.getTimeZone("Australia/Melbourne");

		String value1 = "1972-02-27T01:30:00.000+1100";
		String value2 = "1972-02-27T02:00:00.000+1100";
		String value3 = "1972-02-27T02:30:00.000+1100";
		String value4 = "1972-02-27T02:00:00.000+1000";
		String value5 = "1972-02-27T02:30:00.000+1000";
		String value6 = "1972-02-27T03:30:00.000+1000";

		Timestamp timestamp1 = tsu.getTimestamp(value1);
		Timestamp timestamp2 = tsu.getTimestamp(value2);
		Timestamp timestamp3 = tsu.getTimestamp(value3);
		Timestamp timestamp4 = tsu.getTimestamp(value4);
		Timestamp timestamp5 = tsu.getTimestamp(value5);
		Timestamp timestamp6 = tsu.getTimestamp(value6);

		boolean after1 = tsu.isAfterDSTMovedBackwards(timestamp1.getTime(), melbourne);
		boolean after2 = tsu.isAfterDSTMovedBackwards(timestamp2.getTime(), melbourne);
		boolean after3 = tsu.isAfterDSTMovedBackwards(timestamp3.getTime(), melbourne);
		boolean after4 = tsu.isAfterDSTMovedBackwards(timestamp4.getTime(), melbourne);
		boolean after5 = tsu.isAfterDSTMovedBackwards(timestamp5.getTime(), melbourne);
		boolean after6 = tsu.isAfterDSTMovedBackwards(timestamp6.getTime(), melbourne);

		Assert.assertFalse(after1);
		Assert.assertFalse(after2);
		Assert.assertFalse(after3);
		Assert.assertTrue(after4);
		Assert.assertTrue(after5);
		Assert.assertFalse(after6);
		showDST("1972-02-27T01:00:00.000", melbourne);
	}

	/**
	 * Given a TimeZone return a time representing midnight on the first day a DST adjustment caused clocks to move.
	 * Return -1 if no day could be found where DST caused clocks to move.
	 */
	protected long findDSTChangeDay(TimeZone timeZone, int offsetFromTheEpochInDays) {
		if (timeZone.getDSTSavings() == 0) {
			throw new IllegalArgumentException("The timezone " + timeZone.getID() + " does not use DST");
		}
		long millis = 0 + millisPerDay * offsetFromTheEpochInDays;
		int previousOffset = -1;
		int offset = -1;
		for (int i = 0; i < 365 * 100; i++) {
			previousOffset = offset;
			offset = timeZone.getOffset(millis);
			if (isOffsetChanged(offset, previousOffset)) {
				return millis;
			}
			millis += millisPerDay;
		}
		return -1;
	}

	protected boolean isOffsetChanged(int offset, int previousOffset) {
		if (offset == -1) {
			return false;
		}
		if (previousOffset == -1) {
			return false;
		}
		return offset != previousOffset;
	}

	protected void showDST(String value, TimeZone timeZone) throws ParseException {
		// System.out.println(timeZone.getID());
		Timestamp timestamp = tsu.getTimestampNoOffset(value, timeZone);
		long millis = timestamp.getTime();
		for (int i = 0; i < 8; i++) {
			timestamp = new Timestamp(millis);
			String local = tsu.getString(timestamp, timeZone);
			String utc = tsu.getUTCString(timestamp);
			millis += millisPerHour / 2;
			// System.out.println(local + " " + utc);
		}
		// System.out.println();
	}

}
