package liquibase.database.typeconversion.core;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Types;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import liquibase.logging.Logger;
import liquibase.statement.DatabaseFunction;
import liquibase.util.SqlType;
import liquibase.util.StringUtils;

public abstract class AbstractTypeConverter implements TypeConverter {
	public static final String NULL = "NULL";
	public static final String JAVA_SQL_TYPES = "java.sql.Types";
	private final Logger logger = LogFactory.getLogger();

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

	protected Boolean getBooleanFromBit(String value) throws ParseException {
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
	}

	protected boolean isNullOrNullText(String value, int dataType) {
		if (value == null) {
			return true;
		}
		if (!isText(dataType)) {
			return false;
		}
		if (value.equalsIgnoreCase(NULL)) {
			return true;
		}
		if (StringUtils.trimToNull(value) == null) {
			return true;
		}
		return false;
	}

	/**
	 * Return true if the case insensitive trim of the value exactly matches the case insensitive trim of the database
	 * function.
	 */
	protected boolean isMatch(String value, DatabaseFunction function) {
		String comparisonValue1 = value.toLowerCase().trim();
		String comparisonValue2 = function.getValue().toLowerCase().trim();
		return comparisonValue1.equals(comparisonValue2);
	}

	/**
	 * Return true if the value matches a known database function, false otherwise
	 */
	protected boolean isDatabaseFunction(Database database, String value) {
		List<DatabaseFunction> functions = database.getDatabaseFunctions();
		if (value == null || functions == null) {
			return false;
		}
		for (DatabaseFunction function : functions) {
			if (isMatch(value, function)) {
				return true;
			}
		}
		return false;
	}

	protected DatabaseFunction getDatabaseFunction(Database database, String value) throws ParseException {
		List<DatabaseFunction> nativeFunctions = database.getDatabaseFunctions();
		for (DatabaseFunction nativeFunction : nativeFunctions) {
			if (isMatch(value, nativeFunction)) {
				DatabaseFunction liquibaseFunction = getLiquibaseEquivalent(database, nativeFunction);
				if (liquibaseFunction != null) {
					return liquibaseFunction;
				} else {
					String function = nativeFunction.getValue();
					String db = database.getTypeName();
					logger.warning("No Liquibase equivalent for '" + function + "' on " + db);
					return nativeFunction;
				}
			}
		}
		throw new ParseException("Unable to handle function " + value, 0);
	}

	protected DatabaseFunction getLiquibaseEquivalent(Database database, DatabaseFunction function) {
		String name = function.getValue();
		Map<String, DatabaseFunction> functionMappings = database.getLiquibaseFunctionMappings();
		return functionMappings.get(name);
	}

	protected Object convertToCorrectObjectType(String value, int dataType, int columnSize, int decimalDigits,
			Database database) throws ParseException {

		// If the value is null or the string "NULL" return null
		if (isNullOrNullText(value, dataType)) {
			return null;
		}

		// If the value is a known database function return a DatabaseFunction object
		// NOTE: This only works if the value is a single db function with no other text
		// ie "SYS_GUID()" will convert correctly, but "SYS_GUID() || CURRENT_TIMESTAMP", will not
		if (isDatabaseFunction(database, value)) {
			return getDatabaseFunction(database, value);
		}

		// Just return the String "as is" if it is text
		if (isText(dataType)) {
			return value;
		}

		try {
			// Convert non-text values into their equivalent Java object
			return getConvertedValue(database, value, dataType, decimalDigits);
		} catch (DateParseException e) {
			return new DatabaseFunction(value);
		} catch (NumberFormatException e) {
			return new DatabaseFunction(value);
		}
	}

	protected boolean isDate(int type) {
		switch (type) {
		case Types.TIME:
		case Types.DATE:
		case Types.TIMESTAMP:
			return true;
		default:
			return false;
		}
	}

	protected Date getDate(Database database, String value, int type) throws ParseException {
		Date date = database.parseDate(value);
		long millis = date.getTime();
		switch (type) {
		case Types.TIME:
			return new java.sql.Time(millis);
		case Types.DATE:
			return new java.sql.Date(millis);
		case Types.TIMESTAMP:
			return new java.sql.Timestamp(millis);
		default:
			throw new ParseException("Data type " + type + " is not a date", 0);
		}
	}

	protected Object getConvertedValue(Database database, String value, int dataType, int decimalDigits)
			throws ParseException {
		if (isDate(dataType)) {
			return getDate(database, value, dataType);
		} else if (dataType == Types.BIT) {
			return getBooleanFromBit(value);
		} else if (dataType == Types.BOOLEAN) {
			return Boolean.valueOf(value);
		} else if (dataType == Types.BIGINT) {
			return new BigInteger(value);
		} else if (isBigDecimal(dataType, decimalDigits)) {
			return new BigDecimal(value);
		} else if (isInteger(dataType, decimalDigits)) {
			return new Integer(value);
		} else if (dataType == Types.FLOAT || dataType == Types.REAL) {
			return new Float(value);
		} else if (dataType == Types.NULL) {
			return null;
		} else if (dataType == Types.BLOB) {
			return "!!!!!! LIQUIBASE CANNOT OUTPUT BLOB VALUES !!!!!!";
		} else {
			logger.warning("Do not know how to convert type " + dataType);
			return value;
		}
	}

	protected boolean isDecimalWithNoDecimalDigits(int type, int decimalDigits) {
		return type == Types.DECIMAL && decimalDigits == 0;
	}

	protected boolean isBigDecimal(int type, int decimalDigits) {
		switch (type) {
		case Types.DOUBLE:
		case Types.NUMERIC:
			return true;
		case Types.DECIMAL:
			// Returning false here if the type is DECIMAL but there are no decimal digits is a carry over from the
			// original Liquibase logic. This seems like it is a *bad idea*
			return !isDecimalWithNoDecimalDigits(type, decimalDigits);
		default:
			return false;
		}
	}

	protected boolean isInteger(int type, int decimalDigits) {
		switch (type) {
		case Types.INTEGER:
		case Types.SMALLINT:
		case Types.TINYINT:
			return true;
		default:
			// Returning true here if the type is DECIMAL but there are no decimal digits is a carry over from the
			// original Liquibase logic. This seems like it is a *bad idea*
			return isDecimalWithNoDecimalDigits(type, decimalDigits);
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
		String s = columnTypeString.replaceFirst(".*\\)", "");
		return StringUtils.trimToNull(s);
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

	protected SqlType getSqlType(int dataType) {
		SqlType[] types = SqlType.values();
		for (SqlType type : types) {
			if (type.getValue() == dataType) {
				return type;
			}
		}
		return null;
	}

	protected String getJDBCQualifier(Database database, Column column) {
		int type = column.getDataType();
		String typeName = column.getTypeName();

		if (!isKnownType(type)) {
			logger.warning("Unknown Data Type: " + type + " (" + typeName + ").  Assuming it does not take parameters");
			return "";
		}

		if (noParens.contains(type)) {
			return "";
		}

		if (oneParam.contains(type)) {
			return "(" + column.getColumnSize() + ")";
		}

		if (twoParams.contains(type) && column.isInitPrecision()) {
			return "(" + column.getColumnSize() + "," + column.getDecimalDigits() + ")";
		} else {
			return "";
		}

	}

	protected boolean isKnownType(int type) {
		return noParens.contains(type) || oneParam.contains(type) || twoParams.contains(type);
	}

	protected String getJDBCBase(Database database, Column column) {
		SqlType type = getSqlType(column.getDataType());
		return JAVA_SQL_TYPES + "." + type;
	}

	@Override
	public String convertToJDBCTypeString(Column referenceColumn, Database database) {
		String base = getJDBCBase(database, referenceColumn);
		String qualifier = getJDBCQualifier(database, referenceColumn);
		return base + qualifier;
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