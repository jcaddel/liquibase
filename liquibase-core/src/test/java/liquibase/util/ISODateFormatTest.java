package liquibase.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

import junit.framework.Assert;

import org.junit.Test;

public class ISODateFormatTest {

    @Test
    public void testTime() throws Exception {
        ISODateFormat idf = new ISODateFormat();
        Date date1 = idf.parse("00:00:00");
        String s = idf.format(date1);
        Date date2 = idf.parse(s);
        Assert.assertEquals(date1, date2);
    }

    @Test
    public void testDate() throws Exception {
        ISODateFormat idf = new ISODateFormat();
        Date date1 = idf.parse("1970-01-01");
        String s = idf.format(date1);
        Date date2 = idf.parse(s);
        Assert.assertEquals(date1, date2);
    }

    @Test
    public void testTimestamp() throws Exception {
        ISODateFormat idf = new ISODateFormat();
        testTimestamp(idf, "1970-01-01 00:00:00+0000");
        testTimestamp(idf, "1970-01-01 00:00:00.0+0000");
        testTimestamp(idf, "1970-01-01 00:00:00.00+0000");
        testTimestamp(idf, "1970-01-01 00:00:00.000+0000");
        testTimestamp(idf, "1970-01-01T00:00:00+0000");
        testTimestamp(idf, "1970-01-01T00:00:00.0+0000");
        testTimestamp(idf, "1970-01-01T00:00:00.00+0000");
        testTimestamp(idf, "1970-01-01T00:00:00.000+0000");
        Timestamp epoch = new Timestamp(0);
        String s = idf.format(epoch);
        Date date = idf.parse(s);
        Assert.assertEquals(epoch, date);
    }

    protected void testTimestamp(ISODateFormat idf, String s) throws ParseException {
        Date date1 = idf.parse(s);
        String newString = idf.format(date1);
        Date date2 = idf.parse(newString);
        Assert.assertEquals(date1, date2);
    }

}
