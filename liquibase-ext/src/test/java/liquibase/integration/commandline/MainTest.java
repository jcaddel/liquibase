package liquibase.integration.commandline;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.junit.Test;

public class MainTest {
    private static final String FS = System.getProperty("file.separator");
    private static final String[] SCHEMA_TYPES = { "tables", "columns", "primaryKeys", "uniqueConstraints", "indexes",
            "sequences", "views" };

    public static void main(String[] args) {
        new MainTest().execute(args);
    }

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
        String artifactId = "rice";
        String version = "2.0.0-m7";
        GAV gav = new GAV();
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
        GAV gav = getRiceGAV();
        gav.setClassifier("mysql");
        File changeLog = getChangeLogFile(gav, "views.xml");
        JDBC jdbc = getRiceMySQL();
        String[] other = { "--diffTypes=views" };
        Args args = new Args();
        args.setGav(gav);
        args.setJdbc(jdbc);
        args.setOther(other);
        args.setChangeLog(changeLog);
        args.setCommand("generateChangeLog");
        executeMain(args);
    }

    protected void generateChangeLog(Args args) throws Exception {
        GAV gav = args.getGav();
        JDBC jdbc = args.getJdbc();
        String[] other = args.getOther();
        File changeLog = getChangeLogFile(gav, "schema.xml");
        List<String> list = new ArrayList<String>();
        list.add("--changeLogFile=" + changeLog.getAbsolutePath());
        list.add("--url=" + jdbc.getUrl());
        list.add("--username=" + jdbc.getUsername());
        list.add("--password=" + jdbc.getPassword());
        if (other != null) {
            Collections.addAll(list, other);
        }
        list.add("generateChangeLog");
    }

    protected String getBaseDir(String workingDirectory, GAV gav) {
        StringBuilder sb = new StringBuilder();
        sb.append(workingDirectory);
        sb.append(getDirFragment(gav.getGroupId()));
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
        String basedir = getBaseDir("." + FS + "target", gav);
        File dir = mkdirs(basedir);
        File changeLog = new File(dir.getCanonicalFile() + FS + filename);
        return changeLog;
    }

    protected String getDirFragment(String s) {
        if (toEmpty(s).equals("")) {
            return "";
        }
        return FS + s;
    }

}
