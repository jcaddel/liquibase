package liquibase.integration.commandline;

import java.io.File;

import org.junit.Test;

public class GenerateChangeLogTest {

    MainTestUtils mtu = new MainTestUtils();

    @Test
    public void cycleRice() throws Exception {
        cycleApp("rice", "mysql");
        cycleApp("rice", "oracle");
    }

    // @Test
    public void exportRiceMySQLViews() throws Exception {
        String type = "mysql";
        JDBC jdbc = mtu.getJDBC("rice", type);
        GAV gav = mtu.getRiceGAV();
        gav.setClassifier(type);
        File changeLog = mtu.getChangeLogFile(gav, "views.xml");
        String[] other = { "--diffTypes=views", "--changeSetAuthor=jcaddel" };
        Args args = new Args();
        args.setGav(gav);
        args.setJdbc(jdbc);
        args.setOther(other);
        args.setChangeLog(changeLog.getCanonicalPath());
        args.setCommand("generateChangeLog");
        mtu.executeMain(args);
    }

    // @Test
    public void cycleStudent() throws Exception {
        cycleApp("student", "oracle");
    }

    protected void cycleApp(String app) throws Exception {
        cycleApp(app, "mysql");
        cycleApp(app, "oracle");
    }

    protected void cycleApp(String app, String db) throws Exception {
        GAV gav = mtu.getGAV(app);
        JDBC jdbc = mtu.getJDBC(app, db);
        gav.setClassifier(db);

        Args args = new Args();
        args.setGav(gav);
        args.setJdbc(jdbc);
        args.setCommand("generateChangeLog");

        args.setOther(mtu.toOther(MainTestUtils.SCHEMA));
        args.setChangeLog(mtu.getChangeLogFile(gav, "schema.xml").getCanonicalPath());
        mtu.executeMain(args);

        args.setOther(mtu.toOther(MainTestUtils.CONSTRAINTS));
        args.setChangeLog(mtu.getChangeLogFile(gav, "constraints.xml").getCanonicalPath());
        mtu.executeMain(args);

        String basedir = mtu.getBaseDir(mtu.getWorkingDir(), gav, "xml") + MainTestUtils.FS + "data";
        File dataDir = mtu.mkdirs(basedir);
        String workingDir = mtu.getWorkingDir();
        String[] other = { "--workingDir=" + workingDir, "--dataDir=" + dataDir.getCanonicalPath(),
                "--diffTypes=" + mtu.toCSV(MainTestUtils.DATA) };
        args.setOther(other);
        args.setChangeLog(mtu.getChangeLogFile(gav, "data.xml").getCanonicalPath());
        mtu.executeMain(args);

        JDBC liquibase = mtu.getJDBC("liquibase", db);
        args.setJdbc(liquibase);
        args.setCommand("updateSQL");
        // generateSql(gav, args, "schema");
        // generateSql(gav, args, "data");
        // generateSql(gav, args, "constraints");
    }

    protected void generateSql(GAV gav, Args args, String type) throws Exception {
        File changeLogFile = mtu.getChangeLogFile(gav, type + ".xml");
        String changeLogUrl = mtu.getChangeLogUrl(changeLogFile);
        File outputFile = mtu.getSqlFile(gav, type + ".sql");
        String[] other = { "--outputFile=" + outputFile.getCanonicalPath() };
        args.setOther(other);
        args.setChangeLog(changeLogUrl);
        mtu.executeMain(args);
    }

}
