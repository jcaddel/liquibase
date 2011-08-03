package liquibase.database.typeconversion;

import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import liquibase.database.Database;
import liquibase.exception.UnexpectedLiquibaseException;
import liquibase.servicelocator.ServiceLocator;

public class TypeConverterFactory {
    private static TypeConverterFactory instance;
    private Set<TypeConverter> allConverters;

    public static TypeConverterFactory getInstance() {
        if (instance == null) {
            instance = new TypeConverterFactory();
        }
        return instance;
    }

    private TypeConverterFactory() {
        allConverters = new HashSet<TypeConverter>();
        try {
            for (Class<? extends TypeConverter> converterClass : ServiceLocator.getInstance().findClasses(
                    TypeConverter.class)) {
                register(converterClass.newInstance());
            }
        } catch (Exception e) {
            throw new UnexpectedLiquibaseException(e);
        }
    }

    public TypeConverter findTypeConverter(Database database) {
        SortedSet<TypeConverter> converters = new TreeSet<TypeConverter>(new Comparator<TypeConverter>() {
            @Override
            public int compare(TypeConverter o1, TypeConverter o2) {
                return Integer.valueOf(o1.getPriority()).compareTo(o2.getPriority());
            }
        });

        // noinspection unchecked

        for (TypeConverter converter : allConverters) {
            if (converter.supports(database)) {
                converters.add(converter);
            }
        }

        return converters.last();
    }

    public void register(TypeConverter typeConverter) {
        allConverters.add(typeConverter);
    }

    public void register(Class<? extends TypeConverter> typeConverterClass) {
        try {
            allConverters.add(typeConverterClass.newInstance());
        } catch (Exception e) {
            throw new UnexpectedLiquibaseException(e);
        }
    }
}
