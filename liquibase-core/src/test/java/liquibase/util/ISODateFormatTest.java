package liquibase.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

    static String url = "jdbc:oracle:thin:@deploy.rice.kuali.org:1521:KS";
    // String url = "jdbc:oracle:thin:@localhost:1521:XE";
    static String username = "system";
    static String password = "gw570229";
    static String driver = "oracle.jdbc.driver.OracleDriver";

    public static void main(String[] args) {
        try {

            Class.forName(driver);
            Connection c = DriverManager.getConnection(url, username, password);
            // String sql = "select sessiontimezone from dual";
            String sql = "SELECT systimestamp FROM DUAL";
            // String sql = "SELECT TO_CHAR(SysTimeStamp, 'YYYY-MM-DD HH24:MI:SS TZR TZD') from dual";
            Object object = getOne(sql);
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            Timestamp value = rs.getTimestamp(1);
            int offset = value.getTimezoneOffset();

            System.out.println(value + " " + (offset / 60));
            rs.close();
            stmt.close();
            c.close();
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    protected static Object getOne(String sql) throws SQLException {
        Connection c = DriverManager.getConnection(url, username, password);
        Statement stmt = c.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        Object object = rs.getObject(1);
        rs.close();
        stmt.close();
        c.close();
        return object;
    }

    @Test
    public void testFormatAndParse() throws Exception {
        ISODateFormat idf = new ISODateFormat();
        Timestamp now = new Timestamp(new java.util.Date().getTime());
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
