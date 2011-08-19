package liquibase.util;

import java.sql.Types;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum SqlType {
    ARRAY(Types.ARRAY),
    BIGINT(Types.BIGINT),
    BINARY(Types.BINARY),
    BIT(Types.BIT),
    BLOB(Types.BLOB),
    BOOLEAN(Types.BOOLEAN),
    CHAR(Types.CHAR),
    CLOB(Types.CLOB),
    DATALINK(Types.DATALINK),
    DATE(Types.DATE),
    DECIMAL(Types.DECIMAL),
    DISTINCT(Types.DISTINCT),
    DOUBLE(Types.DOUBLE),
    FLOAT(Types.FLOAT),
    INTEGER(Types.INTEGER),
    JAVA_OBJECT(Types.JAVA_OBJECT),
    LONGVARBINARY(Types.LONGVARBINARY),
    LONGVARCHAR(Types.LONGVARCHAR),
    NULL(Types.NULL),
    NUMERIC(Types.NUMERIC),
    OTHER(Types.OTHER),
    REAL(Types.REAL),
    REF(Types.REF),
    SMALLINT(Types.SMALLINT),
    STRUCT(Types.STRUCT),
    TIME(Types.TIME),
    TIMESTAMP(Types.TIMESTAMP),
    TINYINT(Types.TINYINT),
    VARBINARY(Types.VARBINARY),
    VARCHAR(Types.VARCHAR),
    UNKNOWN(-1);

    private final int value;

    SqlType(int value) {
        this.value = value;
    }

    public int getValue() {
        return this.value;
    }

    public static final List<SqlType> NUMERIC_TYPES = new ArrayList<SqlType>(Arrays.asList(getNumericTypes()));
    public static final List<SqlType> STRING_TYPES = new ArrayList<SqlType>(Arrays.asList(getStringTypes()));
    public static final List<SqlType> DATE_TYPES = new ArrayList<SqlType>(Arrays.asList(getDateTypes()));

    private static final SqlType[] getNumericTypes() {
        return new SqlType[] { BIGINT, BIT, DECIMAL, DOUBLE, FLOAT, INTEGER, NUMERIC, REAL, SMALLINT, TINYINT };
    }

    private static final SqlType[] getDateTypes() {
        return new SqlType[] { DATE, TIME, TIMESTAMP };
    }

    private static final SqlType[] getStringTypes() {
        return new SqlType[] { CHAR, CLOB, LONGVARCHAR, VARCHAR };
    }

    public static final boolean isBoolean(String type) {
        return valueOf(type).equals(BOOLEAN);
    }

    public static final boolean isNumeric(String type) {
        return NUMERIC_TYPES.contains(valueOf(type));
    }

    public static final boolean isString(String type) {
        return STRING_TYPES.contains(valueOf(type));
    }

    public static final boolean isDate(String type) {
        return DATE_TYPES.contains(valueOf(type));
    }
}
