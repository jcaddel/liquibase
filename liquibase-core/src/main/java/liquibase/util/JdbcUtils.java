package liquibase.util;

import java.sql.Blob;
import java.sql.Clob;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.Collection;

import liquibase.exception.DatabaseException;

public abstract class JdbcUtils {

    public static final String ORACLE_DATE_CLASS = "oracle.sql.DATE";
    public static final String ORACLE_TIMESTAMP_CLASS = "oracle.sql.TIMESTAMP";

    /**
     * Constant that indicates an unknown (or unspecified) SQL type.
     *
     * @see java.sql.Types
     */
    public static final int TYPE_UNKNOWN = Integer.MIN_VALUE;

    /**
     * Close the given JDBC Statement and ignore any thrown exception. This is useful for typical finally blocks in
     * manual JDBC code.
     *
     * @param stmt
     *            the JDBC Statement to close (may be <code>null</code>)
     */
    public static void closeStatement(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException ex) {
                // logger.debug("Could not close JDBC Statement", ex);
            } catch (Throwable ex) {
                // We don't trust the JDBC driver: It might throw RuntimeException or Error.
                // logger.debug("Unexpected exception on closing JDBC Statement", ex);
            }
        }
    }

    /**
     * Close the given JDBC ResultSet and ignore any thrown exception. This is useful for typical finally blocks in
     * manual JDBC code.
     *
     * @param rs
     *            the JDBC ResultSet to close (may be <code>null</code>)
     */
    public static void closeResultSet(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ex) {
                // logger.debug("Could not close JDBC ResultSet", ex);
            } catch (Throwable ex) {
                // We don't trust the JDBC driver: It might throw RuntimeException or Error.
                // logger.debug("Unexpected exception on closing JDBC ResultSet", ex);
            }
        }
    }

    /**
     * Retrieve a JDBC column value from a ResultSet, using the most appropriate value type. The returned value should
     * be a detached value object, not having any ties to the active ResultSet. In particular, it should not be a Blob
     * or Clob object but rather a byte[] or java.lang.String.
     * <p>
     * Uses the <code>getObject(index)</code> method, but includes additional "hacks" to get around Oracle 10g returning
     * a non-standard object for its TIMESTAMP datatype and a <code>java.sql.Date</code> for DATE columns leaving out
     * the time portion. Columns with these values are converted to a <code>java.sql.Timestamp</code> object.
     *
     * @param rs
     *            is the ResultSet holding the data
     * @param index
     *            is the column index
     * @return the value object
     * @throws SQLException
     *             if thrown by the JDBC API
     * @see java.sql.Blob
     * @see java.sql.Clob
     * @see java.sql.Timestamp
     */
    public static Object getResultSetValue(ResultSet rs, int index) throws SQLException {
        Object obj = rs.getObject(index);
        if (obj == null) {
            return null;
        }
        if (obj instanceof Blob) {
            return rs.getBytes(index);
        } else if (obj instanceof Clob) {
            return rs.getString(index);
        } else if (isOracleTimestamp(obj)) {
            return rs.getTimestamp(index);
        } else if (isDate(obj)) {
            if (hasTimestampMetaData(rs.getMetaData(), index)) {
                return rs.getTimestamp(index);
            } else {
                return rs.getDate(index);
            }
        }
        return obj;
    }

    public static boolean isDate(Object obj) {
        return isJavaDate(obj) || isOracleDate(obj);
    }

    public static boolean isJavaDate(Object obj) {
        return obj instanceof java.sql.Date;
    }

    public static boolean isOracleDate(Object obj) {
        return obj.getClass().getName().startsWith(ORACLE_DATE_CLASS);
    }

    public static boolean isOracleTimestamp(Object obj) {
        return isOracleTimestamp(obj.getClass().getName());
    }

    public static boolean isOracleTimestamp(String className) {
        return className.startsWith(ORACLE_TIMESTAMP_CLASS);
    }

    public static boolean hasTimestampMetaData(ResultSetMetaData rsmd, int index) throws SQLException {
        String columnClassName = rsmd.getColumnClassName(index);
        if (isOracleTimestamp(columnClassName)) {
            return true;
        }
        if (java.sql.Timestamp.class.getName().equals(columnClassName)) {
            return true;
        }
        return false;
    }

    /**
     * Check whether the given SQL type is numeric.
     *
     * @param sqlType
     *            the SQL type to be checked
     * @return whether the type is numeric
     */
    public static boolean isNumeric(int sqlType) {
        return Types.BIT == sqlType || Types.BIGINT == sqlType || Types.DECIMAL == sqlType || Types.DOUBLE == sqlType
                || Types.FLOAT == sqlType || Types.INTEGER == sqlType || Types.NUMERIC == sqlType
                || Types.REAL == sqlType || Types.SMALLINT == sqlType || Types.TINYINT == sqlType;
    }

    /**
     * Return a single result object from the given Collection.
     * <p>
     * Throws an exception if 0 or more than 1 element found.
     *
     * @param results
     *            the result Collection (can be <code>null</code>)
     * @return the single result object
     */
    public static Object requiredSingleResult(Collection results) throws DatabaseException {
        int size = (results != null ? results.size() : 0);
        if (size == 0) {
            throw new DatabaseException("Empty result set, expected one row");
        }
        if (results.size() > 1) {
            throw new DatabaseException("Result set larger than one row");
        }
        return results.iterator().next();
    }

}
