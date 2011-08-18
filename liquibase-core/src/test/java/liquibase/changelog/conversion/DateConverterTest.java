package liquibase.changelog.conversion;

import java.util.Date;

import junit.framework.Assert;

import org.junit.Test;

public class DateConverterTest {

    @Test
    public void simpleTest() throws Exception {
        Date oldDate = new Date();
        Converter<Date> converter = new DateConverter();
        String s = converter.getString(oldDate);
        System.out.println(s);
        Date newDate = converter.getObject(s);
        Assert.assertEquals(oldDate, newDate);
    }

}
