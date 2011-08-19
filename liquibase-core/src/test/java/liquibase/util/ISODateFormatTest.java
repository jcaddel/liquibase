package liquibase.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import junit.framework.Assert;

import org.junit.Test;

public class ISODateFormatTest {

    @Test
    public void testFormatAndParse() throws Exception {
        ISODateFormat idf = new ISODateFormat();
        Date now = new Timestamp(new java.util.Date().getTime());
        String s = idf.format(now);
        Date parsed = idf.parse(s);
        Assert.assertEquals(now, parsed);
        Assert.assertEquals(s, idf.format(parsed));
    }

    protected TimeZone getTimeZoneWithDifferentRawOffset(TimeZone oldTimeZone) {
        List<String> timeZoneIds = new ArrayList<String>(Arrays.asList(TimeZone.getAvailableIDs()));
        for (String timeZoneId : timeZoneIds) {
            TimeZone newTimeZone = TimeZone.getTimeZone(timeZoneId);
            if (oldTimeZone.getRawOffset() != newTimeZone.getRawOffset()) {
                return newTimeZone;
            }
        }
        throw new RuntimeException("Could not locate a timezone with a different raw offset");
    }

    @Test
    public void testUTC() throws Exception {
        String format = ISODateFormat.DATE_TIME_FORMAT_WITH_DECIMAL;
        SimpleDateFormat defaultFormatter = new SimpleDateFormat(format);
        TimeZone defaultTimeZone = defaultFormatter.getTimeZone();
        TimeZone timeZoneWithADifferentOffsetFromUTC = getTimeZoneWithDifferentRawOffset(defaultTimeZone);
        System.out.println("Default Timezone: " + defaultTimeZone.getID());
        System.out.println("  Other Timezone: " + timeZoneWithADifferentOffsetFromUTC.getID());
        SimpleDateFormat otherFormatter = new SimpleDateFormat(format);
        otherFormatter.setTimeZone(timeZoneWithADifferentOffsetFromUTC);

        long expected = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(expected);
        String stringValueFormattedInATimezoneWithADifferentOffsetFromUTC = otherFormatter.format(timestamp);

        Date date = new ISODateFormat().parse(stringValueFormattedInATimezoneWithADifferentOffsetFromUTC);
        long actual = date.getTime();
        Assert.assertEquals(expected, actual);
    }
}
