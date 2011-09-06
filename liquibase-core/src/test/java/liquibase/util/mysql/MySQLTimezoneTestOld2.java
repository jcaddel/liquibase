package liquibase.util.mysql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TimeZone;
import java.util.TreeMap;
import java.util.TreeSet;

import junit.framework.Assert;
import liquibase.util.AdjustmentContext;
import liquibase.util.JDBCContext;
import liquibase.util.JDBCUtil;
import liquibase.util.TimeZoneUtil;
import liquibase.util.TimestampAdjustmentResult;
import liquibase.util.TimestampUtil;

import org.apache.commons.lang.StringUtils;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

public class MySQLTimezoneTestOld2 {
    public static final String DRIVER = "com.mysql.jdbc.Driver";

    long millisPerSecond = 1000;
    long millisPerMinute = 60 * millisPerSecond;
    long millisPerHour = 60 * millisPerMinute;
    long millisPerDay = 24 * millisPerHour;
    long millisPerYear = 365 * millisPerDay;
    TimeZoneUtil tzu = new TimeZoneUtil();
    TimestampUtil tsu = new TimestampUtil();
    private static JDBCUtil jdbc = new JDBCUtil();
    private static JDBCContext context = null;
    String[] isoNotationsUnknownToMySql = { "+14:00" };
    static int id = 1;

    @BeforeClass
    public static void initialize() {
        try {
            context = getLocalhostDba();
            jdbc.open(context);
            // jdbc.executeSql(context, "DROP DATABASE IF EXISTS tmp");
            jdbc.executeSql(context, "CREATE DATABASE IF NOT EXISTS tmp");
            jdbc.close(context);
            context = getLocalhostTmp();
            jdbc.open(context);
            jdbc.executeSql(context, Sql.getCreateTable());
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    @AfterClass
    public static void cleanup() {
        try {
            jdbc.close(context);
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    @Test
    public void helloWorld() throws Exception {

        long millis = tsu.getTimestamp("2000-03-25T23:00:00.000-0000").getTime();
        TimeZone producer = tzu.getTimeZone("WET");
        TimeZone consumer = tzu.getTimeZone("Poland");

        List<Long> dstEvents = getDSTEvents(producer, millis);
        // System.out.println(dstEvents);

        // System.out.println(getTimeDisplay(972781200000L - millisPerHour * 3, producer, consumer, millisPerHour, 24));

        System.out.println();
        String s = getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5);
        // System.out.println(s);
        // s = getCompactTimeDisplay(972781200000L - millisPerHour * 2, producer, consumer, millisPerHour, 5);
        // System.out.println(s);

        StringBuilder sb = new StringBuilder();
        sb.append("{section}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. BASECASE\n");
        sb.append(getBaseCase());
        sb.append("{column}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. CONSUMER OFFSET\n");
        sb.append(getConsumerOffset());
        sb.append("{column}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. PRODUCER OFFSET\n");
        sb.append(getProducerOffset());
        sb.append("{column}\n");
        sb.append("{column}{column}\n");
        sb.append("{section}\n");

        //
        sb.append("{section}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. CONS DST FORWARD\n");
        sb.append(getConsumerDSTMoveForward());
        sb.append("{column}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. CONS DST BACK\n");
        sb.append(getConsumerDSTMoveBackward());
        sb.append("{column}\n");
        sb.append("{column}{column}\n");
        sb.append("{section}\n");

        //
        sb.append("{section}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. PROD DST FORWARD\n");
        sb.append(getProducerDSTMoveForward());
        sb.append("{column}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. PROD DST BACK\n");
        sb.append(getProducerDSTMoveBackward());
        sb.append("{column}\n");
        sb.append("{column}{column}\n");
        sb.append("{section}\n");

        // 244
        sb.append("{section}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. 244\n");
        sb.append(get244());
        sb.append("{column}\n");
        sb.append("{column}\n");
        sb.append("{column}{column}\n");
        sb.append("{section}\n");

        // 242
        sb.append("{section}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. 242\n");
        sb.append(get242());
        sb.append("{column}\n");
        sb.append("{column}\n");
        sb.append("{column}{column}\n");
        sb.append("{section}\n");

        // 302
        sb.append("{section}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. 302\n");
        sb.append(get302());
        sb.append("{column}\n");
        sb.append("{column}\n");
        sb.append("{column}{column}\n");
        sb.append("{section}\n");

        // 175
        sb.append("{section}\n");
        sb.append("{column:width=5%}\n");
        sb.append("h6. 175\n");
        sb.append(get175());
        sb.append("{column}\n");
        sb.append("{column}\n");
        sb.append("{column}{column}\n");
        sb.append("{section}\n");

        System.out.println(sb);
    }

    protected String get175() throws Exception {
        long millis = tsu.getTimestamp("2000-03-26T00:59:00.000+0000").getTime();
        TimeZone producer = tzu.getTimeZone("Poland");
        TimeZone consumer = tzu.getTimeZone("WET");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    protected String get242() throws Exception {
        long millis = tsu.getTimestamp("2000-10-28T23:00:00.000+0000").getTime();
        TimeZone producer = tzu.getTimeZone("Poland");
        TimeZone consumer = tzu.getTimeZone("WET");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    protected String get244() throws Exception {
        long millis = tsu.getTimestamp("2000-10-29T00:59:00.000+0000").getTime();
        TimeZone producer = tzu.getTimeZone("Poland");
        TimeZone consumer = tzu.getTimeZone("WET");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    protected String get302() throws Exception {
        long millis = tsu.getTimestamp("2000-03-25T21:00:00.000+0000").getTime();
        TimeZone producer = tzu.getTimeZone("Turkey");
        TimeZone consumer = tzu.getTimeZone("WET");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    protected String getBaseCase() throws Exception {
        long millis = tsu.getTimestamp("2000-03-25T00:00:00.000-0000").getTime();
        TimeZone producer = tzu.getTimeZone("UTC");
        TimeZone consumer = tzu.getTimeZone("UTC");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    protected String getConsumerOffset() throws Exception {
        long millis = tsu.getTimestamp("2000-03-26T03:00:00.000-0000").getTime();
        TimeZone producer = tzu.getTimeZone("UTC");
        TimeZone consumer = tzu.getTimeZone("WET");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    protected String getConsumerDSTMoveBackward() throws Exception {
        long millis = tsu.getTimestamp("2000-10-29T00:00:00.000+0100").getTime();
        TimeZone producer = tzu.getTimeZone("UTC");
        TimeZone consumer = tzu.getTimeZone("WET");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    protected String getProducerDSTMoveBackward() throws Exception {
        long millis = tsu.getTimestamp("2000-10-29T00:00:00.000+0100").getTime();
        TimeZone producer = tzu.getTimeZone("WET");
        TimeZone consumer = tzu.getTimeZone("UTC");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    protected String getConsumerDSTMoveForward() throws Exception {
        long millis = tsu.getTimestamp("2000-03-25T23:00:00.000-0000").getTime();
        TimeZone producer = tzu.getTimeZone("UTC");
        TimeZone consumer = tzu.getTimeZone("WET");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    protected String getProducerDSTMoveForward() throws Exception {
        long millis = tsu.getTimestamp("2000-03-25T23:00:00.000-0000").getTime();
        TimeZone producer = tzu.getTimeZone("WET");
        TimeZone consumer = tzu.getTimeZone("UTC");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    protected String getProducerOffset() throws Exception {
        long millis = tsu.getTimestamp("2000-03-26T01:00:00.000-0000").getTime();
        TimeZone producer = tzu.getTimeZone("WET");
        TimeZone consumer = tzu.getTimeZone("UTC");
        return getCompactTimeDisplay(millis, producer, consumer, millisPerHour, 5)
                + "{column}\n{column:width=5%}h6. .\n" + getDBSimulation(millis, producer, consumer, millisPerHour, 5);
    }

    @Test
    public void testDST() throws Exception {
        try {
            // Assume MySQL is running on UTC for now
            TimeZone mySqlTimeZone = tzu.getEtcGMTTimeZone(0);

            // Midnight on January 1, 2000 UTC
            long y2k = tsu.getTimestamp("2000-01-01T00:00:00.000+0000").getTime();

            // A list of TimeZones that had one or more DST events in the year 2000
            List<TimeZone> dstTimeZones = getDistinctTimeZones(y2k, true);

            // createDSTData(mySqlTimeZone, dstTimeZones, y2k);

            for (TimeZone consumer : dstTimeZones) {
                System.out.println("Consuming timezone data using " + log(consumer));
                jdbc.close(context);
                tzu.setJVMTimeZone(consumer);
                jdbc.open(context);
                setSessionMySQLTimeZone(context, tzu.getRawUTCOffsetISONotation(mySqlTimeZone));
                List<Row> rows = retrieveAllRows();
                jdbc.close(context);
                testDST(rows);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void testDST(List<Row> rows) {
        for (Row row : rows) {
            if (row.getId() == 175) {
                System.out.println("");
            }
            testDST(row);
        }
    }

    protected boolean isMatch(long expected, AdjustmentContext context) {
        if (context == null) {
            return false;
        }
        boolean one = expected == context.getAdjustedMillis();
        boolean two = expected == context.getAlternateAdjustedMillis();
        if (context.isPotentiallyAmbiguous()) {
            return one || two;
        } else {
            return one;
        }
    }

    protected boolean isMatch(Row row, TimestampAdjustmentResult result) {
        long expected = row.getMillis();

        boolean one = isMatch(expected, result.getOriginal());
        boolean two = isMatch(expected, result.getAlternate());
        if (result.isPotentiallyAmbiguous()) {
            return one || two;
        } else {
            return one;
        }
    }

    protected void testDST(Row row) {
        TimeZone producer = row.getJavaTimeZone();
        TimeZone consumer = TimeZone.getDefault();
        Timestamp jdbc = row.getJavaTimestamp();
        TimestampAdjustmentResult result = tsu.adjust(producer, jdbc, consumer);

        if (!isMatch(row, result)) {
            System.out.println(getErrorMessage(row, result));
            Assert.fail("No match");
        }

    }

    protected void testDSTOriginal(Row row) {
        long expected = row.getMillis();
        TimeZone producer = row.getJavaTimeZone();
        TimeZone consumer = TimeZone.getDefault();
        Timestamp raw = row.getJavaTimestamp();
        TimestampAdjustmentResult result = tsu.adjust(producer, raw, consumer);
        long actual = result.getOriginal().getAdjustedMillis();
        boolean equals = expected == actual;
        if (equals) {
            Assert.assertEquals(expected, actual);
        } else if (result.isPotentiallyAmbiguous()) {
            boolean equalsAlternate = expected == result.getAlternate().getAdjustedMillis();
            System.out.println(getAmbiguousWarning(row, result));
            if (!equalsAlternate) {
                System.out.println(getErrorMessage(row, result));
            }
            Assert.assertTrue(equalsAlternate);
        } else {
            System.out.println(getErrorMessage(row, result));
            Assert.assertEquals(expected, actual);
        }
    }

    protected String log(TimeZone timeZone) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(timeZone.getID());
        sb.append(":");
        sb.append(timeZone.getDisplayName());
        sb.append(":");
        sb.append(tzu.getRawUTCOffsetISONotation(timeZone));
        sb.append("]");
        return sb.toString();
    }

    protected String getFastForwardWarning(Row row, TimestampAdjustmentResult result) {
        long millis = result.getOriginal().getAdjustedMillis();
        TimeZone producer = result.getProducer();
        TimeZone consumer = result.getConsumer();
        StringBuilder sb = new StringBuilder();
        sb.append("[WARNING] A daylight savings time adjustment in ");
        sb.append(log(consumer));
        sb.append(" might be masking the true timestamp value for '");
        sb.append(tsu.getStringNoOffset(new Timestamp(millis), consumer));
        sb.append("' from " + log(producer));
        return sb.toString();
    }

    protected String getAmbiguousWarning(Row row, TimestampAdjustmentResult result) {
        long millis = result.getOriginal().getMillis();
        String s = tsu.getStringNoOffset(new Timestamp(millis), result.getConsumer());
        StringBuilder sb = new StringBuilder();
        sb.append("[WARNING] Ambiguous timestamp data.  ");
        sb.append("The time '" + s + "'");
        sb.append(" in " + log(result.getProducer()));
        sb.append(" is ambiguous because of daylight savings time");
        return sb.toString();
    }

    protected String getErrorMessage(Row row, TimestampAdjustmentResult result) {
        Timestamp expected = new Timestamp(row.getMillis());
        Timestamp jdbc = row.getJavaTimestamp();
        Timestamp adjusted = new Timestamp(result.getOriginal().getAdjustedMillis());
        Long adjustmentNeeded = expected.getTime() - jdbc.getTime();
        Long adjustmentMade = adjusted.getTime() - jdbc.getTime();
        Integer difference = adjustmentNeeded.intValue() - adjustmentMade.intValue();

        Integer producerOffset = result.getProducer().getOffset(row.getMillis());
        Integer consumerOffset = result.getConsumer().getOffset(row.getMillis());

        Integer producerJDBCOffset = result.getProducer().getOffset(jdbc.getTime());
        Integer consumerJDBCOffset = result.getConsumer().getOffset(jdbc.getTime());

        Integer producerAdjustedOffset = result.getProducer().getOffset(adjusted.getTime());
        Integer consumerAdjustedOffset = result.getConsumer().getOffset(adjusted.getTime());

        StringBuilder sb = new StringBuilder();
        sb.append("[ERROR] Unable to verify timestamp adjustment.\n");
        sb.append("                Id: " + row.getId() + "\n");
        sb.append("          Producer: " + log(result.getProducer()) + "\n");
        sb.append("          Consumer: " + log(result.getConsumer()) + "\n");
        sb.append("\n");
        sb.append(" Adjustment Needed: " + tzu.getISONotationFromMillis(adjustmentNeeded.intValue()) + "\n");
        sb.append("   Adjustment Made: " + tzu.getISONotationFromMillis(adjustmentMade.intValue()) + "\n");
        sb.append("        Difference: " + tzu.getISONotationFromMillis(difference) + "\n");
        sb.append("\n");
        sb.append("   Producer Offset: " + tzu.getISONotationFromMillis(producerOffset) + "\n");
        sb.append("   Consumer Offset: " + tzu.getISONotationFromMillis(consumerOffset) + "\n");
        sb.append("\n");
        sb.append(" Prod. JDBC Offset: " + tzu.getISONotationFromMillis(producerJDBCOffset) + "\n");
        sb.append(" Cons. JDBC Offset: " + tzu.getISONotationFromMillis(consumerJDBCOffset) + "\n");
        sb.append("\n");
        sb.append(" Prod. Adj. Offset: " + tzu.getISONotationFromMillis(producerAdjustedOffset) + "\n");
        sb.append(" Cons. Adj. Offset: " + tzu.getISONotationFromMillis(consumerAdjustedOffset) + "\n");
        sb.append("\n");
        sb.append("          Expected: " + tsu.getUTCString(expected) + " UTC\n");
        sb.append("          Adjusted: " + tsu.getUTCString(adjusted) + " UTC\n");
        sb.append("              JDBC: " + tsu.getUTCString(row.getJavaTimestamp()) + " UTC\n");
        sb.append("\n");
        sb.append("          Expected: " + tsu.getString(expected, result.getConsumer()) + " Consumer\n");
        sb.append("          Adjusted: " + tsu.getString(adjusted, result.getConsumer()) + " Consumer\n");
        sb.append("              JDBC: " + tsu.getString(row.getJavaTimestamp(), result.getConsumer()) + " Consumer\n");
        sb.append("\n");
        sb.append("          Expected: " + tsu.getString(expected, result.getProducer()) + " Producer\n");
        sb.append("          Adjusted: " + tsu.getString(adjusted, result.getProducer()) + " Producer\n");
        sb.append("              JDBC: " + tsu.getString(row.getJavaTimestamp(), result.getProducer()) + " Producer\n");
        sb.append("\n");
        // sb.append("Ambiguous Producer: " + result.isAmbiguousProducer() + "\n");
        // sb.append(" Fast Fwd Consumer: " + result.isFastForwardConsumer() + "\n");
        return sb.toString();
    }

    /**
     * Test the scenario where both Java and MySQL use a timezone without Daylight Savings Time. Further assume that the
     * Java side uses the same timezone for both persisting and retrieving timestamps. Java and MySQL do not need to be
     * on the same timezone, but they must both be using timezones that do not use DST.
     *
     * In this scenario all timestamp data should remain consistent without anything "extra" needing to be done.
     */
    // @Test
    public void testSimple() throws Exception {
        TimeZone mySqlTimeZone = tzu.getEtcGMTTimeZone(0); // UTC time, doesn't use DST
        TimeZone javaTimeZone = tzu.getTimeZone("America/Phoenix"); // Arizona doesn't use DST

        tzu.setJVMTimeZone(javaTimeZone);
        List<Row> rows = getDefaultRows(javaTimeZone, mySqlTimeZone);

        testTimestamps(mySqlTimeZone, javaTimeZone, javaTimeZone, rows);
    }

    /**
     * Test the scenario where Java uses a timezone that has Daylight Savings Time, but MySQL does not. Further assume
     * that the Java side uses the same timezone for both persisting and retrieving timestamps. Java and MySQL do not
     * need to be on the same timezone, but MySQL must be on a timezone that does not use DST.
     *
     * In this scenario there can be ambiguity. Java generates unambiguous Timestamp values but MySQL cannot store them
     * correctly. When clocks move backwards for Daylight Savings Time, a period of time (usually one hour) occurs twice
     * for that day. In Los Angeles, for example, the time 1970-10-25 01:30 occurred twice. When clocks in LA reached
     * 1:59am, they reset themselves back to 1:00am instead of rolling over to 2:00am. Therefore, the string '1970-10-25
     * 01:30' is ambiguous. Does it represent the first 1:30am which occurred at 8:30am UTC, or the second 1:30am which
     * occurred at 9:30am UTC. MySQL is incapable of distinguishing between the two. When JDBC obtains a Timestamp
     * object from MySQL for that time it is always the later time, in this case 9:30am UTC. An application running
     * inside of a JVM using a timezone that supports Daylight Savings Time is shit out of luck if it tries to store a
     * timestamp representing the hour before clocks move backwards.
     */
    // @Test
    public void testJavaDST() throws Exception {
        TimeZone mySqlTimeZone = tzu.getEtcGMTTimeZone(0);
        TimeZone javaTimeZone = tzu.getTimeZone("America/Los_Angeles");

        tzu.setJVMTimeZone(javaTimeZone);
        List<Row> rows = getLosAngelesDSTRows(javaTimeZone, mySqlTimeZone);

        testTimestamps(mySqlTimeZone, javaTimeZone, javaTimeZone, rows);

        rows = getRows(getDSTMillis(), javaTimeZone, mySqlTimeZone);
        testTimestamps(mySqlTimeZone, javaTimeZone, javaTimeZone, rows);
    }

    // @Test
    public void testDifferentJavaTimeZonesNoDST() throws Exception {
        TimeZone mySqlTimeZone = tzu.getEtcGMTTimeZone(0);
        TimeZone javaTimeZoneProducer = tzu.getTimeZone("America/Phoenix");
        TimeZone javaTimeZoneConsumer = tzu.getEtcGMTTimeZone(0);

        tzu.setJVMTimeZone(javaTimeZoneProducer);
        List<Row> rows = getDefaultRows(javaTimeZoneProducer, mySqlTimeZone);

        testTimestamps(mySqlTimeZone, javaTimeZoneProducer, javaTimeZoneConsumer, rows);
    }

    // @Test
    public void testDifferentJavaTimeZonesProducerIsDST() throws Exception {
        TimeZone mySqlTimeZone = tzu.getEtcGMTTimeZone(0);
        TimeZone javaTimeZoneProducer = tzu.getTimeZone("America/Los_Angeles");
        TimeZone javaTimeZoneConsumer = tzu.getEtcGMTTimeZone(0);

        tzu.setJVMTimeZone(javaTimeZoneProducer);
        List<Row> rows = getLosAngelesDSTRows(javaTimeZoneProducer, mySqlTimeZone);

        testTimestamps(mySqlTimeZone, javaTimeZoneProducer, javaTimeZoneConsumer, rows);
    }

    // @Test
    public void testDifferentJavaTimeZonesConsumerIsDST() throws Exception {
        TimeZone mySqlTimeZone = tzu.getEtcGMTTimeZone(0);
        TimeZone javaTimeZoneProducer = tzu.getEtcGMTTimeZone(0);
        TimeZone javaTimeZoneConsumer = tzu.getTimeZone("America/Los_Angeles");

        tzu.setJVMTimeZone(javaTimeZoneProducer);
        List<Row> rows = getLosAngelesDSTRows(javaTimeZoneProducer, mySqlTimeZone);

        testTimestamps(mySqlTimeZone, javaTimeZoneProducer, javaTimeZoneConsumer, rows);
    }

    // @Test
    public void testDifferentJavaTimeZonesDST() throws Exception {
        TimeZone mySqlTimeZone = tzu.getEtcGMTTimeZone(0);
        TimeZone javaTimeZoneProducer = tzu.getTimeZone("America/Los_Angeles");
        TimeZone javaTimeZoneConsumer = tzu.getTimeZone("America/Chicago");

        tzu.setJVMTimeZone(javaTimeZoneProducer);
        List<Row> rows = getLosAngelesDSTRows(javaTimeZoneProducer, mySqlTimeZone);

        testTimestamps(mySqlTimeZone, javaTimeZoneProducer, javaTimeZoneConsumer, rows);
    }

    protected List<Long> getRelevantDSTMillis(List<Long> dstEvents) {
        List<Long> relevantMillis = new ArrayList<Long>();
        for (Long dstEvent : dstEvents) {
            relevantMillis.add(dstEvent - millisPerMinute);
            relevantMillis.add(dstEvent);
            relevantMillis.add(dstEvent + millisPerMinute);
        }
        return relevantMillis;
    }

    protected void createDSTData(TimeZone mySqlTimeZone, List<TimeZone> dstTimeZones, long time) throws Exception {
        // Millisecond values representing DST events in the year 2000 for each timezone
        Map<String, List<Long>> dstEvents = new HashMap<String, List<Long>>();
        for (TimeZone timeZone : dstTimeZones) {
            List<Long> dstEventList = getDSTEvents(timeZone, time);
            dstEvents.put(timeZone.getID(), dstEventList);
        }

        // Aggregate all of the interesting DST related times for each timezone
        SortedSet<Long> millis = new TreeSet<Long>();
        for (TimeZone timeZone : dstTimeZones) {
            List<Long> timeZoneEvents = dstEvents.get(timeZone.getID());
            List<Long> timeZoneMillis = getRelevantDSTMillis(timeZoneEvents);
            millis.addAll(timeZoneMillis);
        }

        // Persist interesting DST times to MySQL
        for (TimeZone producer : dstTimeZones) {
            tzu.setJVMTimeZone(producer);
            List<Row> rows = getRows(millis, producer, mySqlTimeZone);
            persistRows(mySqlTimeZone, rows);
        }
    }

    protected void testTimestamps(TimeZone mySqlTimeZone, TimeZone javaTimeZoneProducer, TimeZone javaTimeZoneConsumer,
            List<Row> rows) throws SQLException, ParseException {
        jdbc.open(context);
        setSessionMySQLTimeZone(context, tzu.getRawUTCOffsetISONotation(mySqlTimeZone));
        persistRows(rows);
        jdbc.close(context);
        tzu.setJVMTimeZone(javaTimeZoneConsumer);
        jdbc.open(context);
        List<Row> retrievedRows = retrieveRows(rows);
        jdbc.close(context);
        validate(rows, retrievedRows);
        for (Row row : rows) {
            int index = retrievedRows.indexOf(row);
            Row retrievedRow = retrievedRows.get(index);
            compare(row, retrievedRow, javaTimeZoneProducer, javaTimeZoneConsumer);
        }
    }

    protected void persistRows(TimeZone mySqlTimeZone, List<Row> rows) throws SQLException {
        jdbc.open(context);
        setSessionMySQLTimeZone(context, tzu.getRawUTCOffsetISONotation(mySqlTimeZone));
        persistRows(rows);
        jdbc.close(context);
    }

    protected void compare(Row originalRow, Row retrievedRow, TimeZone producer, TimeZone consumer)
            throws ParseException {
        Timestamp original = originalRow.getJavaTimestamp();
        Timestamp retrieved = retrievedRow.getJavaTimestamp();
        Timestamp adjusted = null; // tsu.adjust(producer, retrieved, consumer);
        String originalString = tsu.getStringNoOffset(retrieved, consumer);
        Timestamp originalStringTimestamp = tsu.getTimestampNoOffset(originalString, consumer);
        boolean afterDST = tsu.isAfterDSTMovedForward(originalStringTimestamp.getTime(), consumer);
        boolean neverHappened = tsu.isNeverHappened(originalString, consumer);
        boolean ambiguous = tsu.isAmbiguousWithoutUTCOffset(adjusted, producer);
        boolean equals = original.equals(adjusted);
        if (ambiguous) {
            System.out.println("[WARNING] The time '" + tsu.getStringNoOffset(adjusted, producer)
                    + "' is ambiguous in " + producer.getDisplayName() + " because of daylight savings time");
            int dstSavings = producer.getDSTSavings();
            boolean equalsOriginal = original.getTime() == adjusted.getTime();
            boolean equalsAdjusted = original.getTime() == adjusted.getTime() - dstSavings;
            Assert.assertTrue(equalsOriginal || equalsAdjusted);
        } else {
            if (!equals) {
                System.out.println("       Id: " + originalRow.getId());
                System.out.println("   Millis: " + originalRow.getMillis());
                System.out.println(" Original: " + getShowString(original, producer, consumer));
                System.out.println("Retrieved: " + getShowString(retrieved, producer, consumer));
                System.out.println(" Adjusted: " + getShowString(adjusted, producer, consumer));
            }
            Assert.assertEquals(original, adjusted);
        }
    }

    protected String getShowString(Timestamp timestamp, TimeZone producer, TimeZone consumer) {
        StringBuilder sb = new StringBuilder();
        String s1 = tsu.getUTCString(timestamp);
        String s2 = tsu.getString(timestamp, producer);
        String s3 = tsu.getString(timestamp, consumer);
        sb.append(s1 + " " + s2 + " " + s3);
        return sb.toString();
    }

    /**
     * Given a TimeZone and an offset to the epoch, return a List<Long> that contains the millis for any DST adjustments
     * that were made in the year following the epoch offset in that TimeZone
     */
    protected List<Long> getDSTEvents(TimeZone timeZone, long epochOffset) {
        long millis = epochOffset;
        int currOffset = -1;
        int prevOffset = -1;
        long count = millisPerYear / millisPerMinute;
        List<Long> dstEvents = new ArrayList<Long>();
        for (long i = 0; i < count; i++) {
            prevOffset = currOffset;
            currOffset = timeZone.getOffset(millis);
            if ((prevOffset != currOffset) && (prevOffset != -1)) {
                dstEvents.add(millis);
            }
            millis += millisPerMinute;
        }
        return dstEvents;
    }

    /**
     * If dst is true, return a list of timezones that had at least one DST event in the year following the time passed
     * in. If dst is false, return only timezones that did NOT have a DST event in that year.
     */
    protected List<TimeZone> getAllTimeZones(long time, boolean dst) {
        Collection<TimeZone> timeZones = TimeZoneUtil.getTimeZoneMap().values();
        List<TimeZone> list = new ArrayList<TimeZone>();
        for (TimeZone timeZone : timeZones) {
            if (dst != isDST(timeZone, time)) {
                continue;
            }
            list.add(timeZone);
        }
        return list;
    }

    /**
     * Return a list of TimeZones where the the offset to UTC at the time passed in is unique to each TimeZone in the
     * list
     */
    protected List<TimeZone> getDistinctTimeZones(long time, boolean dst) {
        List<TimeZone> timeZones = getAllTimeZones(time, dst);
        Map<String, TimeZone> map = new TreeMap<String, TimeZone>();
        for (TimeZone timeZone : timeZones) {
            if (dst != isDST(timeZone, time)) {
                continue;
            }
            String isoNotation = tzu.getRawUTCOffsetISONotation(timeZone);
            map.put(isoNotation, timeZone);
        }
        return new ArrayList<TimeZone>(map.values());
    }

    protected List<TimeZone> getNonDSTTimeZones(long millis) {
        return getDistinctTimeZones(millis, false);
    }

    protected List<TimeZone> getDSTTimeZones(long millis) {
        return getDistinctTimeZones(millis, true);
    }

    /**
     * Return true if the TimeZone had a DST event at some point in the year following epochOffset, false otherwise.
     */
    protected boolean isDST(TimeZone timeZone, long epochOffset) {
        if (!tsu.isSupportsDST(timeZone)) {
            return false;
        }
        long millis = epochOffset;
        int offset = timeZone.getOffset(millis);
        for (int i = 0; i < 365; i++) {
            millis += millisPerDay;
            if (timeZone.getOffset(millis) != offset) {
                return true;
            }
        }
        return false;
    }

    protected List<Row> getRows(SortedSet<Long> millis, TimeZone javaTimeZone, TimeZone mySqlTimeZone)
            throws ParseException {
        List<Row> rows = new ArrayList<Row>();
        for (Long time : millis) {
            Row row = getRow(time, javaTimeZone, mySqlTimeZone);
            rows.add(row);
        }
        return rows;
    }

    protected List<Row> getLosAngelesDSTRows(TimeZone javaTimeZone, TimeZone mySqlTimeZone) throws ParseException {
        Long[] millis = getMillis(getLosAngelesDSTStrings());
        List<Long> millisList = Arrays.asList(millis);
        SortedSet<Long> millisSet = new TreeSet<Long>(millisList);
        return getRows(millisSet, javaTimeZone, mySqlTimeZone);
    }

    protected Long[] getMillis(String[] strings) throws ParseException {
        Long[] millis = new Long[strings.length];
        for (int i = 0; i < millis.length; i++) {
            String string = strings[i];
            Timestamp timestamp = tsu.getTimestamp(string);
            millis[i] = new Long(timestamp.getTime());
        }
        return millis;
    }

    protected String[] getLosAngelesDSTStrings() {
        return new String[] { "1970-04-26T00:00:00.000-0800",
                "1970-04-26T00:30:00.000-0800",
                "1970-04-26T01:00:00.000-0800",
                "1970-04-26T01:30:00.000-0800",
                "1970-04-26T03:00:00.000-0700",
                "1970-04-26T03:30:00.000-0700",
                "1970-04-26T04:00:00.000-0700",
                "1970-04-26T04:30:00.000-0700",
                "1970-10-25T00:00:00.000-0700",
                "1970-10-25T00:30:00.000-0700",
                "1970-10-25T01:00:00.000-0700",
                "1970-10-25T01:30:00.000-0700",
                "1970-10-25T01:00:00.000-0800",
                "1970-10-25T01:30:00.000-0800",
                "1970-10-25T02:00:00.000-0800",
                "1970-10-25T02:30:00.000-0800" };
    }

    protected SortedSet<Long> getDSTMillis() throws ParseException {
        String s = "1970-04-25T00:00:00.000-0800";
        Timestamp timestamp = tsu.getTimestamp(s);
        return getMillis(timestamp.getTime(), 72 * 4, millisPerHour / 4);
    }

    protected SortedSet<Long> getMillis(long epochOffset, int count, long interval) throws ParseException {
        long millis = epochOffset;
        SortedSet<Long> list = new TreeSet<Long>();
        for (int i = 0; i < count; i++) {
            list.add(millis);
            millis += interval;
        }
        return list;
    }

    /**
     * Validate that the rows we queried out of MySQL represent the same data we persisted. Same number of rows, millis
     * are the same, timezones are the same.
     */
    protected void validate(List<Row> original, List<Row> retrieved) {
        Assert.assertEquals(original.size(), retrieved.size());
        for (Row row : original) {
            Assert.assertTrue(retrieved.contains(row));
            int index = retrieved.indexOf(row);
            Row retrievedRow = retrieved.get(index);

            Assert.assertEquals(row.getMillis(), retrievedRow.getMillis());
            Assert.assertEquals(row.getJavaTimeZone(), retrievedRow.getJavaTimeZone());
            Assert.assertEquals(row.getMySqlTimeZone(), retrievedRow.getMySqlTimeZone());
        }
    }

    protected List<Row> retrieveAllRows() throws SQLException {
        String sql = Sql.getAllRows();
        jdbc.executeQuery(context, sql);
        List<Row> rows = getRows(context.getResultSet());
        jdbc.closeStatement(context);
        return rows;
    }

    protected List<Row> retrieveRows(List<Row> rows) throws SQLException {
        String sql = Sql.getTheseRows(rows);
        jdbc.executeQuery(context, sql);
        List<Row> newRows = getRows(context.getResultSet());
        jdbc.closeStatement(context);
        return newRows;
    }

    protected Row retrieveRow(int id) throws SQLException {
        String sql = Sql.getOneRow(id);
        jdbc.executeQuery(context, sql);
        ResultSet rs = context.getResultSet();
        rs.next();
        Row newRow = getRow(rs);
        jdbc.closeStatement(context);
        return newRow;
    }

    protected List<Row> getRows(ResultSet rs) throws SQLException {
        List<Row> rows = new ArrayList<Row>();
        while (rs.next()) {
            Row row = getRow(context.getResultSet());
            rows.add(row);
        }
        return rows;
    }

    protected Row getRow(ResultSet rs) throws SQLException {
        Integer id = (Integer) rs.getObject(1);
        Long millis = (Long) rs.getObject(2);
        String javaTimeZoneId = (String) rs.getObject(3);
        String mySqlTimeZoneId = (String) rs.getObject(4);
        Timestamp javaTimestamp = rs.getTimestamp(5);
        String javaOffset = (String) rs.getObject(6);

        TimeZone javaTimeZone = tzu.getTimeZone(javaTimeZoneId);
        TimeZone mySqlTimeZone = tzu.getEtcGMTTimeZone(mySqlTimeZoneId);

        Row row = new Row();
        row.setId(id);
        row.setMillis(millis);
        row.setJavaTimeZone(javaTimeZone);
        row.setMySqlTimeZone(mySqlTimeZone);
        row.setJavaTimestamp(javaTimestamp);
        row.setJavaOffset(javaOffset);
        return row;
    }

    protected List<Row> getDefaultRows(TimeZone javaTimeZone, TimeZone mySqlTimeZone) {
        List<Row> rows = new ArrayList<Row>();
        long millis = millisPerYear;
        for (int i = 0; i < 5; i++) {
            Row row = getRow(millis, javaTimeZone, mySqlTimeZone);
            rows.add(row);
            millis += millisPerSecond;
        }
        return rows;
    }

    protected void persistRows(List<Row> rows) throws SQLException {
        for (Row row : rows) {
            persistRow(row);
        }
    }

    protected void persistRow(Row row) throws SQLException {
        String sql = Sql.getInsert();
        List<?> values = Sql.getInsertValues(row);
        jdbc.executeSql(context, sql, values);
    }

    protected Row getRow(long millis, TimeZone javaTimeZone, TimeZone mySqlTimeZone) {
        Timestamp javaTimestamp = new Timestamp(millis);
        String javaOffset = tzu.getUTCOffsetISONotation(javaTimeZone, javaTimestamp);

        Row row = new Row();
        row.setId(id++);
        row.setMillis(millis);
        row.setJavaTimeZone(javaTimeZone);
        row.setJavaOffset(javaOffset);
        row.setJavaTimestamp(javaTimestamp);
        row.setMySqlTimeZone(mySqlTimeZone);
        return row;
    }

    /**
     * Return a JDBC context for localhost with the "tmp" db selected
     */
    private static JDBCContext getLocalhostTmp() {
        return getLocalhost("jdbc:mysql://localhost/tmp");
    }

    /**
     * Return a JDBC context localhost no default db selected
     */
    private static JDBCContext getLocalhostDba() {
        return getLocalhost("jdbc:mysql://localhost");
    }

    /**
     * Return a JDBC context for default localhost
     */
    private static JDBCContext getLocalhost(String url) {
        JDBCContext context = new JDBCContext();
        context.setUrl(url);
        context.setUsername("root");
        context.setPassword("gw570229");
        context.setDriver(DRIVER);
        return context;
    }

    /**
     * Set the MySQL timezone (GLOBAL or SESSION) to the indicated UTC offset
     */
    protected void setMySQLTimeZone(JDBCContext context, String level, String isoNotation) throws SQLException {
        jdbc.executeSql(context, "SET " + level + " time_zone='" + isoNotation + "'");
    }

    /**
     * Set the MySQL timezone for the currently connected session to the indicated UTC offset. This has an immediate
     * affect. Any further activity using the currently connected session will use the new timezone.
     */
    protected void setSessionMySQLTimeZone(JDBCContext context, String isoNotation) throws SQLException {
        setMySQLTimeZone(context, "SESSION", isoNotation);
    }

    protected boolean isValidISONotationMySQLDoesntKnowAbout(String isoNotation) {
        for (String validISONotation : isoNotationsUnknownToMySql) {
            if (validISONotation.equals(isoNotation)) {
                return true;
            }
        }
        return false;
    }

    protected String getTimeDisplay(long millis, TimeZone producer, TimeZone consumer) throws ParseException {
        return getTimeDisplay(millis, producer, consumer, -1, 1);
    }

    protected String getDBSimulation(long millis, TimeZone producer, TimeZone consumer, long interval, int count)
            throws ParseException {
        StringBuilder sb = new StringBuilder();
        sb.append("|| J1 || DB || J2  ||\n");
        SimpleDateFormat sdf = new SimpleDateFormat("HHZZZZZ");
        for (int i = 0; i < count; i++) {
            Timestamp t = new Timestamp(millis);
            sdf.setTimeZone(producer);
            String j1 = sdf.format(t);
            String db = sdf.format(t);
            String s = tsu.getStringNoOffset(new Timestamp(millis), producer);
            Timestamp timestamp = tsu.getTimestampNoOffset(s, consumer);
            sdf.setTimeZone(consumer);
            String j2 = sdf.format(timestamp);
            sb.append("| " + j1.substring(0, 5) + " | " + db.substring(0, 2) + " | " + j2.substring(0, 5) + " |\n");
            millis += interval;
        }
        return sb.toString();
    }

    protected String getCompactTimeDisplay(long millis, TimeZone producer, TimeZone consumer, long interval, int count)
            throws ParseException {
        StringBuilder sb = new StringBuilder();
        sb.append("|| UTC || J1   || J2   ||\n");
        SimpleDateFormat sdf = new SimpleDateFormat("HHZZZZZ");
        for (int i = 0; i < count; i++) {
            Timestamp t = new Timestamp(millis);
            sdf.setTimeZone(TimeZoneUtil.UTC);
            String utc = sdf.format(t);
            sdf.setTimeZone(producer);
            String j1 = sdf.format(t);
            sdf.setTimeZone(consumer);
            String j2 = sdf.format(t);
            sb.append("| " + utc.substring(0, 5) + " | " + j1.substring(0, 5) + " | " + j2.substring(0, 5) + " |\n");
            millis += interval;
        }
        return sb.toString();
    }

    protected String getTimeDisplay(long millis, TimeZone producer, TimeZone consumer, long interval, int count)
            throws ParseException {
        StringBuilder sb = new StringBuilder();
        String id1 = StringUtils.rightPad(TimeZoneUtil.UTC.getID(), 28);
        String id2 = StringUtils.rightPad(producer.getID(), 28);
        String id3 = StringUtils.rightPad(consumer.getID(), 28);
        sb.append(id1 + " " + id2 + " " + id3 + "\n");
        if (count > 1) {
            sb.append("--------------------------------------------------------------------------------------\n");
        }
        for (int i = 0; i < count; i++) {
            Timestamp t = new Timestamp(millis);
            String utc = tsu.getUTCString(t);
            String j1 = tsu.getString(t, producer);
            String j2 = tsu.getString(t, consumer);
            sb.append(utc + " " + j1 + " " + j2 + "\n");
            millis += interval;
        }
        if (count > 1) {
            sb.append("--------------------------------------------------------------------------------------\n");
        }
        return sb.toString();
    }

    protected void showDST(long millis, TimeZone timeZone, int count) throws ParseException {
        System.out.println(timeZone.getID());
        for (int i = 0; i < count; i++) {
            Timestamp timestamp = new Timestamp(millis);
            String local = tsu.getString(timestamp, timeZone);
            String utc = tsu.getUTCString(timestamp);
            millis += millisPerHour / 2;
            System.out.println(local + " " + utc);
        }
        System.out.println();
    }

    protected void showDST(long millis, TimeZone timeZone) throws ParseException {
        showDST(millis, timeZone, 8);
    }

    protected void showDST(String value, String timeZoneId) throws ParseException {
        showDST(value, tzu.getTimeZone(timeZoneId));
    }

    protected void showDST(String value, TimeZone timeZone) throws ParseException {
        showDST(value, timeZone, 8);
    }

    protected void showDST(String value, TimeZone timeZone, int count) throws ParseException {
        Timestamp timestamp = tsu.getTimestamp(value);
        long millis = timestamp.getTime();
        showDST(millis, timeZone, count);
    }
}
