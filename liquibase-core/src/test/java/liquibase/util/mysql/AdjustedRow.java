package liquibase.util.mysql;

public class AdjustedRow {
    TimeZoneAwareTimestamp jvm;
    TimeZoneAwareTimestamp utc;
    TimeZoneAwareTimestamp current;

    public TimeZoneAwareTimestamp getJvm() {
        return jvm;
    }

    public void setJvm(TimeZoneAwareTimestamp jvm) {
        this.jvm = jvm;
    }

    public TimeZoneAwareTimestamp getUtc() {
        return utc;
    }

    public void setUtc(TimeZoneAwareTimestamp utc) {
        this.utc = utc;
    }

    public TimeZoneAwareTimestamp getCurrent() {
        return current;
    }

    public void setCurrent(TimeZoneAwareTimestamp current) {
        this.current = current;
    }
}
