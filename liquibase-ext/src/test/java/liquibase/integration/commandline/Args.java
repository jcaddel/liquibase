package liquibase.integration.commandline;

import java.io.File;

public class Args {
    GAV gav;
    JDBC jdbc;
    String[] other;
    String command;
    File changeLog;

    public GAV getGav() {
        return gav;
    }

    public void setGav(GAV gav) {
        this.gav = gav;
    }

    public JDBC getJdbc() {
        return jdbc;
    }

    public void setJdbc(JDBC jdbc) {
        this.jdbc = jdbc;
    }

    public String getCommand() {
        return command;
    }

    public void setCommand(String command) {
        this.command = command;
    }

    public String[] getOther() {
        return other;
    }

    public void setOther(String[] other) {
        this.other = other;
    }

    public File getChangeLog() {
        return changeLog;
    }

    public void setChangeLog(File changeLog) {
        this.changeLog = changeLog;
    }
}
