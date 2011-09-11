package liquibase.util.mysql;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import liquibase.util.JDBCContext;
import liquibase.util.JDBCUtil;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

public class OracleTest {
    public static final String DRIVER = "oracle.jdbc.OracleDriver";

    private static JDBCUtil jdbc = new JDBCUtil();
    private static JDBCContext context = null;

    @BeforeClass
    public static void initialize() {
        try {
            // context = getLocalhost();
            context = getIndiana();
            // context = getIndianaKulUserAdmin();
            jdbc.open(context);
            jdbc.executeSql(context, "SELECT DUMMY FROM DUAL");
            // jdbc.executeSql(context, "ALTER USER RICEPACKAGING IDENTIFIED BY packaging174rice");
            // jdbc.executeQuery(context, "select * from all_users where username like '%RICE%'");
            ResultSet rs = context.getResultSet();
            showResultSet(rs);
            // jdbc.executeSql(context, "ALTER USER RICEPACKAGING IDENTIFIED BY packaging174rice");
            // jdbc.executeSql(context, "GRANT CREATE PROCEDURE," + " CREATE SEQUENCE, CREATE SESSION,"
            // + " CREATE SYNONYM, CREATE TABLE, CREATE TRIGGER, " + " CREATE TYPE, CREATE VIEW TO RICEPACKAGING");
            System.out.println("Hooray!");
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    protected static void showResultSet(ResultSet rs) throws SQLException {
        if (rs == null) {
            return;
        }
        ResultSetMetaData rsmd = rs.getMetaData();
        int count = rsmd.getColumnCount();
        for (int i = 0; i < count; i++) {
            System.out.print(rsmd.getColumnName(i + 1) + ",");
        }
        System.out.println();
        while (rs.next()) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < count; i++) {
                Object o = rs.getObject(i + 1);
                sb.append(o + ",");
            }
            System.out.println(sb);
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

    private static JDBCContext getLocalhost() {
        JDBCContext context = new JDBCContext();
        context.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
        context.setUsername("system");
        context.setPassword("gw570229");
        context.setDriver(DRIVER);
        return context;
    }

    private static JDBCContext getIndianaKulUserAdmin() {
        JDBCContext context = new JDBCContext();
        context.setUrl("jdbc:oracle:thin:@esdbk02.uits.indiana.edu:1521:KUALI");
        context.setUsername("kuluser_admin");
        context.setPassword("kuluser_admin");
        context.setDriver(DRIVER);
        return context;
    }

    private static JDBCContext getIndiana() {
        JDBCContext context = new JDBCContext();
        context.setUrl("jdbc:oracle:thin:@esdbk02.uits.indiana.edu:1521:KUALI");
        context.setUsername("RICEPACKAGING");
        context.setPassword("packaging174rice");
        context.setDriver(DRIVER);
        return context;
    }
}
