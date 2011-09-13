package liquibase.database.ext;

import liquibase.database.structure.ForeignKeyConstraintType;

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
