package liquibase.integration.commandline;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.Driver;
import java.util.Properties;
import java.util.TimeZone;

import javax.xml.parsers.ParserConfigurationException;

import liquibase.database.Database;
import liquibase.database.DatabaseFactory;
import liquibase.database.jvm.JdbcConnection;
import liquibase.diff.Diff;
import liquibase.diff.DiffResult;
import liquibase.diff.DiffStatusListener;
import liquibase.exception.DatabaseException;
import liquibase.logging.LogFactory;
import liquibase.util.StringUtils;
import liquibase.util.TimeZoneUtil;

/**
 * Common Utility methods used in the CommandLine application and the Maven plugin. These methods were orignally moved
 * from {@link Main} so they could be shared.
 *
 * @author Peter Murray
 */
public class CommandLineUtils {
    TimeZoneUtil timeZoneUtil = new TimeZoneUtil();

    /**
     * Set the default timezone of the JVM to the timezone specified. If null or "" is passed in, do nothing. If the
     * timezone cannot be found, throw IllegalArgumentException
     */
    public void handleTimeZone(String timezone) {
        if (timezone == null || "".equals(timezone.trim())) {
            return;
        }
        TimeZone timeZone = timeZoneUtil.getTimeZone(timezone.trim());
        if (timeZone == null) {
            throw new IllegalArgumentException("Timezone '" + timezone + "' is unknown.  Available timezones:\n"
                    + timeZoneUtil.getLogValue());
        }
        timeZoneUtil.setJVMTimeZone(timeZone);
    }

    public static Database createDatabaseObject(ClassLoader classLoader, String url, String username, String password,
            String driver, String defaultSchemaName, String databaseClass, String driverPropertiesFile)
            throws DatabaseException {
        if (driver == null) {
            driver = DatabaseFactory.getInstance().findDefaultDriver(url);
        }

        try {
            Driver driverObject;
            DatabaseFactory databaseFactory = DatabaseFactory.getInstance();
            if (databaseClass != null) {
                databaseFactory.clearRegistry();
                databaseFactory.register((Database) Class.forName(databaseClass, true, classLoader).newInstance());
            }

            try {
                if (driver == null) {
                    driver = databaseFactory.findDefaultDriver(url);
                }

                if (driver == null) {
                    throw new RuntimeException(
                            "Driver class was not specified and could not be determined from the url (" + url + ")");
                }

                driverObject = (Driver) Class.forName(driver, true, classLoader).newInstance();
            } catch (Exception e) {
                throw new RuntimeException("Cannot find database driver: " + e.getMessage());
            }

            Properties driverProperties = new Properties();

            if (username != null) {
                driverProperties.put("user", username);
            }
            if (password != null) {
                driverProperties.put("password", password);
            }
            if (null != driverPropertiesFile) {
                File propertiesFile = new File(driverPropertiesFile);
                if (propertiesFile.exists()) {
                    // System.out.println("Loading properties from the file:'" + driverPropertiesFile + "'");
                    driverProperties.load(new FileInputStream(propertiesFile));
                } else {
                    throw new RuntimeException("Can't open JDBC Driver specific properties from the file: '"
                            + driverPropertiesFile + "'");
                }
            }

            // System.out.println("Properties:");
            // for (Map.Entry entry : driverProperties.entrySet()) {
            // System.out.println("Key:'"+entry.getKey().toString()+"' Value:'"+entry.getValue().toString()+"'");
            // }

            // System.out.println("Connecting to the URL:'"+url+"' using driver:'"+driverObject.getClass().getName()+"'");
            Connection connection = driverObject.connect(url, driverProperties);
            // System.out.println("Connection has been created");
            if (connection == null) {
                throw new DatabaseException("Connection could not be created to " + url + " with driver "
                        + driverObject.getClass().getName() + ".  Possibly the wrong driver for the given database URL");
            }

            Database database = databaseFactory.findCorrectDatabaseImplementation(new JdbcConnection(connection));
            database.setDefaultSchemaName(StringUtils.trimToNull(defaultSchemaName));
            return database;
        } catch (Exception e) {
            throw new DatabaseException(e);
        }
    }

    public static void doDiff(Database referenceDatabase, Database targetDatabase) throws DatabaseException {
        Diff diff = new Diff(referenceDatabase, targetDatabase);
        diff.addStatusListener(new OutDiffStatusListener());
        DiffResult diffResult = diff.compare();

        System.out.println("");
        System.out.println("Diff Results:");
        diffResult.printResult(System.out);
    }

    public static void doDiffToChangeLog(String changeLogFile, Database referenceDatabase, Database targetDatabase)
            throws DatabaseException, IOException, ParserConfigurationException {
        Diff diff = new Diff(referenceDatabase, targetDatabase);
        diff.addStatusListener(new OutDiffStatusListener());
        DiffResult diffResult = diff.compare();

        if (changeLogFile == null) {
            diffResult.printChangeLog(System.out, targetDatabase);
        } else {
            diffResult.printChangeLog(changeLogFile, targetDatabase);
        }
    }

    public static void doGenerateChangeLog(GenerateChangeLogContext context) throws DatabaseException, IOException,
            ParserConfigurationException {
        Database database = context.getDatabase();
        String changeLogFile = context.getChangeLogFile();
        Diff diff = new Diff(database, context.getSchema());
        diff.setDiffTypes(context.getDiffTypes());
        diff.setIncludes(context.getIncludes());
        diff.setExcludes(context.getExcludes());

        diff.addStatusListener(new OutDiffStatusListener());
        DiffResult diffResult = diff.compare();
        diffResult.setChangeSetAuthor(context.getAuthor());
        diffResult.setChangeSetContext(context.getChangeSetContext());
        diffResult.setDataDir(context.getDataDir());
        diffResult.setWorkingDir(context.getWorkingDir());
        diffResult.setFlatten(context.getFlatten());

        if (StringUtils.trimToNull(changeLogFile) != null) {
            diffResult.printChangeLog(changeLogFile, database);
        } else {
            PrintStream outputStream = System.out;
            diffResult.printChangeLog(outputStream, database);
        }

    }

    private static class OutDiffStatusListener implements DiffStatusListener {

        @Override
        public void statusUpdate(String message) {
            LogFactory.getLogger().info(message);

        }

    }

}
