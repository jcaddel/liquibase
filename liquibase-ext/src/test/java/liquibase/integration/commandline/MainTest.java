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

    // @Test
    public void exportRiceMySQLViews() throws Exception {
        String type = "mysql";
        JDBC jdbc = getJDBC("rice", type);
        GAV gav = getRiceGAV();
        gav.setClassifier(type);
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

    @Test
    public void cycleRice() throws Exception {
        cycleApp("rice", "mysql");
        cycleApp("rice", "oracle");
    }

    protected void executeMain(Args args) throws Exception {
        String[] argsArray = toArray(args);
        Main.main(argsArray);
    }

    protected GAV getGAV(String app) throws Exception {
        if (app.equalsIgnoreCase("rice")) {
            return getRiceGAV();
        } else if (app.equalsIgnoreCase("student")) {
            return getStudentGAV();
        } else {
            throw new Exception("Unknown app " + app);
        }
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

    protected GAV getStudentGAV() {
        String groupId = "org.kuali.student.db.liquibase";
        String artifactId = "ks-embedded";
        String version = "1.3-build-112";
        GAV gav = new GAV();
        gav.setGroupId(groupId);
        gav.setArtifactId(artifactId);
        gav.setVersion(version);
        return gav;
    }

    protected JDBC getJDBC(String app, String type) throws Exception {
        String username = null;
        String password = null;
        String url = null;
        if (app.equalsIgnoreCase("rice")) {
            username = "RICE";
            password = "RICE";
        } else if (app.equalsIgnoreCase("student")) {
            username = "KSEMBEDDED";
            password = "KSEMBEDDED";
        } else {
            throw new Exception("Unsupported app " + app);
        }

        if (type.equalsIgnoreCase("mysql")) {
            url = "jdbc:mysql://localhost/" + username;
        } else if (type.equalsIgnoreCase("oracle")) {
            url = "jdbc:oracle:thin:@localhost:1521:XE";
        } else {
            throw new Exception("Unsupported type " + type);
        }

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

    protected String[] toOther(String[] types) {
        return new String[] { "--diffTypes=" + toCSV(types) };
    }

    protected void cycleApp(String app) throws Exception {
        cycleApp(app, "mysql");
        cycleApp(app, "oracle");
    }

    protected void cycleApp(String app, String db) throws Exception {
        GAV gav = getGAV(app);
        JDBC jdbc = getJDBC(app, db);
        gav.setClassifier(db);

        Args args = new Args();
        args.setGav(gav);
        args.setJdbc(jdbc);
        args.setCommand("generateChangeLog");

        // Export schema information
        args.setOther(toOther(SCHEMA));
        args.setChangeLog(getChangeLogFile(gav, "schema.xml"));
        executeMain(args);

        // Export data
        String basedir = getBaseDir(getWorkingDir(), gav) + FS + "data";
        File dataDir = mkdirs(basedir);
        String[] other = { "--dataDir=" + dataDir.getCanonicalPath(), "--diffTypes=" + toCSV(DATA) };
        args.setOther(other);
        args.setChangeLog(getChangeLogFile(gav, "data.xml"));
        executeMain(args);

        // Export constraints
        args.setOther(toOther(CONSTRAINTS));
        args.setChangeLog(getChangeLogFile(gav, "constraints.xml"));
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

    protected String getWorkingDir() {
        return "." + FS + "target";
    }

}
