package liquibase.integration.commandline;

import java.io.File;

import org.junit.Test;

public class GenerateSQLTest {

    MainTestUtils mtu = new MainTestUtils();

    @Test
    public void generateSQL() throws Exception {
        String type = "mysql";
        JDBC jdbc = mtu.getJDBC("liquibase", type);
        GAV gav = mtu.getRiceGAV();
        gav.setClassifier(type);
        Args args = new Args();
        args.setGav(gav);
        args.setJdbc(jdbc);
        args.setCommand("updateSQL");

        // generate(gav, args, "schema");
        generate(gav, args, "data");
        // generate(gav, args, "constraints");

    }

    protected void generate(GAV gav, Args args, String type) throws Exception {
        File changeLogFile = mtu.getChangeLogFile(gav, type + ".xml");
        String changeLogUrl = mtu.getChangeLogUrl(changeLogFile);
        File outputFile = mtu.getSqlFile(gav, type + ".sql");
        String[] other = { "--outputFile=" + outputFile.getCanonicalPath() };
        args.setOther(other);
        args.setChangeLog(changeLogUrl);
        mtu.executeMain(args);
    }

}
