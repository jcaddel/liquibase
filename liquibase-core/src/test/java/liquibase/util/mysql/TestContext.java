package liquibase.util.mysql;

import java.sql.Timestamp;
import java.util.TimeZone;

public class TestContext {
    int id;
    TimeZone producer;
    TimeZone consumer;
    TimeZone mysql;
    String date;
    Timestamp original;
    Timestamp queried;
    Timestamp adjusted;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public TimeZone getProducer() {
        return producer;
    }

    public void setProducer(TimeZone producer) {
        this.producer = producer;
    }

    public TimeZone getConsumer() {
        return consumer;
    }

    public void setConsumer(TimeZone consumer) {
        this.consumer = consumer;
    }

    public TimeZone getMysql() {
        return mysql;
    }

    public void setMysql(TimeZone mysql) {
        this.mysql = mysql;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Timestamp getQueried() {
        return queried;
    }

    public void setQueried(Timestamp queried) {
        this.queried = queried;
    }

    public Timestamp getAdjusted() {
        return adjusted;
    }

    public void setAdjusted(Timestamp adjusted) {
        this.adjusted = adjusted;
    }

    public Timestamp getOriginal() {
        return original;
    }

    public void setOriginal(Timestamp original) {
        this.original = original;
    }

}
