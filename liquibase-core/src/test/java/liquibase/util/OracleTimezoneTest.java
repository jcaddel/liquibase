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

public class OracleTimezoneTest {

    static String url = "jdbc:oracle:thin:@deploy.ks.kuali.org:1521:KS";
    static String username = "system";
    static String password = "gw570229";
    static String driver = "oracle.jdbc.driver.OracleDriver";

    protected void showTimeZone(String description, TimeZone tz) {
        long offsetMillis = tz.getRawOffset();
        int offsetHours = (int) (offsetMillis / (1000 * 60 * 60));
        System.out.println("-----------------------------");
        System.out.println(description + " Timezone: " + tz.getID());
        System.out.println("UTC Offset: " + getGMTStyleOffset(offsetHours));
        System.out.println("-----------------------------");
    }

    @Test
    public void getOracleTimeZone() throws SQLException {
        try {
            Class.forName(driver);
            Connection c = DriverManager.getConnection(url, username, password);
            Date jvmDate = new Date();
            Timestamp ct = getTimestamp(c, "SELECT current_timestamp FROM dual", 1);
            Timestamp st = getTimestamp(c, "SELECT systimestamp FROM dual", 1);
            Timestamp lt = getTimestamp(c, "SELECT localtimestamp FROM dual", 1);
            c.close();
            SimpleDateFormat utc = new SimpleDateFormat(ISODateFormat.DATE_TIME_FORMAT_WITH_DECIMAL_TZ);
            utc.setTimeZone(TimeZone.getTimeZone("UTC"));

            Object dbtimezone = getOne("SELECT dbtimezone FROM dual");
            Object sessiontimezone = getOne("SELECT sessiontimezone FROM dual");
            System.out.println("dbtimezone:" + dbtimezone);
            System.out.println("sessiontimezone:" + sessiontimezone);

            showTimeZone("JVM", TimeZone.getDefault());

            System.out.println();
            System.out.println(utc.format(jvmDate));
            System.out.println(utc.format(ct));
            System.out.println(utc.format(st));
            System.out.println(utc.format(lt));
        } catch (Throwable t) {
            t.printStackTrace();
        }
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

}
