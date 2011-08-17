package liquibase.integration.commandline;

import java.io.File;

import org.junit.Test;

public class GenerateChangeLogTest {

    MainTestUtils mtu = new MainTestUtils();

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
        args.setChangeLog(changeLog);
        args.setCommand("generateChangeLog");
        mtu.executeMain(args);
    }

    @Test
    public void cycleRice() throws Exception {
        cycleApp("rice", "mysql");
        // cycleApp("rice", "oracle");
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
        args.setOther(new String[] { "--diffTypes=" + mtu.toCSV(MainTestUtils.SCHEMA),
                "--includes=krim_perm_attr_data_t" });
        args.setChangeLog(mtu.getChangeLogFile(gav, "schema.xml"));
        mtu.executeMain(args);

        args.setOther(mtu.toOther(MainTestUtils.CONSTRAINTS));
        args.setOther(new String[] { "--diffTypes=" + mtu.toCSV(MainTestUtils.CONSTRAINTS),
                "--includes=krim_perm_attr_data_t" });
        args.setChangeLog(mtu.getChangeLogFile(gav, "constraints.xml"));
        mtu.executeMain(args);

        String basedir = mtu.getBaseDir(mtu.getWorkingDir(), gav, "xml") + MainTestUtils.FS + "data";
        File dataDir = mtu.mkdirs(basedir);
        String workingDir = mtu.getWorkingDir();
        String[] other1 = { "--workingDir=" + workingDir, "--dataDir=" + dataDir.getCanonicalPath(),
                "--diffTypes=" + mtu.toCSV(MainTestUtils.DATA) };
        String[] other2 = { "--workingDir=" + workingDir, "--dataDir=" + dataDir.getCanonicalPath(),
                "--diffTypes=" + mtu.toCSV(MainTestUtils.DATA), "--includes=krim_perm_attr_data_t" };
        args.setOther(other1);
        args.setOther(other2);
        args.setChangeLog(mtu.getChangeLogFile(gav, "data.xml"));
        mtu.executeMain(args);
    }

}
