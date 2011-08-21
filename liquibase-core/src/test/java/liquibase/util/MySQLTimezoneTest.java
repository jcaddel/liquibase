package liquibase.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.junit.Test;

public class MySQLTimezoneTest {

    // static String url = "jdbc:mysql://ensembldb.ensembl.org/master_schema_34";
    // static String username = "anonymous";
    // static String password = "";
    static String url = "jdbc:mysql://localhost/rice";
    static String username = "root";
    static String password = "gw570229";
    static String driver = "com.mysql.jdbc.Driver";

    public void simpleTest() {
        try {
            Class.forName(driver);
            String sql = "SELECT now()";
            Object object = getOne(sql);
            System.out.println(object);
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    protected String getEtcGMTTimezoneId(int offset) {
        return "Etc/GMT" + getSign(offset * -1) + Math.abs(offset);
    }

    protected String getGMTTimezoneId(int offset) {
        StringBuilder sb = new StringBuilder();
        sb.append("GMT");
        sb.append(getGMTStyleOffset(offset));
        return sb.toString();
    }

    protected String getGMTStyleOffset(int offset) {
        StringBuilder sb = new StringBuilder();
        sb.append(getSign(offset));
        sb.append(getPaddedOffset(offset));
        sb.append(":00");
        return sb.toString();
    }

    protected String getPaddedOffset(int offset) {
        long abs = Math.abs(offset);
        return (abs < 10) ? "0" + abs : abs + "";
    }

    protected String getSign(int offset) {
        return (offset >= 0) ? "+" : "-";
    }

    protected void showTimeZone(String description, TimeZone tz) {
        long offsetMillis = tz.getRawOffset();
        int offsetHours = (int) (offsetMillis / (1000 * 60 * 60));
        System.out.println("-----------------------------");
        System.out.println(description + " Timezone: " + tz.getID());
        System.out.println("UTC Offset: " + getGMTStyleOffset(offsetHours));
        System.out.println("-----------------------------");
    }

    @Test
    public void testMySqlTimeZoneHandling() throws SQLException {

        Connection c = DriverManager.getConnection(url, username, password);
        Date jvmDate = new Date();
        Timestamp utcTimestamp = getTimestamp(c, "SELECT UTC_TIMESTAMP", 1);
        Timestamp currentTimestamp = getTimestamp(c, "SELECT CURRENT_TIMESTAMP", 1);
        c.close();

        SimpleDateFormat utc = new SimpleDateFormat(ISODateFormat.DATE_TIME_FORMAT_WITH_DECIMAL_TZ);
        utc.setTimeZone(TimeZone.getTimeZone("UTC"));

        TimeZone mySqlTimeZone = getTimeZone();

        showTimeZone("JVM", TimeZone.getDefault());
        showTimeZone("MySQL", mySqlTimeZone);

        System.out.println();
        System.out.println(utc.format(jvmDate));
        System.out.println(utc.format(getAdjustedUTCTimestamp(utcTimestamp)));
        System.out.println(utc.format(getAdjustedCurrentTimestamp(currentTimestamp, mySqlTimeZone)));

    }

    protected Timestamp getAdjustedUTCTimestamp(Timestamp utc) {
        long adjustment = TimeZone.getDefault().getRawOffset();
        return new Timestamp(utc.getTime() + adjustment);
    }

    protected Timestamp getAdjustedCurrentTimestamp(Timestamp timestamp, TimeZone mySqlTimeZone) throws SQLException {
        TimeZone jvmTimeZone = TimeZone.getDefault();
        long adjustment = jvmTimeZone.getRawOffset() - mySqlTimeZone.getRawOffset();
        return new Timestamp(timestamp.getTime() + adjustment);
    }

    protected long adjustForTimeZone(TimeZone zone, long millis) {
        long adjustment = zone.getRawOffset();
        return millis + adjustment;
    }

    protected TimeZone getTimeZone() throws SQLException {
        Connection c = DriverManager.getConnection(url, username, password);
        Long offsetHours = (Long) getOne(c, "SELECT timestampdiff(hour,utc_timestamp,current_timestamp)", 1);
        c.close();
        String timezoneId = getEtcGMTTimezoneId(offsetHours.intValue());
        return TimeZone.getTimeZone(timezoneId);
    }

    public Timestamp getTimestamp(Connection c, String sql, int column) throws SQLException {
        Statement stmt = c.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        Timestamp value = rs.getTimestamp(column);
        rs.close();
        stmt.close();
        return value;
    }

    public Object getOne(Connection c, String sql, int column) throws SQLException {
        Statement stmt = c.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        Object value = rs.getObject(column);
        rs.close();
        stmt.close();
        return value;
    }

    public Object getOne(String sql) throws SQLException {
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

}
