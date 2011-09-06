package liquibase.util.mysql;

import java.util.TimeZone;

public class MySQLTimeZoneContext {
    TimeZoneVariable system;
    TimeZoneVariable global;
    TimeZoneVariable session;
    SessionOffset offset;
    TimeZone timeZoneToUse;

    public TimeZoneVariable getSystem() {
        return system;
    }

    public void setSystem(TimeZoneVariable system) {
        this.system = system;
    }

    public TimeZoneVariable getGlobal() {
        return global;
    }

    public void setGlobal(TimeZoneVariable global) {
        this.global = global;
    }

    public TimeZoneVariable getSession() {
        return session;
    }

    public void setSession(TimeZoneVariable session) {
        this.session = session;
    }

    public SessionOffset getOffset() {
        return offset;
    }

    public void setOffset(SessionOffset sessionOffset) {
        this.offset = sessionOffset;
    }

    public TimeZone getTimeZoneToUse() {
        return timeZoneToUse;
    }

    public void setTimeZoneToUse(TimeZone timeZoneToUse) {
        this.timeZoneToUse = timeZoneToUse;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(system);
        sb.append(" ");
        sb.append(global);
        sb.append(" ");
        sb.append(session);
        if (offset != null) {
            sb.append(" ");
            sb.append("offset=" + offset.getValue());
        }
        if (timeZoneToUse != null) {
            sb.append(" ");
            sb.append(timeZoneToUse.getID());
        }
        return sb.toString();
    }

}
