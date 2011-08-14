package liquibase.integration.commandline;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.junit.Test;

public class MainTest {
    static {
        System.setProperty(Main.SYSTEM_EXIT_KEY, "false");
    }
    private static final String FS = System.getProperty("file.separator");
    private static final String[] SCHEMA = { "tables", "columns", "primaryKeys", "uniqueConstraints", "indexes",
            "sequences", "views" };
    private static final String[] CONSTRAINTS = { "foreignKeys" };
    private static final String[] DATA = { "data" };

    public void execute(String[] args) {
        try {
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    protected void executeMain(Args args) throws Exception {
        String[] argsArray = toArray(args);
        Main.main(argsArray);
    }

    protected GAV getRiceGAV() {
        String groupId = "org.kuali.rice.db.liquibase";
        String artifactId = "rice-master";
        String version = "2.0.0-m7";
        GAV gav = new GAV();
        gav.setGroupId(groupId);
        gav.setArtifactId(artifactId);
        gav.setVersion(version);
        return gav;
    }

    protected JDBC getRiceMySQL() {
        String url = "jdbc:mysql://localhost/RICE";
        String username = "RICE";
        String password = "RICE";

        JDBC jdbc = new JDBC();
        jdbc.setUrl(url);
        jdbc.setPassword(password);
        jdbc.setUsername(username);
        return jdbc;
    }

    protected String[] toArray(Args args) {
        JDBC jdbc = args.getJdbc();
        File changeLog = args.getChangeLog();
        String[] other = args.getOther();
        String command = args.getCommand();
        List<String> list = new ArrayList<String>();
        if (changeLog != null) {
            list.add("--changeLogFile=" + changeLog.getAbsolutePath());
        }
        if (jdbc != null) {
            list.add("--url=" + jdbc.getUrl());
            list.add("--username=" + jdbc.getUsername());
            list.add("--password=" + jdbc.getPassword());
        }
        if (other != null) {
            Collections.addAll(list, other);
        }
        list.add(command);
        return list.toArray(new String[list.size()]);
    }

    @Test
    public void exportRiceMySQLViews() throws Exception {
        JDBC jdbc = getRiceMySQL();
        GAV gav = getRiceGAV();
        gav.setClassifier("mysql");
        File changeLog = getChangeLogFile(gav, "views.xml");
        String[] other = { "--diffTypes=views" };
        Args args = new Args();
        args.setGav(gav);
        args.setJdbc(jdbc);
        args.setOther(other);
        args.setChangeLog(changeLog);
        args.setCommand("generateChangeLog");
        executeMain(args);
    }

    protected String[] toOther(String[] types) {
        return new String[] { "--diffTypes=" + toCSV(types) };
    }

    protected String getWorkingDir() {
        return "." + FS + "target";
    }

    @Test
    public void cycleRiceMySQL() throws Exception {
        JDBC jdbc = getRiceMySQL();
        GAV gav = getRiceGAV();
        gav.setClassifier("mysql");

        Args args = new Args();
        args.setGav(gav);
        args.setJdbc(jdbc);
        args.setCommand("generateChangeLog");

        args.setOther(toOther(SCHEMA));
        args.setChangeLog(getChangeLogFile(gav, "schema.xml"));
        executeMain(args);

        args.setOther(toOther(CONSTRAINTS));
        args.setChangeLog(getChangeLogFile(gav, "constraints.xml"));
        executeMain(args);

        String basedir = getBaseDir(getWorkingDir(), gav) + FS + "data";
        File dataDir = mkdirs(basedir);
        String[] other = { "--dataDir=" + dataDir.getAbsolutePath(), "--diffTypes=" + toCSV(DATA) };
        args.setOther(other);
        args.setChangeLog(getChangeLogFile(gav, "data.xml"));
        executeMain(args);
    }

    protected String getBaseDir(String workingDirectory, GAV gav) {
        StringBuilder sb = new StringBuilder();
        sb.append(workingDirectory);
        sb.append(getDirFragment(gav.getGroupId(), true));
        sb.append(getDirFragment(gav.getArtifactId()));
        sb.append(getDirFragment(gav.getVersion()));
        sb.append(getDirFragment(gav.getClassifier()));
        return sb.toString();
    }

    protected String toEmpty(String s) {
        if (s == null) {
            return "";
        }
        if (s.trim().equals("")) {
            return "";
        }
        return s;
    }

    protected String toCSV(String[] strings) {
        StringBuilder sb = new StringBuilder();
        for (String s : strings) {
            sb.append(s + ",");
        }
        sb.deleteCharAt(sb.lastIndexOf(","));
        return sb.toString();
    }

    protected File mkdirs(String dir) throws IOException {
        File file = new File(dir);
        if (file.exists()) {
            return file;
        }
        if (!file.mkdirs()) {
            throw new IOException("Unable to create " + dir);
        }
        return file;
    }

    protected File getChangeLogFile(GAV gav, String filename) throws IOException {
        String basedir = getBaseDir(getWorkingDir(), gav);
        File dir = mkdirs(basedir);
        File changeLog = new File(dir.getCanonicalFile() + FS + filename);
        return changeLog;
    }

    protected String getDirFragment(String s) {
        return getDirFragment(s, false);
    }

    protected String getDirFragment(String s, boolean replace) {
        if (toEmpty(s).equals("")) {
            return "";
        }
        if (replace) {
            return FS + s.replace(".", FS);
        } else {
            return FS + s;
        }
    }

}
