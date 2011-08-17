package liquibase.integration.commandline;

public class Args {
    GAV gav;
    JDBC jdbc;
    String[] other;
    String command;
    String changeLog;
    String author = "unit-test";

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

    public String[] getOther() {
        return other;
    }

    public void setOther(String[] other) {
        this.other = other;
    }

    public String getCommand() {
        return command;
    }

    public void setCommand(String command) {
        this.command = command;
    }

    public String getChangeLog() {
        return changeLog;
    }

    public void setChangeLog(String changeLog) {
        this.changeLog = changeLog;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

}
