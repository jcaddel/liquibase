package liquibase.changelog.conversion;

/**
 * Handles converting a Java object into a String that can be stored in a change log file as well as converting a string
 * from a change log file back into its equivalent Java object
 */
public interface Converter<T> {

    /**
     * Convert a java object into a String suitable for persisting to disk in a change log file
     */
    String getString(T object);

    /**
     * Convert a String from a change log file into a java object
     */
    T getObject(String s) throws ConversionException;

}
