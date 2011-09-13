package liquibase.database.ext;

import liquibase.Constants;
import liquibase.database.DelimiterStyle;
import liquibase.database.structure.ForeignKeyConstraintType;

public class OracleDatabase extends liquibase.database.core.OracleDatabase {
    public static final String DEFAULT_DELIMITER = "/";
    public static final DelimiterStyle DEFAULT_DELIMITER_STYLE = DelimiterStyle.ROW;
    CommonDefaultRuleHandler foreignKeyHandler = new CommonDefaultRuleHandler();

    public OracleDatabase() {
        super();
        setDelimiter(DEFAULT_DELIMITER);
        setDelimiterStyle(DEFAULT_DELIMITER_STYLE);
    }

    @Override
    public int getPriority() {
        return Constants.DEFAULT_EXT_PRIORITY;
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
        return foreignKeyHandler.getDefaultUpdateRule();
    }

    @Override
    public ForeignKeyConstraintType getDefaultDeleteRule() {
        return foreignKeyHandler.getDefaultDeleteRule();
    }
}
