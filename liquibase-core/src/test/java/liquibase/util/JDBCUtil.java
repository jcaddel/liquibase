package liquibase.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

public class JDBCUtil {

    public void open(JDBCContext context) throws SQLException {
        try {
            closeConnection(context);
            Class.forName(context.getDriver());
            Connection c = DriverManager.getConnection(context.getUrl(), context.getUsername(), context.getPassword());
            context.setConnection(c);
        } catch (Exception e) {
            throw new SQLException(e);
        }
    }

    private void createStatement(JDBCContext context) throws SQLException {
        Connection c = context.getConnection();
        Statement s = c.createStatement();
        context.setStatement(s);
    }

    public void executeSql(JDBCContext context, String sql, Object value) throws SQLException {
        if (value == null) {
            executeSql(context, sql);
            return;
        }
        List<Object> values = new ArrayList<Object>();
        values.add(value);
        executeSql(context, sql, values);
    }

    public void executeSql(JDBCContext context, String sql, List<?> values) throws SQLException {
        if (values == null || values.size() == 0) {
            executeSql(context, sql);
            return;
        }
        PreparedStatement ps = context.getConnection().prepareStatement(sql);
        context.setPreparedStatement(ps);
        for (int i = 0; i < values.size(); i++) {
            Object value = values.get(i);
            int parameterIndex = i + 1;
            ps.setObject(parameterIndex, value);
        }
        ps.execute();
    }

    public void executeSql(JDBCContext context, List<String> sql) throws SQLException {
        closeStatement(context);
        createStatement(context);
        Statement s = context.getStatement();
        for (String sqlToExecute : sql) {
            s.execute(sqlToExecute);
        }
    }

    public void executeSql(JDBCContext context, String sql) throws SQLException {
        List<String> sqlToExecute = new ArrayList<String>();
        sqlToExecute.add(sql);
        executeSql(context, sqlToExecute);
    }

    public ResultSet executeQuery(JDBCContext context, String sql) throws SQLException {
        closeStatement(context);
        createStatement(context);
        Statement s = context.getStatement();
        ResultSet rs = s.executeQuery(sql);
        context.setResultSet(rs);
        return rs;
    }

    public String getString(JDBCContext context, int columnIndex) throws SQLException {
        ResultSet rs = context.getResultSet();
        return rs.getString(columnIndex);
    }

    public Timestamp getTimestamp(JDBCContext context, int columnIndex) throws SQLException {
        ResultSet rs = context.getResultSet();
        return rs.getTimestamp(columnIndex);
    }

    public Timestamp getTimestamp(JDBCContext context, int columnIndex, TimeZone timeZone) throws SQLException {
        Calendar calendar = Calendar.getInstance(timeZone);
        ResultSet rs = context.getResultSet();
        return rs.getTimestamp(columnIndex, calendar);
    }

    public Object getObject(JDBCContext context, String columnLabel) throws SQLException {
        ResultSet rs = context.getResultSet();
        return rs.getObject(columnLabel);
    }

    public Object getObject(JDBCContext context, int columnIndex) throws SQLException {
        ResultSet rs = context.getResultSet();
        return rs.getObject(columnIndex);
    }

    private void closeConnection(JDBCContext context) {
        closeStatement(context);
        Connection c = context.getConnection();
        if (c == null) {
            return;
        }
        try {
            c.close();
        } catch (SQLException e) {
            ; // ignore
        }
        context.setConnection(null);
    }

    private void closeStatement(Statement s) {
        if (s == null) {
            return;
        }
        try {
            s.close();
        } catch (SQLException e) {
            ; // ignore
        }
    }

    public void closeStatement(JDBCContext context) {
        closeResultSet(context);
        closeStatement(context.getStatement());
        closeStatement(context.getPreparedStatement());
        context.setStatement(null);
        context.setPreparedStatement(null);
    }

    private void closeResultSet(JDBCContext context) {
        ResultSet rs = context.getResultSet();
        if (rs == null) {
            return;
        }
        try {
            rs.close();
        } catch (SQLException e) {
            ; // ignore
        }
        context.setResultSet(null);
    }

    public void close(JDBCContext context) {
        closeConnection(context);
    }
}
