package liquibase.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;
import java.util.SortedMap;
import java.util.TimeZone;
import java.util.TreeSet;

import org.junit.Assert;
import org.junit.Test;

public class TimeZoneUtilTest {

	@Test
	public void testSetJVMTimeZone() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		List<TimeZone> timeZones = tzu.getTimeZoneList();
		TimeZone defaultTimeZone = TimeZone.getDefault();

		for (TimeZone timeZone : timeZones) {
			tzu.setJVMTimeZone(timeZone);
			Assert.assertEquals(timeZone, TimeZone.getDefault());
		}
		tzu.setJVMTimeZone(defaultTimeZone);
	}

	@Test
	public void testGetLogValues() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		String s = tzu.getLogValue();
		// System.out.println(s);
	}

	@Test
	public void testGetLogValue() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		// System.out.println(tzu.getLogValue(tzu.getUTC()));
	}

	@Test
	public void testPacificNiue() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		TimeZone americaPhoenix = tzu.getTimeZone("America/Phoenix");
		tzu.setJVMTimeZone(americaPhoenix);

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSZZZZZ");
		long millis = System.currentTimeMillis();
		Timestamp timestamp1 = new Timestamp(millis);
		TimeZone pacificNiue = tzu.getTimeZone("Pacific/Niue");
		tzu.setJVMTimeZone(pacificNiue);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSZZZZZ");
		Timestamp timestamp2 = new Timestamp(millis);
		// System.out.println(sdf1.format(timestamp1) + " " + sdf1.format(timestamp2));
		// System.out.println(sdf2.format(timestamp1) + " " + sdf2.format(timestamp2));

		int diff = americaPhoenix.getRawOffset() - pacificNiue.getRawOffset();
		// System.out.println(diff / TimeZoneUtil.MILLIS_PER_HOUR);
	}

	@Test
	public void testShowTimeZone() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		List<TimeZone> timeZones = tzu.getTimeZoneList();
		// tzu.showTimeZone("First", timeZones.get(0));
		// tzu.showTimeZone("Last", timeZones.get(timeZones.size() - 1));
	}

	@Test
	public void testIsWholeHour() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		int millis = TimeZoneUtil.MILLIS_PER_HOUR;
		Assert.assertTrue(tzu.isWholeHour(millis));
		Assert.assertFalse(tzu.isWholeHour(millis + 1));
		Assert.assertFalse(tzu.isWholeHour(millis - 1));
	}

	@Test
	public void testAllRawOffsets() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		List<TimeZone> timeZones = tzu.getTimeZoneList();
		Set<String> rawOffsets = new TreeSet<String>();
		for (TimeZone timeZone : timeZones) {
			int millis = timeZone.getRawOffset();
			rawOffsets.add(millis + "");
		}
		// System.out.println(rawOffsets.size());
	}

	@Test
	public void testGetSign() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		Assert.assertEquals("+", tzu.getSign(0));
		Assert.assertEquals("+", tzu.getSign(1));
		Assert.assertEquals("-", tzu.getSign(-1));
	}

	@Test
	public void testGetUTCOffset() {
		int multiplier = TimeZoneUtil.MILLIS_PER_HOUR;
		TimeZoneUtil tzu = new TimeZoneUtil();
		Assert.assertEquals("+10:00", tzu.getISONotationFromMillis(10 * multiplier));
		Assert.assertEquals("+01:00", tzu.getISONotationFromMillis(1 * multiplier));
		Assert.assertEquals("+00:00", tzu.getISONotationFromMillis(0));
		Assert.assertEquals("-01:00", tzu.getISONotationFromMillis(-1 * multiplier));
		Assert.assertEquals("-10:00", tzu.getISONotationFromMillis(-10 * multiplier));
	}

	@Test
	public void testGetPaddedAbsoluteValue() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		Assert.assertEquals("10", tzu.getPaddedTimeValue(10));
		Assert.assertEquals("01", tzu.getPaddedTimeValue(1));
		Assert.assertEquals("00", tzu.getPaddedTimeValue(0));
		Assert.assertEquals("01", tzu.getPaddedTimeValue(-1));
		Assert.assertEquals("10", tzu.getPaddedTimeValue(-10));
	}

	@Test
	public void testMatchingSize() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		SortedMap<String, TimeZone> timeZoneMap = tzu.getTimeZoneMap();
		List<TimeZone> timeZoneList = tzu.getTimeZoneList();
		Assert.assertEquals(timeZoneMap.size(), timeZoneList.size());
	}

	@Test
	public void testGetTimeZoneList() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		List<TimeZone> timeZones = tzu.getTimeZoneList();
		TimeZone first = timeZones.get(0);
		TimeZone last = timeZones.get(timeZones.size() - 1);
		int offsetFirst = first.getRawOffset() / TimeZoneUtil.MILLIS_PER_HOUR;
		int offsetLast = last.getRawOffset() / TimeZoneUtil.MILLIS_PER_HOUR;
		Assert.assertTrue(offsetFirst < offsetLast);
	}

	@Test
	public void testGetAllEtcGMTTimeZones() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		List<TimeZone> timeZones = tzu.getTimeZoneList();
		TimeZone first = timeZones.get(0);
		TimeZone last = timeZones.get(timeZones.size() - 1);
		int smallestOffset = first.getRawOffset();
		int largestOffset = last.getRawOffset();
		for (int offset = smallestOffset; offset <= largestOffset; offset += TimeZoneUtil.MILLIS_PER_HOUR) {
			Assert.assertNotNull(tzu.getEtcGMTTimeZone(offset));
		}
	}

	@Test
	public void testGetMinAndMaxUTCOffset() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		Assert.assertTrue(tzu.getMinRawUTCOffset() < 0);
		Assert.assertTrue(tzu.getMaxRawUTCOffset() > 0);
	}

	@Test
	public void testIsValidUTCOffset() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		int max = tzu.getMaxRawUTCOffset();
		int min = tzu.getMinRawUTCOffset();
		Assert.assertTrue(tzu.isValidRawUTCOffset(max));
		Assert.assertTrue(tzu.isValidRawUTCOffset(min));
		Assert.assertFalse(tzu.isValidRawUTCOffset(max + 1));
		Assert.assertFalse(tzu.isValidRawUTCOffset(min - 1));
	}

	@Test
	public void testValidateUTCOffset() {
		TimeZoneUtil tzu = new TimeZoneUtil();
		int max = tzu.getMaxRawUTCOffset();
		int min = tzu.getMinRawUTCOffset();
		try {
			tzu.validateRawUTCOffset(max);
			tzu.validateRawUTCOffset(min);
		} catch (IllegalArgumentException e) {
			Assert.fail("Valid UTC offset values should not throw IllegalArgumentException");
		}
		try {
			tzu.validateRawUTCOffset(max + 1);
			Assert.fail("Invalid UTC offset values should throw IllegalArgumentException");
		} catch (IllegalArgumentException e) {
			; // Expected, do nothing
		}
		try {
			tzu.validateRawUTCOffset(min - 1);
			Assert.fail("Invalid UTC offset values should throw IllegalArgumentException");
		} catch (IllegalArgumentException e) {
			; // Expected, do nothing
		}
	}

	@Test
	public void testTimeZoneGetDefault() {
		String defaultTimeZoneId = TimeZone.getDefault().getID();
		TimeZoneUtil tzu = new TimeZoneUtil();
		TimeZone timeZone = tzu.getTimeZone(defaultTimeZoneId);
		Assert.assertNotNull("Could not find a timezone for '" + defaultTimeZoneId + "'", timeZone);
	}

}
