package liquibase.database.typeconversion.core;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Types;
import java.text.ParseException;
import java.util.Arrays;
import java.util.List;

import liquibase.change.ColumnConfig;
import liquibase.database.Database;
import liquibase.database.core.DB2Database;
import liquibase.database.core.DerbyDatabase;
import liquibase.database.core.H2Database;
import liquibase.database.core.HsqlDatabase;
import liquibase.database.core.InformixDatabase;
import liquibase.database.core.MSSQLDatabase;
import liquibase.database.core.MySQLDatabase;
import liquibase.database.core.OracleDatabase;
import liquibase.database.core.PostgresDatabase;
import liquibase.database.structure.Column;
import liquibase.database.structure.type.BigIntType;
import liquibase.database.structure.type.BlobType;
import liquibase.database.structure.type.BooleanType;
import liquibase.database.structure.type.CharType;
import liquibase.database.structure.type.ClobType;
import liquibase.database.structure.type.CurrencyType;
import liquibase.database.structure.type.CustomType;
import liquibase.database.structure.type.DataType;
import liquibase.database.structure.type.DatabaseFunctionType;
import liquibase.database.structure.type.DateTimeType;
import liquibase.database.structure.type.DateType;
import liquibase.database.structure.type.DoubleType;
import liquibase.database.structure.type.FloatType;
import liquibase.database.structure.type.IntType;
import liquibase.database.structure.type.NVarcharType;
import liquibase.database.structure.type.NumberType;
import liquibase.database.structure.type.SmallIntType;
import liquibase.database.structure.type.TextType;
import liquibase.database.structure.type.TimeType;
import liquibase.database.structure.type.TinyIntType;
import liquibase.database.structure.type.UUIDType;
import liquibase.database.structure.type.VarcharType;
import liquibase.database.typeconversion.TypeConverter;
import liquibase.exception.DateParseException;
import liquibase.exception.UnexpectedLiquibaseException;
import liquibase.logging.LogFactory;
import liquibase.statement.DatabaseFunction;
import liquibase.util.StringUtils;

public abstract class AbstractTypeConverter implements TypeConverter {
    public static final String NULL = "NULL";
    public static final String JAVA_SQL_TYPES = "java.sql.Types";

    List<Integer> noParens = Arrays.asList(Types.ARRAY, Types.BIGINT, Types.BINARY, Types.BIT, Types.BLOB,
            Types.BOOLEAN, Types.CLOB, Types.DATALINK, Types.DATE, Types.DISTINCT, Types.INTEGER, Types.JAVA_OBJECT,
            Types.LONGVARBINARY, Types.NULL, Types.OTHER, Types.REF, Types.SMALLINT, Types.STRUCT, Types.TIME,
            Types.TIMESTAMP, Types.TINYINT, Types.LONGVARCHAR);

    List<Integer> oneParam = Arrays.asList(Types.CHAR, Types.NCHAR, Types.VARCHAR, Types.NVARCHAR, Types.VARBINARY,
            Types.DOUBLE, Types.FLOAT);

    List<Integer> twoParams = Arrays.asList(Types.DECIMAL, Types.NUMERIC, Types.REAL);

    @Override
    public Object convertDatabaseValueToObject(Object value, int databaseDataType, int firstParameter,
            int secondParameter, Database database) throws ParseException {
        if (value == null) {
            return null;
        } else if (value instanceof String) {
            String s = (String) value;
            s = s.replaceFirst("^'", "");
            s = s.replaceFirst("'$", "");
            return convertToCorrectObjectType(s, databaseDataType, firstParameter, secondParameter, database);
        } else {
            return value;
        }
    }

    @Override
    public DataType getDataType(Object object) {
        if (object instanceof BigInteger) {
            return getBigIntType();
        } else if (object instanceof Boolean) {
            return getBooleanType();
        } else if (object instanceof String) {
            return getVarcharType();
        } else if (object instanceof java.sql.Date) {
            return getDateType();
        } else if (object instanceof java.sql.Timestamp) {
            return getDateTimeType();
        } else if (object instanceof java.sql.Time) {
            return getTimeType();
        } else if (object instanceof java.util.Date) {
            return getDateTimeType();
        } else if (object instanceof Double) {
            return getDoubleType();
        } else if (object instanceof Float) {
            return getFloatType();
        } else if (object instanceof Integer) {
            return getIntType();
        } else if (object instanceof Long) {
            return getBigIntType();
        } else if (object instanceof DatabaseFunction) {
            return new DatabaseFunctionType();
        } else {
            throw new UnexpectedLiquibaseException("Unknown object type " + object.getClass().getName());
        }
    }

    protected boolean isText(int type) {
        switch (type) {
        case Types.CLOB:
        case Types.VARCHAR:
        case Types.CHAR:
        case Types.LONGVARCHAR:
            return true;
        default:
            return false;
        }
    }

    protected Object convertToCorrectObjectType(String value, int dataType, int columnSize, int decimalDigits,
            Database database) throws ParseException {
        if (value == null) {
            return null;
        }
        if (isText(dataType)) {
            if (value.equalsIgnoreCase(NULL)) {
                return null;
            } else {
                return value;
            }
        }

        value = StringUtils.trimToNull(value);
        if (value == null) {
            return null;
        }

        try {
            if (dataType == Types.DATE) {
                return new java.sql.Date(database.parseDate(value).getTime());
            } else if (dataType == Types.TIMESTAMP) {
                return new java.sql.Timestamp(database.parseDate(value).getTime());
            } else if (dataType == Types.TIME) {
                return new java.sql.Time(database.parseDate(value).getTime());
            } else if (dataType == Types.BIGINT) {
                return new BigInteger(value);
            } else if (dataType == Types.BIT) {
                value = value.replaceFirst("b'", ""); // mysql puts wierd chars in bit field
                if (value.equalsIgnoreCase("true")) {
                    return Boolean.TRUE;
                } else if (value.equalsIgnoreCase("false")) {
                    return Boolean.FALSE;
                } else if (value.equals("1")) {
                    return Boolean.TRUE;
                } else if (value.equals("0")) {
                    return Boolean.FALSE;
                } else if (value.equals("(1)")) {
                    return Boolean.TRUE;
                } else if (value.equals("(0)")) {
                    return Boolean.FALSE;
                }
                throw new ParseException("Unknown bit value: " + value, 0);
            } else if (dataType == Types.BOOLEAN) {
                return Boolean.valueOf(value);
            } else if (dataType == Types.DECIMAL) {
                if (decimalDigits == 0) {
                    return new Integer(value);
                }
                return new BigDecimal(value);
            } else if (dataType == Types.DOUBLE || dataType == Types.NUMERIC) {
                return new BigDecimal(value);
            } else if (dataType == Types.FLOAT) {
                return new Float(value);
            } else if (dataType == Types.INTEGER) {
                return new Integer(value);
            } else if (dataType == Types.NULL) {
                return null;
            } else if (dataType == Types.REAL) {
                return new Float(value);
            } else if (dataType == Types.SMALLINT) {
                return new Integer(value);
            } else if (dataType == Types.TINYINT) {
                return new Integer(value);
            } else if (dataType == Types.BLOB) {
                return "!!!!!! LIQUIBASE CANNOT OUTPUT BLOB VALUES !!!!!!";
            } else {
                LogFactory.getLogger().warning("Do not know how to convert type " + dataType);
                return value;
            }
        } catch (DateParseException e) {
            return new DatabaseFunction(value);
        } catch (NumberFormatException e) {
            return new DatabaseFunction(value);
        }
    }

    protected String getPrecision(String s) {
        boolean hasParenthesis = s.contains("(") && s.contains(")");
        if (!hasParenthesis) {
            return null;
        }
        int beginIndex = s.indexOf("(") + 1;
        int endIndex = s.indexOf(")");
        return s.substring(beginIndex, endIndex);
    }

    protected String getDataTypeName(String columnTypeString) {

        boolean hasLeftParenthesis = columnTypeString.contains("(");
        boolean javaSqlType = columnTypeString.startsWith(JAVA_SQL_TYPES);

        int beginIndex = 0;
        int endIndex = columnTypeString.length();
        if (javaSqlType) {
            beginIndex = columnTypeString.lastIndexOf(".") + 1;
        }
        if (hasLeftParenthesis) {
            endIndex = columnTypeString.indexOf("(");
        }
        return columnTypeString.substring(beginIndex, endIndex);
    }

    protected String getAdditionalInformation(String columnTypeString) {
        if (!columnTypeString.contains(")")) {
            return null;
        }
        return StringUtils.trimToNull(columnTypeString.replaceFirst(".*\\)", ""));
    }

    protected DataTypeContext getDataTypeContext(String columnTypeString, Boolean autoIncrement) {
        // Parse out data type and precision
        // Example cases: "CLOB", "java.sql.Types.CLOB", "CLOB(10000)", "java.sql.Types.CLOB(10000)
        String precision = getPrecision(columnTypeString);
        String dataTypeName = getDataTypeName(columnTypeString);
        String additionalInformation = getAdditionalInformation(columnTypeString);

        DataTypeContext context = new DataTypeContext();
        context.setAdditionalInformation(additionalInformation);
        context.setPrecision(precision);
        context.setDataTypeName(dataTypeName);
        return context;
    }

    /**
     * Returns the database-specific datatype for the given column configuration. This method will convert some generic
     * column types (e.g. boolean, currency) to the correct type for the current database.
     */
    @Override
    public DataType getDataType(String columnTypeString, Boolean autoIncrement) {
        DataTypeContext context = getDataTypeContext(columnTypeString, autoIncrement);

        return getDataType(columnTypeString, autoIncrement, context);
    }

    protected DataType getDataType(String columnTypeString, Boolean autoIncrement, DataTypeContext context) {
        String dataTypeName = context.getDataTypeName();
        // Translate type to database-specific type, if possible
        DataType returnTypeName = null;
        if (dataTypeName.equalsIgnoreCase("BIGINT")) {
            returnTypeName = getBigIntType();
        } else if (dataTypeName.equalsIgnoreCase("NUMBER") || dataTypeName.equalsIgnoreCase("NUMERIC")) {
            returnTypeName = getNumberType();
        } else if (dataTypeName.equalsIgnoreCase("BLOB")) {
            returnTypeName = getBlobType();
        } else if (dataTypeName.equalsIgnoreCase("BOOLEAN")) {
            returnTypeName = getBooleanType();
        } else if (dataTypeName.equalsIgnoreCase("CHAR")) {
            returnTypeName = getCharType();
        } else if (dataTypeName.equalsIgnoreCase("CLOB")) {
            returnTypeName = getClobType();
        } else if (dataTypeName.equalsIgnoreCase("CURRENCY")) {
            returnTypeName = getCurrencyType();
        } else if (dataTypeName.equalsIgnoreCase("DATE")
                || dataTypeName.equalsIgnoreCase(getDateType().getDataTypeName())) {
            returnTypeName = getDateType();
        } else if (dataTypeName.equalsIgnoreCase("DATETIME")
                || dataTypeName.equalsIgnoreCase(getDateTimeType().getDataTypeName())) {
            returnTypeName = getDateTimeType();
        } else if (dataTypeName.equalsIgnoreCase("DOUBLE")) {
            returnTypeName = getDoubleType();
        } else if (dataTypeName.equalsIgnoreCase("FLOAT")) {
            returnTypeName = getFloatType();
        } else if (dataTypeName.equalsIgnoreCase("INT")) {
            returnTypeName = getIntType();
        } else if (dataTypeName.equalsIgnoreCase("INTEGER")) {
            returnTypeName = getIntType();
        } else if (dataTypeName.equalsIgnoreCase("LONGBLOB")) {
            returnTypeName = getLongBlobType();
        } else if (dataTypeName.equalsIgnoreCase("LONGVARBINARY")) {
            returnTypeName = getBlobType();
        } else if (dataTypeName.equalsIgnoreCase("LONGVARCHAR")) {
            returnTypeName = getClobType();
        } else if (dataTypeName.equalsIgnoreCase("SMALLINT")) {
            returnTypeName = getSmallIntType();
        } else if (dataTypeName.equalsIgnoreCase("TEXT")) {
            returnTypeName = getClobType();
        } else if (dataTypeName.equalsIgnoreCase("TIME")
                || dataTypeName.equalsIgnoreCase(getTimeType().getDataTypeName())) {
            returnTypeName = getTimeType();
        } else if (dataTypeName.toUpperCase().contains("TIMESTAMP")) {
            returnTypeName = getDateTimeType();
        } else if (dataTypeName.equalsIgnoreCase("TINYINT")) {
            returnTypeName = getTinyIntType();
        } else if (dataTypeName.equalsIgnoreCase("UUID")) {
            returnTypeName = getUUIDType();
        } else if (dataTypeName.equalsIgnoreCase("VARCHAR")) {
            returnTypeName = getVarcharType();
        } else if (dataTypeName.equalsIgnoreCase("NVARCHAR")) {
            returnTypeName = getNVarcharType();
        } else {
            return new CustomType(columnTypeString, 0, 2);
        }

        if (returnTypeName == null) {
            throw new UnexpectedLiquibaseException("Could not determine " + dataTypeName + " for "
                    + this.getClass().getName());
        }

        addPrecisionToType(context.getPrecision(), returnTypeName);
        returnTypeName.setAdditionalInformation(context.getAdditionalInformation());

        return returnTypeName;
    }

    protected void addPrecisionToType(String precision, DataType returnTypeName) throws NumberFormatException {
        if (precision != null) {
            String[] params = precision.split(",");
            returnTypeName.setFirstParameter(params[0].trim());
            if (params.length > 1) {
                returnTypeName.setSecondParameter(params[1].trim());
            }
        }
    }

    @Override
    public DataType getDataType(ColumnConfig columnConfig) {
        return getDataType(columnConfig.getType(), columnConfig.isAutoIncrement());
    }

    /**
     * Returns the actual database-specific data type to use a "date" (no time information) column.
     */
    @Override
    public DateType getDateType() {
        return new DateType();
    }

    /**
     * Returns the actual database-specific data type to use a "time" column.
     */
    @Override
    public TimeType getTimeType() {
        return new TimeType();
    }

    @Override
    public DateTimeType getDateTimeType() {
        return new DateTimeType();
    }

    @Override
    public BigIntType getBigIntType() {
        return new BigIntType();
    }

    /**
     * Returns the actual database-specific data type to use for a "char" column.
     */
    @Override
    public CharType getCharType() {
        return new CharType();
    }

    /**
     * Returns the actual database-specific data type to use for a "varchar" column.
     */
    @Override
    public VarcharType getVarcharType() {
        return new VarcharType();
    }

    /**
     * Returns the actual database-specific data type to use for a "varchar" column.
     */
    public NVarcharType getNVarcharType() {
        return new NVarcharType();
    }

    /**
     * Returns the actual database-specific data type to use for a "float" column.
     *
     * @return database-specific type for float
     */
    @Override
    public FloatType getFloatType() {
        return new FloatType();
    }

    /**
     * Returns the actual database-specific data type to use for a "double" column.
     *
     * @return database-specific type for double
     */
    @Override
    public DoubleType getDoubleType() {
        return new DoubleType();
    }

    /**
     * Returns the actual database-specific data type to use for a "int" column.
     *
     * @return database-specific type for int
     */
    @Override
    public IntType getIntType() {
        return new IntType();
    }

    /**
     * Returns the actual database-specific data type to use for a "tinyint" column.
     *
     * @return database-specific type for tinyint
     */
    @Override
    public TinyIntType getTinyIntType() {
        return new TinyIntType();
    }

    public SmallIntType getSmallIntType() {
        return new SmallIntType();
    }

    @Override
    public BooleanType getBooleanType() {
        return new BooleanType();
    }

    public NumberType getNumberType() {
        return new NumberType();
    }

    @Override
    public CurrencyType getCurrencyType() {
        return new CurrencyType();
    }

    @Override
    public UUIDType getUUIDType() {
        return new UUIDType();
    }

    @Override
    public TextType getTextType() {
        return getClobType();
    }

    @Override
    public ClobType getClobType() {
        return new ClobType();
    }

    @Override
    public BlobType getBlobType() {
        return new BlobType();
    }

    @Override
    public BlobType getLongBlobType() {
        return getBlobType();
    }

    @Override
    public String convertToDatabaseTypeString(Column referenceColumn, Database database) {

        String translatedTypeName = referenceColumn.getTypeName();
        if (database instanceof PostgresDatabase) {
            if ("bpchar".equals(translatedTypeName)) {
                translatedTypeName = "char";
            }
        }

        if (database instanceof HsqlDatabase || database instanceof H2Database || database instanceof DerbyDatabase
                || database instanceof DB2Database) {
            if (referenceColumn.getDataType() == Types.FLOAT || referenceColumn.getDataType() == Types.DOUBLE) {
                return "float";
            }
        }

        if (database instanceof InformixDatabase) {
            /*
             * rs.getInt("DATA_TYPE") returns 1 (Types.CHAR) for interval types (bug in JDBC driver?) So if you comment
             * this out, the the columnsize will be appended and the type becomes: "INTERVAL HOUR TO FRACTION(3)(2413)"
             */
            if (translatedTypeName.toUpperCase().startsWith("INTERVAL")) {
                return translatedTypeName;
            }
            if (referenceColumn.getDataType() == Types.REAL) {
                return "SMALLFLOAT";
            }
        }

        String dataType;
        if (noParens.contains(referenceColumn.getDataType())) {
            dataType = translatedTypeName;
        } else if (oneParam.contains(referenceColumn.getDataType())) {
            if (database instanceof PostgresDatabase && translatedTypeName.equalsIgnoreCase("TEXT")) {
                return translatedTypeName;
            } else if (database instanceof MSSQLDatabase && translatedTypeName.equals("uniqueidentifier")) {
                return translatedTypeName;
            } else if (database instanceof MySQLDatabase
                    && (translatedTypeName.startsWith("enum(") || translatedTypeName.startsWith("set("))) {
                return translatedTypeName;
            } else if (database instanceof OracleDatabase && (translatedTypeName.equals("VARCHAR2"))) {
                return translatedTypeName + "(" + referenceColumn.getColumnSize() + " "
                        + referenceColumn.getLengthSemantics() + ")";
            } else if (database instanceof MySQLDatabase && translatedTypeName.equalsIgnoreCase("DOUBLE")) {
                return translatedTypeName;
            } else if (database instanceof MySQLDatabase && translatedTypeName.equalsIgnoreCase("DOUBLE PRECISION")) {
                return translatedTypeName;
            }
            dataType = translatedTypeName + "(" + referenceColumn.getColumnSize() + ")";
        } else if (twoParams.contains(referenceColumn.getDataType())) {
            if (database instanceof PostgresDatabase && referenceColumn.getColumnSize() == 131089) {
                dataType = "DECIMAL";
            } else if (database instanceof MSSQLDatabase && translatedTypeName.toLowerCase().contains("money")) {
                dataType = translatedTypeName.toUpperCase();
            } else {
                dataType = translatedTypeName;
                if (referenceColumn.isInitPrecision()) {
                    dataType += "(" + referenceColumn.getColumnSize() + "," + referenceColumn.getDecimalDigits() + ")";
                }
            }
        } else {
            LogFactory.getLogger().warning(
                    "Unknown Data Type: " + referenceColumn.getDataType() + " (" + referenceColumn.getTypeName()
                            + ").  Assuming it does not take parameters");
            dataType = referenceColumn.getTypeName();
        }
        return dataType;

    }
}