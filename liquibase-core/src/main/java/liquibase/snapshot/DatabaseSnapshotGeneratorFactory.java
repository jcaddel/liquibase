package liquibase.snapshot;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

import liquibase.database.Database;
import liquibase.exception.DatabaseException;
import liquibase.servicelocator.ServiceLocator;

public class DatabaseSnapshotGeneratorFactory {

    private static DatabaseSnapshotGeneratorFactory instance;

    private List<DatabaseSnapshotGenerator> registry = new ArrayList<DatabaseSnapshotGenerator>();

    private DatabaseSnapshotGeneratorFactory() {
        try {
            Class<? extends DatabaseSnapshotGenerator>[] classes = ServiceLocator.getInstance().findClasses(
                    DatabaseSnapshotGenerator.class);

            for (Class<? extends DatabaseSnapshotGenerator> clazz : classes) {
                register(clazz.getConstructor().newInstance());
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static DatabaseSnapshotGeneratorFactory getInstance() {
        if (instance == null) {
            instance = new DatabaseSnapshotGeneratorFactory();
        }
        return instance;
    }

    public DatabaseSnapshotGenerator getGenerator(Database database) {
        return getGenerators(database).iterator().next();
    }

    /**
     * Get generators supporting database, sorted from highest priority to lowest.
     *
     * @param database
     * @return
     */
    public SortedSet<DatabaseSnapshotGenerator> getGenerators(final Database database) {
        SortedSet<DatabaseSnapshotGenerator> generators = new TreeSet<DatabaseSnapshotGenerator>(
                new Comparator<DatabaseSnapshotGenerator>() {
                    @Override
                    public int compare(DatabaseSnapshotGenerator o1, DatabaseSnapshotGenerator o2) {
                        return -1 * Integer.valueOf(o1.getPriority(database)).compareTo(o2.getPriority(database));
                    }
                });

        for (DatabaseSnapshotGenerator generator : registry) {
            if (generator.supports(database)) {
                generators.add(generator);
            }
        }

        return generators;
    }

    /**
     * Get generator for database with highest priority.
     */
    public DatabaseSnapshot createSnapshot(SnapshotContext context) throws DatabaseException {
        DatabaseSnapshotGenerator generator = getGenerator(context.getDatabase());
        return generator.createSnapshot(context);
    }

    /**
     * Returns instances of all implemented database types.
     */
    public List<DatabaseSnapshotGenerator> getRegistry() {
        return registry;
    }

    public void register(DatabaseSnapshotGenerator snapshotGenerator) {
        registry.add(0, snapshotGenerator);
    }

    public static void resetAll() {
        instance = null;
    }
}
