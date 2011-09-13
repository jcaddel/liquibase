package liquibase.database.ext;

import liquibase.Constants;
import liquibase.database.DelimiterStyle;
import liquibase.database.structure.ForeignKeyConstraintType;

public class MySQLDatabase extends liquibase.database.core.MySQLDatabase {
    public static final DelimiterStyle DEFAULT_DELIMITER_STYLE = DelimiterStyle.NORMAL;
    CommonDefaultRuleHandler foreignKeyHandler = new CommonDefaultRuleHandler();

    public MySQLDatabase() {
        super();
        setDelimiterStyle(DEFAULT_DELIMITER_STYLE);
    }

    @Override
    public int getPriority() {
        return Constants.DEFAULT_EXT_PRIORITY;
    }

    @Override
    public boolean supportsSequences() {
        return true;
    }

    @Override
    public boolean isDefaultUpdateRule(ForeignKeyConstraintType rule) {
        return foreignKeyHandler.isDefaultUpdateRule(rule);
    }

    @Override
    public boolean isDefaultDeleteRule(ForeignKeyConstraintType rule) {
        return foreignKeyHandler.isDefaultDeleteRule(rule);
    }

    @Override
    public ForeignKeyConstraintType getDefaultUpdateRule() {
        /**
         * This is a mini-hack to workaround a subtle difference between how Oracle and MySQL return information about a
         * JDBC constraint via JDBC. With Oracle if you don't specify an update rule it defaults to "ON UPDATE RESTRICT"
         * but this behavior is not returned via JDBC. Since MySQL also defaults to "ON UPDATE RESTRICT" we can safely
         * just omit this information from the foreign key description, yet retain the same behavior on both sides
         */
        return null;
        // return foreignKeyHandler.getDefaultUpdateRule();
    }

    @Override
    public ForeignKeyConstraintType getDefaultDeleteRule() {
        return foreignKeyHandler.getDefaultDeleteRule();
    }

}
