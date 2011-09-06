package liquibase.util.mysql;

import liquibase.util.JDBCContext;
import liquibase.util.JDBCUtil;
import liquibase.util.TimeZoneUtil;
import liquibase.util.TimestampUtil;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

public class MySQLTimezoneTest {
    public static final String DRIVER = "com.mysql.jdbc.Driver";

    long millisPerSecond = 1000;
    long millisPerMinute = 60 * millisPerSecond;
    long millisPerHour = 60 * millisPerMinute;
    long millisPerDay = 24 * millisPerHour;
    long millisPerYear = 365 * millisPerDay;
    TimeZoneUtil tzu = new TimeZoneUtil();
    TimestampUtil tsu = new TimestampUtil();
    private static JDBCUtil jdbc = new JDBCUtil();
    private static JDBCContext context = null;
    static int id = 1;

    @BeforeClass
    public static void initialize() {
        try {
            context = getLocalhostDba();
            jdbc.open(context);
            jdbc.executeSql(context, "DROP DATABASE IF EXISTS tmp");
            jdbc.executeSql(context, "CREATE DATABASE IF NOT EXISTS tmp");
            jdbc.close(context);
            context = getLocalhostTmp();
            jdbc.open(context);
            jdbc.executeSql(context, Sql.getCreateTable());
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    @AfterClass
    public static void cleanup() {
        try {
            jdbc.close(context);
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    @Test
    public void helloWorld() throws Exception {
    }

    @Test
    public void testMySQL() throws Exception {
    }

    /**
     * Return a JDBC context for default localhost
     */
    private static JDBCContext getLocalhostTmp() {
        return getLocalhost("jdbc:mysql://localhost/tmp");
    }

    private static JDBCContext getLocalhostDba() {
        return getLocalhost("jdbc:mysql://localhost");
    }

    /**
     * Return a JDBC context for default localhost
     */
    private static JDBCContext getLocalhost(String url) {
        JDBCContext context = new JDBCContext();
        context.setUrl(url);
        context.setUsername("root");
        context.setPassword("gw570229");
        context.setDriver(DRIVER);
        return context;
    }

    /**
     * Return a JDBC context for a public MySQL server I found
     */
    protected JDBCContext getPublic() {
        JDBCContext context = new JDBCContext();
        context.setUrl("jdbc:mysql://ensembldb.ensembl.org/master_schema_34");
        context.setUsername("anonymous");
        context.setPassword("");
        context.setDriver(DRIVER);
        return context;
    }
}
