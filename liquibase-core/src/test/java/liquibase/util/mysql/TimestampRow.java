package liquibase.util.mysql;

import java.sql.Timestamp;
import java.util.TimeZone;

public class TimestampRow {
    TimeZone jvmTimeZone;
    TimeZone mySqlTimeZone;
    Timestamp jvmTimestamp;
    Timestamp utcTimestamp;
    Timestamp currentTimestamp;

    public TimeZone getJvmTimeZone() {
        return jvmTimeZone;
    }

    public void setJvmTimeZone(TimeZone jvmTimeZone) {
        this.jvmTimeZone = jvmTimeZone;
    }

    public TimeZone getMySqlTimeZone() {
        return mySqlTimeZone;
    }

    public void setMySqlTimeZone(TimeZone mySqlTimeZone) {
        this.mySqlTimeZone = mySqlTimeZone;
    }

    public Timestamp getJvmTimestamp() {
        return jvmTimestamp;
    }

    public void setJvmTimestamp(Timestamp jvmTimestamp) {
        this.jvmTimestamp = jvmTimestamp;
    }

    public Timestamp getUtcTimestamp() {
        return utcTimestamp;
    }

    public void setUtcTimestamp(Timestamp utcTimestamp) {
        this.utcTimestamp = utcTimestamp;
    }

    public Timestamp getCurrentTimestamp() {
        return currentTimestamp;
    }

    public void setCurrentTimestamp(Timestamp currentTimestamp) {
        this.currentTimestamp = currentTimestamp;
    }
}