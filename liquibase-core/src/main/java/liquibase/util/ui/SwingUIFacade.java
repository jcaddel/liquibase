package liquibase.util.ui;

import javax.swing.JOptionPane;

import liquibase.database.Database;
import liquibase.exception.DatabaseException;
import liquibase.util.StreamUtil;

public class SwingUIFacade implements UIFacade {
    /**
     * Displays swing-based dialog about running against a non-localhost database. Returns true if the user selected
     * that they are OK with that.
     */
    @Override
    public boolean promptForNonLocalDatabase(Database database) throws DatabaseException {
        return JOptionPane.showConfirmDialog(
                null,
                "You are running a database migration against a non-local database." + StreamUtil.getLineSeparator()
                + "Database URL is: " + database.getConnection().getURL() + StreamUtil.getLineSeparator()
                + "Username is: " + database.getConnection().getConnectionUserName()
                + StreamUtil.getLineSeparator() + StreamUtil.getLineSeparator()
                + "Area you sure you want to do this?", "Confirm", JOptionPane.YES_NO_OPTION,
                JOptionPane.WARNING_MESSAGE) == JOptionPane.NO_OPTION;
    }

}
