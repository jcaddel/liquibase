package liquibase.migrator.firebird;

import liquibase.migrator.AbstractSimpleChangeLogRunnerTest;

/**
 * To configure database:
 * create database 'c:\firebird\liquibase.fdb' page_size 8192;
 * user 'liquibase' password 'liquibase'; 
 */
@SuppressWarnings({"JUnitTestCaseWithNoTests"})
public class FirebirdSampleChangeLogRunnerTest extends AbstractSimpleChangeLogRunnerTest {

    public FirebirdSampleChangeLogRunnerTest() throws Exception {
        super("firebird", "org.firebirdsql.jdbc.FBDriver", "jdbc:firebirdsql:localhost/3050:c:\\firebird\\liquibase.fdb");
    }
}