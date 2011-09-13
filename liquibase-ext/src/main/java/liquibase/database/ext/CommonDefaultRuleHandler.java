package liquibase.database.ext;

import liquibase.database.structure.ForeignKeyConstraintType;

/**
 * When you create a foreign key in either MySQL or Oracle the same default behavior is applied by both database
 * engines. The ON DELETE and ON UPDATE rules are assumed to be "RESTRICT" unless you specify otherwise. "RESTRICT" is
 * also a synonym for "NO ACTION". Both of these rules mean that you cannot delete a parent record that has child
 * records. This is a helper class for converting that information to XML in a standard way. This extension to Liquibase
 * uses the keyword "RESTRICT" if the underlying database thinks "RESTRICT" and "NO ACTION" are synonyms and is also the
 * default behavior for that RDBMS.
 */
public class CommonDefaultRuleHandler {

    public ForeignKeyConstraintType getDefaultUpdateRule() {
        return ForeignKeyConstraintType.importedKeyRestrict;
    }

    public ForeignKeyConstraintType getDefaultDeleteRule() {
        return ForeignKeyConstraintType.importedKeyRestrict;
    }

    public boolean isDefaultUpdateRule(ForeignKeyConstraintType rule) {
        return isDefaultRule(rule);
    }

    protected boolean isDefaultRule(ForeignKeyConstraintType rule) {
        if (rule == null) {
            return false;
        }
        switch (rule) {
        case importedKeyRestrict:
        case importedKeyNoAction:
            return true;
        default:
            return false;
        }
    }

    public boolean isDefaultDeleteRule(ForeignKeyConstraintType rule) {
        return isDefaultRule(rule);
    }

}
