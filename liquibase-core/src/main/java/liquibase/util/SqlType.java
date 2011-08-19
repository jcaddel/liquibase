package liquibase.util;

import java.sql.Types;

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
}
