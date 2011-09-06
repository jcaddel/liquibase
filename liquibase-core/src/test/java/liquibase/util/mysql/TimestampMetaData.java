package liquibase.util.mysql;

import java.util.TimeZone;

public class TimestampMetaData {
    TimestampProducer producer;
    TimeZone javaTimeZone;
    TimeZone databaseTimeZone;

    public TimestampProducer getProducer() {
        return producer;
    }

    public void setProducer(TimestampProducer producer) {
        this.producer = producer;
    }

    public TimeZone getJavaTimeZone() {
        return javaTimeZone;
    }

    public void setJavaTimeZone(TimeZone producerTimeZone) {
        this.javaTimeZone = producerTimeZone;
    }

    public TimeZone getDatabaseTimeZone() {
        return databaseTimeZone;
    }

    public void setDatabaseTimeZone(TimeZone mySqlTimeZone) {
        this.databaseTimeZone = mySqlTimeZone;
    }

}
