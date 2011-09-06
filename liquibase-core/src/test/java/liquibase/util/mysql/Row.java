package liquibase.util.mysql;

import java.sql.Timestamp;
import java.util.TimeZone;

public class Row {
    int id;
    long millis;
    TimeZone javaTimeZone;
    TimeZone mySqlTimeZone;
    Timestamp javaTimestamp;
    String javaOffset;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getMillis() {
        return millis;
    }

    public void setMillis(long millis) {
        this.millis = millis;
    }

    public TimeZone getJavaTimeZone() {
        return javaTimeZone;
    }

    public void setJavaTimeZone(TimeZone javaTimeZone) {
        this.javaTimeZone = javaTimeZone;
    }

    public TimeZone getMySqlTimeZone() {
        return mySqlTimeZone;
    }

    public void setMySqlTimeZone(TimeZone mySqlTimeZone) {
        this.mySqlTimeZone = mySqlTimeZone;
    }

    public Timestamp getJavaTimestamp() {
        return javaTimestamp;
    }

    public void setJavaTimestamp(Timestamp javaTimestamp) {
        this.javaTimestamp = javaTimestamp;
    }

    public String getJavaOffset() {
        return javaOffset;
    }

    public void setJavaOffset(String javaOffset) {
        this.javaOffset = javaOffset;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + id;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Row other = (Row) obj;
        if (id != other.id)
            return false;
        return true;
    }

}
