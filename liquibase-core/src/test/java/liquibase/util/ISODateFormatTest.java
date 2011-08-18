package liquibase.util;

import java.sql.Timestamp;
import java.util.Date;

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

}
