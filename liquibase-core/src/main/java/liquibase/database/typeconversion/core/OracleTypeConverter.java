package liquibase.database.typeconversion.core;

import java.sql.Types;
import java.text.ParseException;

import liquibase.database.Database;
import liquibase.database.core.OracleDatabase;
import liquibase.database.structure.Column;
import liquibase.database.structure.type.BigIntType;
import liquibase.database.structure.type.BooleanType;
import liquibase.database.structure.type.CurrencyType;
import liquibase.database.structure.type.CustomType;
import liquibase.database.structure.type.DataType;
import liquibase.database.structure.type.DateTimeType;
import liquibase.database.structure.type.DoubleType;
import liquibase.database.structure.type.IntType;
import liquibase.database.structure.type.NVarcharType;
import liquibase.database.structure.type.TimeType;
import liquibase.database.structure.type.TinyIntType;
import liquibase.database.structure.type.UUIDType;
import liquibase.database.structure.type.VarcharType;

public class OracleTypeConverter extends AbstractTypeConverter {

	@Override
	public int getPriority() {
		return PRIORITY_DATABASE;
	}

	@Override
	public boolean supports(Database database) {
		return database instanceof OracleDatabase;
	}

	/**
	 * Extension of super.getDataType(String columnTypeString, Boolean autoIncrement, String dataTypeName, String
	 * precision)<br>
	 * Contains definition of Oracle's data-types
	 * */
	@Override
	protected DataType getDataType(String columnTypeString, Boolean autoIncrement, DataTypeContext context) {
		// Try to define data type by searching of common standard types
		DataType returnTypeName = super.getDataType(columnTypeString, autoIncrement, context);
		String precision = context.getPrecision();
		// If we found CustomType (it means - nothing compatible) then search for oracle types
		if (returnTypeName instanceof CustomType) {
			if (columnTypeString.toUpperCase().startsWith("VARCHAR2")) {
				// Varchar2 type pattern: VARCHAR2(50 BYTE) | VARCHAR2(50 CHAR)
				returnTypeName = getVarcharType();
				if (precision != null) {
					String[] typeParams = precision.split(" ");
					returnTypeName.setFirstParameter(typeParams[0].trim());
					if (typeParams.length > 1) {
						returnTypeName.setUnit(typeParams[1]);
					}
				}
			} else if (columnTypeString.toUpperCase().startsWith("NVARCHAR2")) {
				// NVarchar2 type pattern: VARCHAR2(50 BYTE) | VARCHAR2(50 CHAR)
				returnTypeName = getNVarcharType();
				if (precision != null) {
					String[] typeParams = precision.split(" ");
					returnTypeName.setFirstParameter(typeParams[0].trim());
					if (typeParams.length > 1) {
						returnTypeName.setUnit(typeParams[1]);
					}
				}
			}
		}
		return returnTypeName;
	}

	@Override
	public String convertToDatabaseTypeString(Column referenceColumn, Database database) {
		String translatedTypeName = referenceColumn.getTypeName();
		if ("NVARCHAR2".equals(translatedTypeName)) {
			translatedTypeName = translatedTypeName + "(" + referenceColumn.getColumnSize() + ")";
		} else if ("BINARY_FLOAT".equals(translatedTypeName) || "BINARY_DOUBLE".equals(translatedTypeName)) {
			// nothing to do
		} else {
			translatedTypeName = super.convertToDatabaseTypeString(referenceColumn, database);
		}
		return translatedTypeName;
	}

	protected boolean isNonNullString(Object defaultValue) {
		return defaultValue != null && defaultValue instanceof String;
	}

	protected boolean isDateOrTime(int type) {
		return type == Types.DATE || type == Types.TIME || type == Types.TIMESTAMP;
	}

	protected boolean isNumeric(int type) {
		switch (type) {
		case Types.BIGINT:
		case Types.NUMERIC:
		case Types.BIT:
		case Types.SMALLINT:
		case Types.DECIMAL:
		case Types.INTEGER:
		case Types.TINYINT:
		case Types.FLOAT:
		case Types.REAL:
			return true;
		default:
			return false;
		}
	}

	protected String getDateOrTimeConversion(String defaultValue) {
		if (defaultValue.indexOf("YYYY-MM-DD HH") > 0) {
			return defaultValue.replaceFirst("^to_date\\('", "").replaceFirst("', 'YYYY-MM-DD HH24:MI:SS'\\)$", "");
		} else if ((defaultValue).indexOf("YYYY-MM-DD") > 0) {
			return defaultValue.replaceFirst("^to_date\\('", "").replaceFirst("', 'YYYY-MM-DD'\\)$", "");
		} else {
			return defaultValue.replaceFirst("^to_date\\('", "").replaceFirst("', 'HH24:MI:SS'\\)$", "");
		}
	}

	protected String getNumericConversion(String defaultValue) {
		/*
		 * if dataType is numeric-type then cut "(" , ")" symbols Cause: Column's default value option may be set by
		 * both ways: DEFAULT 0 DEFAULT (0)
		 */
		return defaultValue.replaceFirst("\\(", "").replaceFirst("\\)", "");
	}

	protected String getOracleString(String defaultValue, int dataType) {
		if (isDateOrTime(dataType)) {
			defaultValue = getDateOrTimeConversion(defaultValue);
		} else if (isNumeric(dataType)) {
			defaultValue = getNumericConversion(defaultValue);
		}
		// sometimes oracle adds an extra
		// space after the trailing ' (see
		// http://sourceforge.net/tracker/index.php?func=detail&aid=1824663&group_id=187970&atid=923443).
		return defaultValue.replaceFirst("'\\s*$", "'");
	}

	@Override
	public Object convertDatabaseValueToObject(Object defaultValue, int dataType, int columnSize, int decimalDigits,
			Database database) throws ParseException {
		if (isNonNullString(defaultValue)) {
			defaultValue = getOracleString((String) defaultValue, dataType);
		}
		return super.convertDatabaseValueToObject(defaultValue, dataType, columnSize, decimalDigits, database);
	}

	@Override
	protected Object convertToCorrectObjectType(String value, int dataType, int columnSize, int decimalDigits,
			Database database) throws ParseException {
		Object returnValue = super.convertToCorrectObjectType(value, dataType, columnSize, decimalDigits, database);
		// I'll do it lately.
		// It needs to design and create Database Function Dictionary first.
		/*
		 * if (dataType == Types.BLOB || dataType == Types.TIMESTAMP) { if (database.containsDatabaseFunction(value)) {
		 * returnValue = value; } }
		 */
		return returnValue;
	}

	@Override
	public BooleanType getBooleanType() {
		return new BooleanType.NumericBooleanType("NUMBER(1)");
	}

	@Override
	public CurrencyType getCurrencyType() {
		return new CurrencyType("NUMBER(15, 2)");
	}

	@Override
	public UUIDType getUUIDType() {
		return new UUIDType("RAW(16)");
	}

	@Override
	public TimeType getTimeType() {
		return new TimeType("DATE");
	}

	@Override
	public DateTimeType getDateTimeType() {
		return new DateTimeType("TIMESTAMP");
	}

	@Override
	public BigIntType getBigIntType() {
		return new BigIntType("NUMBER(38,0)");
	}

	@Override
	public IntType getIntType() {
		return new IntType("INTEGER");
	}

	@Override
	public VarcharType getVarcharType() {
		return new VarcharType("VARCHAR2");
	}

	@Override
	public NVarcharType getNVarcharType() {
		return new NVarcharType("NVARCHAR2");
	}

	@Override
	public DoubleType getDoubleType() {
		return new DoubleType("FLOAT(24)");
	}

	@Override
	public TinyIntType getTinyIntType() {
		return new TinyIntType("NUMBER(3)");
	}
}
