package liquibase.util.mysql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.TimeZone;

import junit.framework.Assert;
import liquibase.util.JDBCContext;
import liquibase.util.JDBCUtil;
import liquibase.util.TimeZoneUtil;
import liquibase.util.TimestampUtil;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

public class MySQLTimeZoneTestOld {
    public static final String DRIVER = "com.mysql.jdbc.Driver";

    String isoFormatWithoutTimezone = "yyyy-MM-dd HH:mm:ss.SSS";
    String isoFormat = isoFormatWithoutTimezone + "ZZZZZ";
    SimpleDateFormat utcFormatter = getUTCFormatter();
    SimpleDateFormat isoFormatter = new SimpleDateFormat(isoFormat);
    TimeZoneUtil tzu = new TimeZoneUtil();
    TimestampUtil tsu = new TimestampUtil();
    private static JDBCUtil jdbc = new JDBCUtil();
    private static JDBCContext context = null;
    int count = 0;
    int limit = 2500;
    String[] isoNotationsUnknownToMySql = { "+14:00" };
    int id = 1;

    /**
     * This is the reference date we will be using in our testing scenarios. We will be creating Timestamp objects in
     * different TimeZone's using this value. We'll then use JDBC to store them into and retrieve them from a MySQL
     * database.
     */
    String referenceDate = "1972-09-17 17:00:00.000-0000";

    /**
     * Get a reference to the millisecond value for our reference date
     */
    long millis = getMillis(referenceDate);
    String utcText = utcFormatter.format(new Timestamp(millis));

    @BeforeClass
    public static void initialize() {
        try {
            context = getLocalhostDba();
            jdbc.open(context);
            jdbc.executeSql(context, "DROP DATABASE IF EXISTS tmp");
            jdbc.executeSql(context, "CREATE DATABASE tmp");
            jdbc.close(context);
            context = getLocalhostTmp();
            jdbc.open(context);
            // jdbc.executeSql(context, Sql.getCreateTableSQL());
            jdbc.executeSql(context, SqlOld.getCreateSimpleTableSQL());
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
    public void testRun2() throws Exception {
        // testSameJVMRandomMySQL();
        testDifferentJVMs();
    }

    public void testDifferentJVMs() throws Exception {
        TimeZone losAngeles = tzu.getTimeZone("America/Los_Angeles");
        TimeZone chicago = tzu.getTimeZone("America/Chicago");
        TestContext tc = new TestContext();
        tc.setId(id++);
        tc.setProducer(losAngeles);
        tc.setConsumer(chicago);
        tc.setMysql(TimeZoneUtil.UTC);
        tc.setDate("1975-01-01T00:00:01.000+0000");
        testAdjusted(tc);
        Assert.assertEquals(tc.getOriginal(), tc.getAdjusted());
    }

    protected void testAdjusted(TestContext testContext) throws Exception {
        TimeZone producer = testContext.getProducer();
        TimeZone consumer = testContext.getConsumer();
        TimeZone mysql = testContext.getMysql();
        int id = testContext.getId();

        jdbc.close(context);
        tzu.setJVMTimeZone(producer);
        String date = testContext.getDate();
        Timestamp timestamp = tsu.getTimestamp(date);
        testContext.setOriginal(timestamp);

        jdbc.open(context);
        setSessionMySQLTimeZone(context, tzu.getRawUTCOffsetISONotation(mysql));
        insertRow(context, producer, timestamp, id);
        jdbc.close(context);

        tzu.setJVMTimeZone(consumer);

        jdbc.open(context);
        setSessionMySQLTimeZone(context, tzu.getRawUTCOffsetISONotation(mysql));
        // jdbc.executeSingleRowQuery(context, SqlOld.getSelectSimpleSql(id));
        Timestamp queriedTimestamp = jdbc.getTimestamp(context, 3);
        jdbc.close(context);

        testContext.setQueried(queriedTimestamp);

        Timestamp adjusted = tsu.adjust(producer, queriedTimestamp, consumer);
        testContext.setAdjusted(adjusted);

    }

    /**
     * Test the situation where the jvm storing timestamps and the jvm reading timestamps have the same timezone but the
     * MySQL timezone is different
     */
    // @Test
    public void testSameJVMRandomMySQL() throws Exception {
        try {
            List<TimeZone> timeZones = TimeZoneUtil.getTimeZoneList();
            List<TimeZone> etcGmt = getMySqlEtcGMTList();
            Random random = new Random(System.currentTimeMillis());
            List<TestContext> contexts = new ArrayList<TestContext>();
            for (TimeZone timeZone : timeZones) {
                int index = random.nextInt(etcGmt.size());
                TestContext tc = new TestContext();
                tc.setId(id++);
                tc.setProducer(timeZone);
                tc.setConsumer(timeZone);
                tc.setMysql(etcGmt.get(index));
                tc.setDate("1975-01-01T00:00:01.000+0000");
                contexts.add(tc);
            }
            for (TestContext tc : contexts) {
                test(tc);
            }
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    protected void test(TestContext testContext) throws Exception {
        TimeZone producer = testContext.getProducer();
        TimeZone consumer = testContext.getConsumer();
        TimeZone mysql = testContext.getMysql();
        int id = testContext.getId();

        jdbc.close(context);
        tzu.setJVMTimeZone(producer);
        String date = testContext.getDate();
        Timestamp timestamp = tsu.getTimestamp(date);

        jdbc.open(context);
        setSessionMySQLTimeZone(context, tzu.getRawUTCOffsetISONotation(mysql));
        insertRow(context, producer, timestamp, id);
        jdbc.close(context);

        tzu.setJVMTimeZone(consumer);

        jdbc.open(context);
        setSessionMySQLTimeZone(context, tzu.getRawUTCOffsetISONotation(mysql));
        // jdbc.executeSingleRowQuery(context, SqlOld.getSelectSimpleSql(id));
        Long millis = (Long) jdbc.getObject(context, 2);
        Timestamp queriedTimestamp = jdbc.getTimestamp(context, 3);
        jdbc.close(context);

        Assert.assertEquals(millis.longValue(), queriedTimestamp.getTime());
    }

    protected List<TimeZone> getMySqlEtcGMTList() {
        List<TimeZone> etcGmt = TimeZoneUtil.getEtcGMTList();
        Iterator<TimeZone> itr = etcGmt.iterator();
        while (itr.hasNext()) {
            TimeZone timeZone = itr.next();
            String utcOffset = tzu.getRawUTCOffsetISONotation(timeZone);
            if (isValidISONotationMySQLDoesntKnowAbout(utcOffset)) {
                itr.remove();
            }
        }
        return etcGmt;
    }

    // @Test
    public void testOneValue() {
        try {
            TimeZone chicago = tzu.getTimeZone("America/Chicago");
            TimeZone losAngeles = tzu.getTimeZone("America/Los_Angeles");
            String birthDay = "1972-09-17T10:30:00.000";
            String ambiguousLADate1 = "1970-10-25T01:30:00.000-0700";
            String ambiguousLADate2 = "1970-10-25T01:30:00.000-0800";
            int longDateLength = ambiguousLADate1.length();

            TimeZone producer = losAngeles;
            TimeZone consumer = chicago;
            String referenceDate = ambiguousLADate1;

            tzu.setJVMTimeZone(producer);
            TimeZone defaultTZ = TimeZone.getDefault();
            jdbc.open(context);
            // createDatabase(context);
            createTable(context);
            TimeZone databaseTimeZone = TimeZoneUtil.UTC;
            setSessionMySQLTimeZone(context, tzu.getRawUTCOffsetISONotation(databaseTimeZone));
            Timestamp timestamp = tsu.getTimestampNoOffset(referenceDate);
            if (referenceDate.length() == longDateLength) {
                timestamp = tsu.getTimestamp(referenceDate);
            } else {
                timestamp = tsu.getTimestampNoOffset(referenceDate);
            }
            // insertRow(context, TimeZone.getDefault(), timestamp);
            jdbc.close(context);
            tzu.setJVMTimeZone(consumer);
            TimeZone newDefaultTZ = TimeZone.getDefault();
            jdbc.open(context);
            jdbc.executeSql(context, "USE tmp");
            // jdbc.executeSingleRowQuery(context, Sql.getSelectSql());
            Timestamp newTimestamp = jdbc.getTimestamp(context, 3);
            System.out.println("Producer: " + tsu.getString(timestamp, defaultTZ) + " " + defaultTZ.getID());
            System.out.println("Consumer: " + tsu.getString(newTimestamp, newDefaultTZ) + " " + newDefaultTZ.getID());
            System.out.println("   MySQL: " + databaseTimeZone.getID() + " " + tzu.getRawUTCOffsetISONotation(databaseTimeZone));
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

    // @Test
    public void testRun() {
        try {
            createData();
            examineData();
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

    protected void createData() throws SQLException {
        jdbc.open(context);
        // createDatabase(context);
        createTable(context);
        insertData(context);
        jdbc.close(context);
    }

    protected void examineData() throws SQLException {
        // Cycle through every known TimeZone to make sure we can successfully process timestamp data regardless of what
        // timezone a JVM is set to
        for (TimeZone timeZone : TimeZoneUtil.getTimeZoneList()) {
            // Set the timezone for this JVM
            setJVMTimeZone(timeZone);

            // Now that the JVM timezone is set, connect to a MySQL server and examine data
            jdbc.open(context);
            jdbc.executeSql(context, "USE tmp");
            examineData(context);
            jdbc.close(context);
        }
    }

    protected void examineData(AdjustedRow row) {
        // TimeZone javaTimeZone = row.getJvm().getMetaData().getJavaTimeZone();
        // String javaISONotation = tzu.getISONotation(javaTimeZone);
        Timestamp javaTimestamp = getTimestampNoMillis(millis);
        // Timestamp originalJavaTimestamp = row.getJvm().getOriginalTimestamp();
        Timestamp adjustedJavaTimestamp = row.getJvm().getAdjustedTimestamp();

        // System.out.println(utcFormatter.format(javaTimestamp) + " " + utcFormatter.format(adjustedJavaTimestamp) +
        // " "
        // + utcFormatter.format(originalJavaTimestamp) + " " + javaISONotation + " " + javaTimeZone.getID());

        Assert.assertEquals(javaTimestamp, adjustedJavaTimestamp);

        Timestamp utc = row.getUtc().getAdjustedTimestamp();
        Timestamp current = row.getCurrent().getAdjustedTimestamp();

        Assert.assertEquals(utc, current);
    }

    protected void examineDataForAKnownJVMDatabaseTimeZonePair(JDBCContext context) throws SQLException {
        List<TimestampRow> rows = getTimestampRows(context);
        // System.out.println("Examining " + rows.size() + " rows for this Java/Database timezone pair");
        List<AdjustedRow> adjustedRows = getAdjustedRows(rows);
        for (AdjustedRow adjustedRow : adjustedRows) {
            examineData(adjustedRow);
        }
    }

    protected void examineData(JDBCContext context) throws SQLException {
        TimeZone javaTimeZone = TimeZone.getDefault();
        String javaISONotation = tzu.getRawUTCOffsetISONotation(javaTimeZone);
        System.out.println("Testing JVM's set to " + javaTimeZone.getID() + " (" + javaISONotation + ")");
        // Cycle through timezones known to MySQL
        List<TimeZone> databaseTimeZones = TimeZoneUtil.getEtcGMTList();
        for (TimeZone databaseTimeZone : databaseTimeZones) {
            // There is one timezone Java knows about that MySQL doesn't
            String databaseISONotation = tzu.getRawUTCOffsetISONotation(databaseTimeZone);
            if (isValidISONotationMySQLDoesntKnowAbout(databaseISONotation)) {
                continue;
            }
            // Set the MySQL timezone to what we want it to be
            setSessionMySQLTimeZone(context, databaseISONotation);
            // Now that we've set a Java timezone and the Database timezone, extract timestamp data and examine it
            examineDataForAKnownJVMDatabaseTimeZonePair(context);
        }
    }

    protected void insertData(JDBCContext context) throws SQLException {
        List<TimeZone> databaseTimeZones = TimeZoneUtil.getEtcGMTList();
        for (TimeZone databaseTimeZone : databaseTimeZones) {
            String isoNotation = tzu.getRawUTCOffsetISONotation(databaseTimeZone);
            if (isValidISONotationMySQLDoesntKnowAbout(isoNotation)) {
                continue;
            }
            setSessionMySQLTimeZone(context, isoNotation);
            System.out.println("MySQL: " + databaseTimeZone.getID() + " " + tzu.getRawUTCOffsetISONotation(databaseTimeZone));
            createJavaTimeZoneData(context);
        }
    }

    /**
     * Java passes MySQL a timestamp representing current time inside of the JVM for its timezone. MySQL dutifully
     * records this value. The issue is that the timezone information of the JVM is not recorded by MySQL. From the
     * MySQL perspective, the timestamp data is going to appear to be "off". Given a JVM set to Pacific Daylight time,
     * if you use JDBC to persist the java timestamp "2011-08-24 10:00:00" to a MySQL server set to Eastern Standard
     * time (3 hours ahead of you), and then login to the MySQL server and query the timestamp value, it returns
     * "2011-08-24 10:00:00" even though current local time on the MySQL server is in reality "2011-08-24 13:00:00".
     * MySQL has no idea that this timestamp represents Pacific Daylight Time. However, if you use a JVM to query the
     * data, the JDBC driver creates a Timestamp object set to "2011-08-24 10:00:00 and also AUTOMATICALLY assumes the
     * Timezone on the Timestamp is the same Timezone the JVM is using. Therefore, if you always use the same JVM (or
     * JVM's set to the same Timezone) to read/write MySQL timestamps, the data will always be consistent. If, however,
     * you are reading MySQL Timestamp data from a JVM that is on a different Timezone from the JVM that created the
     * data, you need to know the Timezone of the JVM that created the data in order to correctly obtain timestamp
     * information. The JDBC driver is going to automatically attach the Timezone from the current JVM to any Timestamp
     * data it reads from MySQL. If the current JVM is using a Timezone that is different from the JVM that created the
     * data, you have to adjust the Timestamp data to obtain a correct value. If you adjust the timestamp by the
     * difference between the Timezone of the current JVM and the Timezone of the JVM that created the data, you will
     * end up with the true timestamp value.
     *
     * Therefore, assuming you know what timestamp fields in your MySQL database were populated by a JVM, AND you know
     * the timezone that JVM was using when it populated them, the adjustment to make is easy. Adjust the timestamp
     * value retrieved by the JDBC driver by the difference between the TimeZone of the creating JVM and the TimeZone of
     * the current JVM
     */
    protected Timestamp getJavaTimestamp(TimeZoneAwareTimestamp timestamp) {
        TimestampMetaData md = timestamp.getMetaData();
        TimeZone producer = md.getJavaTimeZone();
        return tsu.adjustToLocal(producer, timestamp.getOriginalTimestamp());
    }

    /**
     * When MySQL creates a timestamp using UTC_TIMESTAMP the timestamp is created for the UTC timezone. Continuing the
     * scenario from above, with a MySQL server on Eastern Standard time and a JVM set to Pacific Daylight time (the jvm
     * is 3 hours behind the MySQL server) the timestamp created by MySQL at 2011-08-23 13:00:00 Eastern Standard time
     * is 2011-08-23 17:00:00 in UTC. When this timestamp value is queried on the MySQL server, it returns 2011-08-23
     * 17:00:00. The issue is that this same value is passed to the JVM when the JVM queries for it. The JVM, however,
     * automatically associates its current Timezone (Pacific Daylight time) with the timestamp data. At this point, the
     * JVM thinks the timestamp is 2011-08-23 17:00:00 PST when in reality the timestamp is 2011-08-23 17:00:00 UTC
     * which is SEVEN hours different. To get a correct value for a timestamp created by MySQL using UTC_TIMESTAMP the
     * value needs to be adjusted by the difference between the JVM's current time zone and UTC.
     */
    protected Timestamp getMySQLUTCTimestamp(TimeZoneAwareTimestamp timestamp) {
        return tsu.adjustFromUTCToLocal(timestamp.getOriginalTimestamp());
    }

    /**
     * When MySQL creates a timestamp using CURRENT_TIMESTAMP the timestamp is created using the timezone of the MySQL
     * server. In our scenario (with a MySQL server set to Eastern Standard Time) a timestamp of 2011-08-23 13:00:00 in
     * Eastern Standard Time is created by MySQL. This same value is also returned to the JVM. The problem is that the
     * JVM now thinks the timestamp represents 2011-08-23 13:00:00 PST when in reality it represents 2011-08-23 13:00:00
     * EST, which is 3 hours different. To get a correct value for these timestamps we need to know the Timezone of the
     * MySQL server. Once that is determined a correct value for the timestamp can be obtained in 2 steps. The first
     * step is to calculate the correct adjustment value to make to the timestamp. The correct adjustment to make is
     * obtained by taking the offset of the current JVM timezone from UTC (in this case -7), and subtracting the offset
     * of the MySQL timezone from UTC (in this case -4). In our scenario that value is -3. (-7 - (-4)) = -3. -3 is then
     * added to the timestamp and we have now arrived at the true correct value for the timestamp.
     */
    protected Timestamp getMySQLCurrentTimestamp(TimeZoneAwareTimestamp timestamp) {
        TimestampMetaData md = timestamp.getMetaData();
        TimeZone producer = md.getDatabaseTimeZone();
        return tsu.adjustToLocal(producer, timestamp.getOriginalTimestamp());
    }

    /**
     * Given a TimeZoneAwareTimestamp object, return a Timestamp that indicates a "real" timestamp. That is to say,
     * adjust the timestamp if necessary by the rules applicable to how the timestamp was originally generated and
     * stored.
     */
    protected Timestamp getAdjustedTimestamp(TimeZoneAwareTimestamp timestamp) {
        TimestampMetaData md = timestamp.getMetaData();
        TimestampProducer producer = md.getProducer();
        switch (producer) {
        case DATABASE_UTC:
            return getMySQLUTCTimestamp(timestamp);
        case DATABASE:
            return getMySQLCurrentTimestamp(timestamp);
        case JAVA:
            return getJavaTimestamp(timestamp);
        default:
            throw new IllegalArgumentException("Timestamp producer " + producer + " is unknown");
        }
    }

    /**
     * Extract the timestamp generated by MySQL using CURRENT_TIMESTAMP into a TimeZoneAwareTimestamp object
     */
    protected TimeZoneAwareTimestamp getMySQLCurrentTimestamp(TimestampRow row) {
        TimeZoneAwareTimestamp timestamp = new TimeZoneAwareTimestamp();
        timestamp.setOriginalTimestamp(row.getCurrentTimestamp());
        TimestampMetaData md = new TimestampMetaData();
        md.setProducer(TimestampProducer.DATABASE);
        md.setJavaTimeZone(row.getMySqlTimeZone());
        md.setDatabaseTimeZone(row.getMySqlTimeZone());
        timestamp.setMetaData(md);
        return timestamp;
    }

    /**
     * Extract the timestamp generated by MySQL using UTC_TIMESTAMP into a TimeZoneAwareTimestamp object
     */
    protected TimeZoneAwareTimestamp getMySQLUTCTimestamp(TimestampRow row) {
        TimeZoneAwareTimestamp timestamp = new TimeZoneAwareTimestamp();
        timestamp.setOriginalTimestamp(row.getUtcTimestamp());
        TimestampMetaData md = new TimestampMetaData();
        md.setProducer(TimestampProducer.DATABASE_UTC);
        md.setJavaTimeZone(row.getMySqlTimeZone());
        md.setDatabaseTimeZone(row.getMySqlTimeZone());
        timestamp.setMetaData(md);
        return timestamp;
    }

    /**
     * Extract the timestamp generated by java into a TimeZoneAwareTimestamp object
     */
    protected TimeZoneAwareTimestamp getJVMTimestamp(TimestampRow row) {
        TimeZoneAwareTimestamp timestamp = new TimeZoneAwareTimestamp();
        timestamp.setOriginalTimestamp(row.getJvmTimestamp());
        TimestampMetaData md = new TimestampMetaData();
        md.setProducer(TimestampProducer.JAVA);
        md.setJavaTimeZone(row.getJvmTimeZone());
        md.setDatabaseTimeZone(row.getMySqlTimeZone());
        timestamp.setMetaData(md);
        return timestamp;
    }

    /**
     * Convert a TimestampRow into an AdjustedRow
     */
    protected AdjustedRow getAdjustedRow(TimestampRow row) {
        TimeZoneAwareTimestamp java = getJVMTimestamp(row);
        TimeZoneAwareTimestamp utc = getMySQLCurrentTimestamp(row);
        TimeZoneAwareTimestamp current = getMySQLCurrentTimestamp(row);

        AdjustedRow ar = new AdjustedRow();
        ar.setJvm(java);
        ar.setUtc(utc);
        ar.setCurrent(current);

        Timestamp adjustedJava = getAdjustedTimestamp(java);
        Timestamp adjustedUtc = getAdjustedTimestamp(utc);
        Timestamp adjustedCurrent = getAdjustedTimestamp(current);

        java.setAdjustedTimestamp(adjustedJava);
        utc.setAdjustedTimestamp(adjustedUtc);
        current.setAdjustedTimestamp(adjustedCurrent);

        return ar;
    }

    /**
     * Convert TimestampRow objects into AdjustedRow objects
     */
    protected List<AdjustedRow> getAdjustedRows(List<TimestampRow> rows) {
        List<AdjustedRow> adjustedRows = new ArrayList<AdjustedRow>();
        for (TimestampRow row : rows) {
            AdjustedRow ar = getAdjustedRow(row);
            adjustedRows.add(ar);
        }
        return adjustedRows;
    }

    /**
     * Extract data from the timestamp table into a List of TimestampRow objects
     */
    protected List<TimestampRow> getTimestampRows(JDBCContext context) throws SQLException {
        String sql = null;// Sql.getSelectSql();
        ResultSet rs = jdbc.executeQuery(context, sql);
        List<TimestampRow> rows = new ArrayList<TimestampRow>();
        while (rs.next()) {
            TimestampRow row = getTimestampRow(context);
            rows.add(row);
        }
        return rows;
    }

    /**
     * Convert a row of data from the timestamp table into java objects<br>
     *
     * ResultSet.getTimestamp() is called on the timestamp columns
     */
    protected TimestampRow getTimestampRow(JDBCContext context) throws SQLException {
        String javaTimeZoneId = (String) jdbc.getObject(context, 1);
        String databaseISONotation = (String) jdbc.getObject(context, 2);

        TimeZone javaTimeZone = tzu.getTimeZone(javaTimeZoneId);

        String s = jdbc.getString(context, 3);
        Timestamp jvm = jdbc.getTimestamp(context, 3);
        Timestamp jvm2 = jdbc.getTimestamp(context, 3, javaTimeZone);
        Timestamp utc = jdbc.getTimestamp(context, 4);
        Timestamp current = jdbc.getTimestamp(context, 5);

        TimestampRow row = new TimestampRow();
        row.setJvmTimeZone(tzu.getTimeZone(javaTimeZoneId));
        row.setMySqlTimeZone(tzu.getEtcGMTTimeZone(databaseISONotation));
        row.setJvmTimestamp(jvm);
        row.setUtcTimestamp(utc);
        row.setCurrentTimestamp(current);
        return row;
    }

    /**
     * Create a table of data that covers all of the JVM timezone possibilities given a MySQL timezone.
     */
    protected void createJavaTimeZoneData(JDBCContext context) throws SQLException {
        Collection<TimeZone> javaTimeZones = TimeZoneUtil.getTimeZoneMap().values();
        int count = 0;
        for (TimeZone javaTimeZone : javaTimeZones) {
            setJVMTimeZone(javaTimeZone);
            Timestamp timestamp = getTimestampNoMillis(millis);
            // insertRow(context, javaTimeZone, timestamp);
            if (count++ > 25) {
                break;
            }
        }
    }

    protected Integer[] getJavaOffsets(int databaseOffset) {
        List<Integer> javaOffsets = new ArrayList<Integer>();
        for (TimeZone timeZone : TimeZoneUtil.getEtcGMTList()) {
            javaOffsets.add(timeZone.getRawOffset());
        }
        return javaOffsets.toArray(new Integer[javaOffsets.size()]);
    }

    /**
     * Create a row of data via JDBC that contains the following:<br>
     * 1) A timestamp generated by the JVM<br>
     * 2) A timestamp generated by MySQL using UTC_TIMESTAMP<br>
     * 3) A timestamp generated by MySQL using CURRENT_TIMESTAMP
     */
    protected void insertRow(JDBCContext context, TimeZone javaTimeZone, Timestamp timestamp, int id)
            throws SQLException {
        // Sql for inserting a row into the "ts" timestamp table
        // String insertSql = Sql.getInsertSql();
        String insertSql = SqlOld.getInsertSimpleSql();

        // Appropriate values for that row
        // List<?> values = Sql.getInsertValues(javaTimeZone, timestamp, id);
        List<?> values = SqlOld.getInsertSimpleValues(javaTimeZone, timestamp, id);

        // Create the row
        jdbc.executeSql(context, insertSql, values);
    }

    /**
     * Create a table for holding timestamp values
     */
    protected void createTable(JDBCContext context) throws SQLException {
        jdbc.executeSql(context, SqlOld.getCreateTableSQL());
    }

    /**
     * Test that we can successfully manipulate the TimeZone of the JVM
     */
    @Test
    public void testSetTimeZone() {
        // Get the default timezone of the JVM
        TimeZone original = TimeZone.getDefault();

        // Get UTC time, unless the JVM is already set to UTC, in which case get +01:00
        int javaOffset = original.getRawOffset() == 0 ? TimeZoneUtil.MILLIS_PER_HOUR : 0;
        TimeZone newTimeZone = tzu.getEtcGMTTimeZone(javaOffset);

        // Set the JVM to the new TimeZone
        setJVMTimeZone(newTimeZone);

        // Invoke getDefault() to get a handle to the new timezone
        TimeZone adjusted = TimeZone.getDefault();

        // Set the TimeZone back to the way it was
        setJVMTimeZone(original);

        // Invoke getDefault() to get a handle to the new default timezone
        TimeZone adjustedBackToOriginal = TimeZone.getDefault();

        // Verify that getDefault() returned the new TimeZone
        Assert.assertEquals(newTimeZone.getRawOffset(), adjusted.getRawOffset());

        // Verify that getDefault() was adjusted back to its original value
        Assert.assertEquals(original.getRawOffset(), adjustedBackToOriginal.getRawOffset());
    }

    /**
     * Test the formatting and parsing of a Timestamp on JVM's using different default time zones. The SimpleDateFormat
     * class "inherits" the current default timezone of the JVM when SimpleDateFormat is instantiated
     */
    @Test
    public void testTimestampFormattingAndParsing() throws Exception {
        setJVMTimeZone(TimeZoneUtil.UTC);

        // Get a timestamp from the millis
        Timestamp timestamp = new Timestamp(millis);

        // Format the Timestamp into a UTC string and then parse the string back into a java.util.Date object
        String utcString = TimestampContext.formatUTC(timestamp);
        Date utcDate = TimestampContext.parseUTC(utcString);

        // Retain a handle to some formatters will use the current timezone (+00:00)
        TimestampContext original = new TimestampContext();
        original.setNonTimeZoneAwareFormatter(new SimpleDateFormat(isoFormatWithoutTimezone));
        original.setTimeZoneAwareFormatter(new SimpleDateFormat(isoFormat));

        // Set the JVM to a different timezone (+01:00)
        int newOffset = TimeZone.getDefault().getRawOffset() + TimeZoneUtil.MILLIS_PER_HOUR;
        TimeZone newTimeZone = tzu.getEtcGMTTimeZone(newOffset);
        setJVMTimeZone(newTimeZone);

        // Retain a handle to some formatters that will use the new timezone (+01:00)
        TimestampContext adjusted = new TimestampContext();
        adjusted.setNonTimeZoneAwareFormatter(new SimpleDateFormat(isoFormatWithoutTimezone));
        adjusted.setTimeZoneAwareFormatter(new SimpleDateFormat(isoFormat));

        // Format the timestamp into a string, but omit timezone information
        // When these strings are parsed by a JVM, the JVM assumes they are timestamps from the same timezone as itself
        String noZone1 = original.formatNoTimezone(timestamp);
        String noZone2 = adjusted.formatNoTimezone(timestamp);

        // Format the timestamp into strings that include timezone information
        // Any JVM can correctly parse them regardless of what timezone it is set to
        String hasZone1 = original.formatWithTimezone(timestamp);
        String hasZone2 = adjusted.formatWithTimezone(timestamp);

        // The strings are all different
        Assert.assertFalse(noZone1.equals(noZone2));
        Assert.assertFalse(hasZone1.equals(hasZone2));

        // Convert all of the strings back into date's
        Date noZoneDate1 = original.parseStringNoTimeZone(noZone1);
        Date noZoneDate2 = original.parseStringNoTimeZone(noZone2);
        Date noZoneDate3 = adjusted.parseStringNoTimeZone(noZone1);
        Date noZoneDate4 = adjusted.parseStringNoTimeZone(noZone2);

        // Without timezone information, strings that represent the exact same moment in time, get parsed into Date
        // objects that represent different moments in time
        Assert.assertFalse(noZoneDate1.equals(noZoneDate2));
        Assert.assertFalse(noZoneDate3.equals(noZoneDate4));

        // With timezone information, we don't have this problem
        // Formatters from JVM's with 2 different timezones can both correctly parse the strings into a Date
        // object representing the exact same moment in time
        // Parse the strings using the formatters from the original timezone
        Date hasZoneDate1 = original.parseStringWithTimeZone(hasZone1);
        Date hasZoneDate2 = original.parseStringWithTimeZone(hasZone2);

        // Parse the strings using the formatters from the new timezone
        Date hasZoneDate3 = adjusted.parseStringWithTimeZone(hasZone1);
        Date hasZoneDate4 = adjusted.parseStringWithTimeZone(hasZone2);

        // Prove that all 4 date objects represent the exact same moment in time
        Assert.assertTrue(utcDate.equals(hasZoneDate1));
        Assert.assertTrue(hasZoneDate1.equals(hasZoneDate2));
        Assert.assertTrue(hasZoneDate2.equals(hasZoneDate3));
        Assert.assertTrue(hasZoneDate3.equals(hasZoneDate4));
    }

    @Test
    public void tesMySQLTimeZoneManipulation() throws Exception {
        try {
            int negativeOneHour = TimeZoneUtil.MILLIS_PER_HOUR * -1;
            int positiveOneHour = TimeZoneUtil.MILLIS_PER_HOUR;
            String negativeISONotation = tzu.getISONotationFromMillis(negativeOneHour);
            String positiveISONotation = tzu.getISONotationFromMillis(positiveOneHour);
            String zeroISONotation = tzu.getISONotationFromMillis(0);
            setGlobalMySQLTimeZone(context, zeroISONotation);
            jdbc.open(context);
            setSessionMySQLTimeZone(context, negativeISONotation);
            TimeZone negativeTimeZone = getMySQLTimeZone(context);
            setSessionMySQLTimeZone(context, zeroISONotation);
            TimeZone utc = getMySQLTimeZone(context);
            setSessionMySQLTimeZone(context, positiveISONotation);
            TimeZone positiveTimeZone = getMySQLTimeZone(context);
            jdbc.close(context);

            Assert.assertEquals(negativeOneHour, negativeTimeZone.getRawOffset());
            Assert.assertEquals(0, utc.getRawOffset());
            Assert.assertEquals(positiveOneHour, positiveTimeZone.getRawOffset());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Set the JVM to the Etc/GMT timezone with the indicated offset from UTC
     */
    protected void setJVMTimeZone(int offset) {
        TimeZone newTimeZone = tzu.getEtcGMTTimeZone(offset);
        setJVMTimeZone(newTimeZone);
    }

    /**
     * Set the JVM to a new default TimeZone. This is done by calling TimeZone.setDefault(null) and then setting the
     * system property "user.timezone" to the id of the timezone passed in. Once those steps are taken,
     * TimeZone.getDefault() has essentially been "reset". The next time it is invoked, it uses it's internal rules to
     * figure out what timezone to use, and the system property "wins".
     */
    protected void setJVMTimeZone(TimeZone timeZone) {
        TimeZone.setDefault(null);
        System.setProperty("user.timezone", timeZone.getID());
        TimeZone.getDefault();
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

    /**
     * Set the global MySQL timezone for for all future connections to the indicated UTC offset.
     *
     * NOTE: This does not affect currently connected sessions. They must disconnect/reconnect to begin using this
     * timezone.
     */
    protected void setGlobalMySQLTimeZone(JDBCContext context, String isoNotation) throws SQLException {
        jdbc.open(context);
        setMySQLTimeZone(context, "GLOBAL", isoNotation);
        jdbc.close(context);
    }

    protected boolean isUseHostTimeZone(String text) {
        return TimeZoneVariable.SYSTEM.equalsIgnoreCase(text);
    }

    protected MySQLTimeZoneContext getMySQLTimeZoneContext(JDBCContext context) throws SQLException {
        // Construct a query for the timezone information
        String query = SqlOld.getMySQLTimeZoneQuery();

        // Execute the query
        // jdbc.executeSingleRowQuery(context, query);

        // Extract information from the ResultSet
        String systemTimeZoneText = (String) jdbc.getObject(context, MySQLTimeZoneField.SYSTEM.getColumn());
        String globalTimeZoneText = (String) jdbc.getObject(context, MySQLTimeZoneField.GLOBAL.getColumn());
        String sessionTimeZoneText = (String) jdbc.getObject(context, MySQLTimeZoneField.SESSION.getColumn());
        Integer sessionOffsetFromUTCInMinutes = new Integer(jdbc.getObject(context,
                MySQLTimeZoneField.OFFSET.getColumn())
                + "");

        // Store it in TimeZoneVariable objects
        TimeZoneVariable system = getTimeZoneVariable(MySQLTimeZoneField.SYSTEM, systemTimeZoneText);
        TimeZoneVariable global = getTimeZoneVariable(MySQLTimeZoneField.GLOBAL, globalTimeZoneText);
        TimeZoneVariable session = getTimeZoneVariable(MySQLTimeZoneField.SESSION, sessionTimeZoneText);

        // Our "safety net" is this SessionOffset object
        // It will always give us an offset from UTC to fall back on if we can't convert the other timezone
        // information into a java TimeZone object
        SessionOffset offset = new SessionOffset();
        offset.setValue(sessionOffsetFromUTCInMinutes * TimeZoneUtil.MILLIS_PER_MINUTE);
        offset.setTimeZone(tzu.getEtcGMTTimeZone(sessionOffsetFromUTCInMinutes * TimeZoneUtil.MILLIS_PER_MINUTE));

        // Aggregate the timezone information we have
        MySQLTimeZoneContext timeZoneContext = new MySQLTimeZoneContext();
        timeZoneContext.setSystem(system);
        timeZoneContext.setGlobal(global);
        timeZoneContext.setSession(session);
        timeZoneContext.setOffset(offset);

        // Figure out what TimeZone is currently in use for this connection
        TimeZone timeZoneToUse = getTimeZoneToUse(timeZoneContext);
        timeZoneContext.setTimeZoneToUse(timeZoneToUse);

        return timeZoneContext;
    }

    protected TimeZoneVariable getTimeZoneVariable(MySQLTimeZoneField field, String text) {
        TimeZoneVariable variable = new TimeZoneVariable();
        variable.setName(field.getSelect());
        variable.setValue(text);
        variable.setTimeZone(getMySqlTimeZone(text));
        return variable;
    }

    protected TimeZone getMySqlTimeZone(String text) {
        if (isUseHostTimeZone(text)) {
            return null;
        }
        if (tzu.isValidISONotation(text)) {
            return tzu.getEtcGMTTimeZone(text);
        }
        return tzu.getTimeZone(text);
    }

    protected TimeZone getTimeZoneToUse(MySQLTimeZoneContext context) {
        TimeZone returnValue = context.getSession().getTimeZone();
        if (returnValue == null) {
            returnValue = context.getOffset().getTimeZone();
        }
        if (returnValue == null) {
            returnValue = context.getGlobal().getTimeZone();
        }
        if (returnValue == null) {
            returnValue = context.getSystem().getTimeZone();
        }
        return returnValue;
    }

    protected boolean isValid(MySQLTimeZoneContext context) {
        TimeZone timeZoneToUse = context.getTimeZoneToUse();
        SessionOffset offset = context.getOffset();
        if (timeZoneToUse == null) {
            return false;
        }
        if (offset == null || offset.getTimeZone() == null) {
            return false;
        }
        long offset1 = timeZoneToUse.getRawOffset();
        long offset2 = offset.getTimeZone().getRawOffset();
        return offset1 == offset2;
    }

    protected void validate(MySQLTimeZoneContext context) {
        if (!isValid(context)) {
            throw new IllegalArgumentException("Unable to validate timezone information for MySQL" + context);
        }
    }

    /**
     * Determine the java timezone applicable for our current connection to this MySQL server
     */
    protected TimeZone getMySQLTimeZone(JDBCContext context) throws SQLException {
        MySQLTimeZoneContext timeZoneContext = getMySQLTimeZoneContext(context);
        validate(timeZoneContext);
        return timeZoneContext.getTimeZoneToUse();
    }

    /**
     * Get a timestamp with the millisecond values set to 0. MySQL only records timestamps with a precision of seconds
     * (not milliseconds), so we can only compare for equality on Dates that have no millisecond value.
     */
    protected Timestamp getTimestampNoMillis(long millis) {
        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(millis);
        c.set(Calendar.MILLISECOND, 0);
        return new Timestamp(c.getTimeInMillis());
    }

    /**
     * Return a JDBC context for default localhost
     */
    private static JDBCContext getLocalhostTmp() {
        return getLocalhost("jdbc:mysql://localhost/tmp");
    }

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
     * Return a JDBC context for a public MySQL server I found
     */
    protected JDBCContext getPublic() {
        JDBCContext context = new JDBCContext();
        context.setUrl("jdbc:mysql://ensembldb.ensembl.org/master_schema_34");
        context.setUsername("anonymous");
        context.setPassword("");
        context.setDriver(DRIVER);
        return context;
    }

    protected SimpleDateFormat getUTCFormatter() {
        SimpleDateFormat sdf = new SimpleDateFormat(isoFormat);
        sdf.setTimeZone(TimeZoneUtil.UTC);
        return sdf;
    }

    protected long getMillis(String utcString) {
        try {
            Date date = utcFormatter.parse(utcString);
            return date.getTime();
        } catch (ParseException e) {
            throw new IllegalArgumentException(e);
        }
    }

    protected boolean isValidISONotationMySQLDoesntKnowAbout(String isoNotation) {
        for (String validISONotation : isoNotationsUnknownToMySql) {
            if (validISONotation.equals(isoNotation)) {
                return true;
            }
        }
        return false;
    }

}
