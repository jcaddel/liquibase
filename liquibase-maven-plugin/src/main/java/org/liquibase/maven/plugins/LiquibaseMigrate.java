package org.liquibase.maven.plugins;

import liquibase.Liquibase;
import liquibase.exception.LiquibaseException;

/**
 * Liquibase Migration Maven plugin. This plugin allows for DatabaseChangeLogs to be applied to a database as part of a
 * Maven build process.
 * 
 * @author Peter Murray
 * @description Liquibase Migrate Maven plugin
 * @goal migrate
 * @deprecated Use the LiquibaseUpdate class or Maven goal "update" instead.
 */
@Deprecated
public class LiquibaseMigrate extends AbstractLiquibaseUpdateMojo {

    @Override
    protected void doUpdate(Liquibase liquibase) throws LiquibaseException {
        if (changesToApply > 0) {
            liquibase.update(changesToApply, contexts);
        } else {
            liquibase.update(contexts);
        }
    }
}
