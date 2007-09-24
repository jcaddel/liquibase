package liquibase.database.template;

import liquibase.exception.JDBCException;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Generic callback interface for code that operates on a PreparedStatement.
 * Allows to execute any number of operations on a single PreparedStatement,
 * for example a single <code>executeUpdate</code> call or repeated
 * <code>executeUpdate</code> calls with varying parameters.
 * <p/>
 * @author Spring Framework
 */
interface PreparedStatementCallback {

    /**
     * Gets called by <code>JdbcTemplate.execute</code> with an active JDBC
     * PreparedStatement. Does not need to care about closing the Statement
     * or the Connection, or about handling transactions: this will all be
     * handled by JdbcTemplate.
     * 
     * @param ps active JDBC PreparedStatement
     * @return a result object, or <code>null</code> if none
     * @throws java.sql.SQLException if thrown by a JDBC method, to be auto-converted
     *                               to a DataAccessException by a SQLExceptionTranslator
     * @throws JDBCException         in case of custom exceptions
     */
    Object doInPreparedStatement(PreparedStatement ps) throws SQLException, JDBCException;

}