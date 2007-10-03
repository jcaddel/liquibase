import org.codehaus.groovy.grails.compiler.support.*
import liquibase.migrator.Migrator;
import liquibase.CompositeFileOpener;
import liquibase.FileOpener;
import liquibase.FileSystemFileOpener;
import org.liquibase.grails.GrailsFileOpener;
import java.io.OutputStreamWriter;

Ant.property(environment: "env")
grailsHome = Ant.antProject.properties."env.GRAILS_HOME"
includeTargets << new File("scripts/LiquibaseSetup.groovy")

task ('default':"Outputs SQL to update database.") {
    depends(setup)

    try {
        migrator.setMode(Migrator.Mode.OUTPUT_FUTURE_ROLLBACK_SQL_MODE);
        migrator.setOutputSQLWriter(new OutputStreamWriter(System.out));
        migrator.migrate()
//            if (migrate.migrate()) {
//                System.out.println("Database migrated");
//            } else {
//                System.out.println("Database up-to-date");
//            }
    }
    catch (Exception e) {
        e.printStackTrace()
        event("StatusFinal", ["Failed to migrate database ${grailsEnv}"])
        exit(1)
    } finally {
        migrator.getDatabase().getConnection().close();
    }
}