package liquibase.util.mysql;

import java.sql.Timestamp;

public class TimeZoneAwareTimestamp {
    Timestamp adjustedTimestamp;
    Timestamp originalTimestamp;
    TimestampMetaData metaData;

    public Timestamp getAdjustedTimestamp() {
        return adjustedTimestamp;
    }

    public void setAdjustedTimestamp(Timestamp adjustedTimestamp) {
        this.adjustedTimestamp = adjustedTimestamp;
    }

    public Timestamp getOriginalTimestamp() {
        return originalTimestamp;
    }

    public void setOriginalTimestamp(Timestamp originalTimestamp) {
        this.originalTimestamp = originalTimestamp;
    }

    public TimestampMetaData getMetaData() {
        return metaData;
    }

    public void setMetaData(TimestampMetaData metaData) {
        this.metaData = metaData;
    }
}
