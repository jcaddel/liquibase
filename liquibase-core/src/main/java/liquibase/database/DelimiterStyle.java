package liquibase.database;

/**
 * When generating SQL, this controls how the delimiter separating SQL statements is printed. With "DEFAULT" a delimiter
 * is appended to the end of each SQL statement followed by a line separator. With "ROW", the SQL statement is printed,
 * followed by a line separator, followed by the delimiter, followed by another line separator.
 * 
 * @author Jeff Caddel
 */
public enum DelimiterStyle {
    DEFAULT, ROW;
}
