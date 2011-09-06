package liquibase.util.mysql;

import java.util.TimeZone;

public class SessionOffset {
    int value;
    TimeZone timeZone;

    public int getValue() {
        return value;
    }

    public void setValue(int offset) {
        this.value = offset;
    }

    public TimeZone getTimeZone() {
        return timeZone;
    }

    public void setTimeZone(TimeZone timeZone) {
        this.timeZone = timeZone;
    }

}
