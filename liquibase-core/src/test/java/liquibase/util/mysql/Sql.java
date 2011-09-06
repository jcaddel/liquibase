package liquibase.util.mysql;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Sql {

    /**
     * Return a SQL statement for creating the table we'll need for timestamp testing
     */
    public static final String getCreateTable() {
        StringBuilder sb = new StringBuilder();
        sb.append("CREATE TABLE IF NOT EXISTS ts (id integer not null primary key\n");
        sb.append(" , millis bigint\n");
        sb.append(" , java_timezone varchar(50)\n");
        sb.append(" , mysql_timezone varchar(6)\n");
        sb.append(" , java_timestamp timestamp\n");
        sb.append(" , java_offset varchar(6)\n");
        // sb.append(" , UNIQUE KEY timestamp_context (millis,java_timezone,mysql_timezone)");
        sb.append(")\n");
        return sb.toString();
    }

    /**
    *
    */
    public static final String getAllRows() {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT id\n");
        sb.append(" , millis\n");
        sb.append(" , java_timezone\n");
        sb.append(" , mysql_timezone\n");
        sb.append(" , java_timestamp\n");
        sb.append(" , java_offset\n");
        sb.append("FROM ts\n");
        /**
         * The @@session.time_zone in the WHERE clause helps guarantee our assumption that in the real world the
         * timezone the MySQL server is running with will never be changed. When we persist a row we also store the
         * MySQL session timezone being used by the connection that persists the row. By combining the primary key with
         * the MySQL timezone variable we are guaranteed to only successfully query for a Row if the session timezone
         * setting for the querying connection is the same as the session timezone setting of the persisting connection.
         */
        sb.append("WHERE mysql_timezone = @@session.time_zone\n");
        return sb.toString();
    }

    /**
     *
     */
    public static final String getTheseRows(List<Row> rows) {
        StringBuilder sb = new StringBuilder();
        sb.append(getAllRows());
        sb.append(" AND id IN (");
        for (Row row : rows) {
            sb.append(row.getId());
            sb.append(",");
        }
        sb.deleteCharAt(sb.lastIndexOf(","));
        sb.append(")");
        return sb.toString();
    }

    /**
     *
     */
    public static final String getOneRow(int id) {
        StringBuilder sb = new StringBuilder();
        sb.append(getAllRows());
        sb.append(" AND id = " + id);
        return sb.toString();
    }

    /**
     * Return a SQL statement for inserting values into the timestamp table
     */
    public static final String getInsert() {
        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO ts (id\n");
        sb.append(" , millis\n");
        sb.append(" , java_timezone\n");
        sb.append(" , mysql_timezone\n");
        sb.append(" , java_timestamp\n");
        sb.append(" , java_offset\n");
        sb.append(") VALUES (?\n");
        sb.append(" , ?\n");
        sb.append(" , ?\n");
        sb.append(" , @@session.time_zone\n");
        sb.append(" , ?\n");
        sb.append(" , ?\n");
        sb.append(")\n");
        return sb.toString();
    }

    public static final List<?> getInsertValues(Row row) throws SQLException {
        List<Object> values = new ArrayList<Object>();
        values.add(row.getId());
        values.add(row.getMillis());
        values.add(row.getJavaTimeZone().getID());
        values.add(row.getJavaTimestamp());
        values.add(row.getJavaOffset());
        return values;
    }
}
