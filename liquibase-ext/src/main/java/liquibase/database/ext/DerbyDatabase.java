package liquibase.database.ext;

import java.sql.Driver;

import liquibase.Constants;
import liquibase.database.DatabaseConnection;
import liquibase.exception.DatabaseException;
import liquibase.logging.LogFactory;
import liquibase.logging.Logger;

public class DerbyDatabase extends liquibase.database.core.DerbyDatabase {

    private static final Logger logger = LogFactory.getLogger();

    @Override
    public void close() throws DatabaseException {
        String url = getConnection().getURL();
        String driverName = getDefaultDriver(url);
        nullSafeClose();
        if (driverName.toLowerCase().contains("embedded")) {
            try {
                if (url.contains(";")) {
                    url = url.substring(0, url.indexOf(";")) + ";shutdown=true";
                } else {
                    url += ";shutdown=true";
                }
                LogFactory.getLogger().info("Shutting down derby connection: " + url);
                // this cleans up the lock files in the embedded derby database folder
                ((Driver) Class.forName(driverName).newInstance()).connect(url, null);
            } catch (Exception e) {
                logger.severe("Error closing derby cleanly", e);
            }
        }
    }

    public void nullSafeClose() throws DatabaseException {
        DatabaseConnection connection = getConnection();
        if (connection == null) {
            return;
        }
        try {
            connection.close();
        } catch (DatabaseException e) {
            throw new DatabaseException(e);
        }
    }

    @Override
    public int getPriority() {
        return Constants.DEFAULT_EXT_PRIORITY;
    }
}
