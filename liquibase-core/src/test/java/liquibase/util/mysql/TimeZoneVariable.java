package liquibase.util.mysql;

import java.util.TimeZone;

public class TimeZoneVariable {
    public static final String SYSTEM = "SYSTEM";
    String name;
    String value;
    TimeZone timeZone;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public TimeZone getTimeZone() {
        return timeZone;
    }

    public void setTimeZone(TimeZone timeZone) {
        this.timeZone = timeZone;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(name);
        sb.append("=");
        sb.append(value);
        if (timeZone != null) {
            sb.append(timeZone.getID());
        }
        return sb.toString();
    }
}
