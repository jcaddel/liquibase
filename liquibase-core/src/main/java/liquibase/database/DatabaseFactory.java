package liquibase.database;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

import liquibase.database.core.UnsupportedDatabase;
import liquibase.exception.DatabaseException;
import liquibase.exception.UnexpectedLiquibaseException;
import liquibase.logging.LogFactory;
import liquibase.servicelocator.ServiceLocator;

public class DatabaseFactory {
    private static DatabaseFactory instance;
    private List<Database> implementedDatabases = new ArrayList<Database>();

    protected DatabaseFactory() {
        try {
            Class[] classes = ServiceLocator.getInstance().findClasses(Database.class);

            // noinspection unchecked
            for (Class<? extends Database> clazz : classes) {
                register(clazz.getConstructor().newInstance());
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static DatabaseFactory getInstance() {
        if (instance == null) {
            instance = new DatabaseFactory();
        }
        return instance;
    }

    public static void reset() {
        instance = new DatabaseFactory();
    }

    /**
     * Returns instances of all implemented database types.
     */
    public List<Database> getImplementedDatabases() {
        return implementedDatabases;
    }

    public void register(Database database) {
        implementedDatabases.add(0, database);
    }

    public Database findCorrectDatabaseImplementation(DatabaseConnection connection) throws DatabaseException {

        SortedSet<Database> foundDatabases = new TreeSet<Database>(new Comparator<Database>() {
            @Override
            public int compare(Database o1, Database o2) {
                return -1 * new Integer(o1.getPriority()).compareTo(o2.getPriority());
            }
        });

        for (Database implementedDatabase : getImplementedDatabases()) {
            if (implementedDatabase.isCorrectDatabaseImplementation(connection)) {
                foundDatabases.add(implementedDatabase);
            }
        }

        if (foundDatabases.size() == 0) {
            LogFactory.getLogger().warning("Unknown database: " + connection.getDatabaseProductName());
            return new UnsupportedDatabase();
        }

        Database returnDatabase;
        try {
            returnDatabase = foundDatabases.iterator().next().getClass().newInstance();
        } catch (Exception e) {
            throw new UnexpectedLiquibaseException(e);
        }

        returnDatabase.setConnection(connection);
        LogFactory.getLogger().info("Database: " + returnDatabase.getClass());
        return returnDatabase;
    }

    public String findDefaultDriver(String url) {
        for (Database database : this.getImplementedDatabases()) {
            String defaultDriver = database.getDefaultDriver(url);
            if (defaultDriver != null) {
                return defaultDriver;
            }
        }

        return null;
    }

    /**
     * Removes all registered databases, even built in ones. Useful for forcing a particular database implementation
     */
    public void clearRegistry() {
        implementedDatabases.clear();
    }
}
