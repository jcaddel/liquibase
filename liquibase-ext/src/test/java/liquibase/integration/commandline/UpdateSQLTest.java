package liquibase.integration.commandline;

import java.io.File;

import org.junit.Test;

public class UpdateSQLTest {

    MainTestUtils mtu = new MainTestUtils();

    @Test
    public void generateForMySQL() throws Exception {
        String type = "mysql";
        JDBC jdbc = mtu.getJDBC("rice", type);
        GAV gav = mtu.getRiceGAV();
        gav.setClassifier(type);
        File changeLogFile = mtu.getChangeLogFile(gav, "data.xml");
        String changeLogUrl = mtu.getChangeLogUrl(changeLogFile);
        File outputFile = mtu.getSqlFile(gav, "data.sql");
        String[] other = { "--outputFile=" + outputFile.getCanonicalPath() };
        Args args = new Args();
        args.setGav(gav);
        args.setJdbc(jdbc);
        args.setOther(other);
        args.setChangeLog(changeLogUrl);
        args.setCommand("updateSQL");
        mtu.executeMain(args);
    }

}
