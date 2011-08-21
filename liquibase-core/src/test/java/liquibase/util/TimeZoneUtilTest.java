package liquibase.util;

import java.util.List;
import java.util.SortedMap;
import java.util.TimeZone;

import org.junit.Assert;
import org.junit.Test;

public class TimeZoneUtilTest {

    @Test
    public void testGetSign() {
        TimeZoneUtil tzu = new TimeZoneUtil();
        Assert.assertEquals("+", tzu.getSign(0));
        Assert.assertEquals("+", tzu.getSign(1));
        Assert.assertEquals("-", tzu.getSign(-1));
    }

    @Test
    public void testGetUTCOffset() {
        TimeZoneUtil tzu = new TimeZoneUtil();
        Assert.assertEquals("+10:00", tzu.getUTCOffset(10));
        Assert.assertEquals("+01:00", tzu.getUTCOffset(1));
        Assert.assertEquals("+00:00", tzu.getUTCOffset(0));
        Assert.assertEquals("-01:00", tzu.getUTCOffset(-1));
        Assert.assertEquals("-10:00", tzu.getUTCOffset(-10));
    }

    @Test
    public void testGetPaddedAbsoluteValue() {
        TimeZoneUtil tzu = new TimeZoneUtil();
        Assert.assertEquals("10", tzu.getPaddedAbsoluteValue(10));
        Assert.assertEquals("01", tzu.getPaddedAbsoluteValue(1));
        Assert.assertEquals("00", tzu.getPaddedAbsoluteValue(0));
        Assert.assertEquals("01", tzu.getPaddedAbsoluteValue(-1));
        Assert.assertEquals("10", tzu.getPaddedAbsoluteValue(-10));
    }

    @Test
    public void testMatchingSize() {
        SortedMap<String, TimeZone> timeZoneMap = TimeZoneUtil.getAvailableTimeZones();
        List<TimeZone> timeZoneList = TimeZoneUtil.getTimeZonesByUTCOffset();
        Assert.assertEquals(timeZoneMap.size(), timeZoneList.size());
    }

    @Test
    public void testGetTimeZonesByUTCOffset() {
        List<TimeZone> timeZones = TimeZoneUtil.getTimeZonesByUTCOffset();
        TimeZone first = timeZones.get(0);
        TimeZone last = timeZones.get(timeZones.size() - 1);
        int offsetFirst = first.getRawOffset() / TimeZoneUtil.MILLIS_PER_HOUR;
        int offsetLast = last.getRawOffset() / TimeZoneUtil.MILLIS_PER_HOUR;
        Assert.assertTrue(offsetFirst < offsetLast);
    }

    @Test
    public void testGetAllEtcGMTTimeZones() {
        TimeZoneUtil tzu = new TimeZoneUtil();
        List<TimeZone> timeZones = TimeZoneUtil.getTimeZonesByUTCOffset();
        TimeZone first = timeZones.get(0);
        TimeZone last = timeZones.get(timeZones.size() - 1);
        int smallestOffset = tzu.getUTCOffsetInHours(first);
        int largestOffset = tzu.getUTCOffsetInHours(last);
        for (int offset = smallestOffset; offset <= largestOffset; offset++) {
            Assert.assertNotNull(tzu.getEtcGMTTimeZone(offset));
        }
    }

    @Test
    public void testGetMinAndMaxUTCOffset() {
        TimeZoneUtil tzu = new TimeZoneUtil();
        Assert.assertTrue(tzu.getMinUTCOffset() < 0);
        Assert.assertTrue(tzu.getMaxUTCOffset() > 0);
    }

    @Test
    public void testIsValidUTCOffset() {
        TimeZoneUtil tzu = new TimeZoneUtil();
        int max = tzu.getMaxUTCOffset();
        int min = tzu.getMinUTCOffset();
        Assert.assertTrue(tzu.isValidUTCOffset(max));
        Assert.assertTrue(tzu.isValidUTCOffset(min));
        Assert.assertFalse(tzu.isValidUTCOffset(max + 1));
        Assert.assertFalse(tzu.isValidUTCOffset(min - 1));
    }

    @Test
    public void testValidateUTCOffset() {
        TimeZoneUtil tzu = new TimeZoneUtil();
        int max = tzu.getMaxUTCOffset();
        int min = tzu.getMinUTCOffset();
        try {
            tzu.validateUTCOffset(max);
            tzu.validateUTCOffset(min);
        } catch (IllegalArgumentException e) {
            Assert.fail("Valid UTC offset values should not throw IllegalArgumentException");
        }
        try {
            tzu.validateUTCOffset(max + 1);
            Assert.fail("Invalid UTC offset values should throw IllegalArgumentException");
        } catch (IllegalArgumentException e) {
            ; // Expected, do nothing
        }
        try {
            tzu.validateUTCOffset(min - 1);
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

    @Test
    public void testSystemPropertyIfItIsSet() {
        String timeZoneId = System.getProperty("user.timezone");
        if (timeZoneId == null || "".equals(timeZoneId.trim())) {
            return;
        }
        TimeZoneUtil tzu = new TimeZoneUtil();
        TimeZone timeZone = tzu.getTimeZone(timeZoneId);
        Assert.assertNotNull("Could not find a timezone for '" + timeZoneId + "'", timeZone);
    }

}
