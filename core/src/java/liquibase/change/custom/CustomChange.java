package liquibase.change.custom;

import liquibase.database.Database;
import liquibase.database.structure.DatabaseObject;
import liquibase.database.sql.SqlStatement;
import liquibase.exception.JDBCException;
import liquibase.exception.UnsupportedChangeException;
import liquibase.exception.RollbackImpossibleException;
import liquibase.exception.SetupException;
import liquibase.FileOpener;
import liquibase.ChangeSet;

import java.io.Writer;
import java.io.IOException;
import java.util.Set;

import org.w3c.dom.Element;
import org.w3c.dom.Document;

/**
 * Interface to implement when creating a custom change.  See http://www.liquibase.org/manual/latest/custom_change.html
 * for more information. 
 */
public interface CustomChange {

    /**
     * Generates the SQL statements required to run the change
     *
     * @param database databasethe target {@link Database} associated to this change's statements
     * @return an array of {@link String}s with the statements
     * @throws UnsupportedChangeException if this change is not supported by the {@link Database} passed as argument
     */
    public SqlStatement[] generateStatements(Database database) throws UnsupportedChangeException;

    /**
     * Confirmation message to be displayed after the change is executed
     *
     * @return a {@link String} containing the message after the change is executed
     */
    public String getConfirmationMessage();

    /**
     * This method will be called after the no arg constructor and all of the
     * properties have been set to allow the task to do any heavy tasks or
     * more importantly generate any exceptions to report to the user about
     * the settings provided.
     *
     */
    public void setUp() throws SetupException;

    public Set<DatabaseObject> getAffectedDatabaseObjects();

    /**
     * Sets the fileOpener that should be used for any file loading and resource
     * finding for files that are provided by the user.
     */
    public void setFileOpener(FileOpener fileOpener);
    
}