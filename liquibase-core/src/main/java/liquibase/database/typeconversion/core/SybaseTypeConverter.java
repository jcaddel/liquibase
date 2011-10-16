package liquibase.database.typeconversion.core;

import java.text.ParseException;

import liquibase.database.Database;
import liquibase.database.core.SybaseDatabase;
import liquibase.database.structure.type.BlobType;
import liquibase.database.structure.type.BooleanType;
import liquibase.database.structure.type.ClobType;
import liquibase.database.structure.type.CurrencyType;
import liquibase.database.structure.type.DataType;
import liquibase.database.structure.type.DateType;
import liquibase.database.structure.type.NumberType;
import liquibase.database.structure.type.UUIDType;

public class SybaseTypeConverter extends AbstractTypeConverter {

	@Override
	public int getPriority() {
		return PRIORITY_DATABASE;
	}

	@Override
	public boolean supports(Database database) {
		return database instanceof SybaseDatabase;
	}

	@Override
	public Object convertDatabaseValueToObject(Object defaultValue, int dataType, int columnSize, int decimalDigits,
			Database database) throws ParseException {
		if (defaultValue == null) {
			return null;
		}

		if (defaultValue instanceof String) {
			if (((String) defaultValue).startsWith("('")) {
				defaultValue = ((String) defaultValue).replaceFirst("^\\('", "").replaceFirst("'\\)$", "");
			} else if (((String) defaultValue).startsWith("((")) {
				defaultValue = ((String) defaultValue).replaceFirst("^\\(\\(", "").replaceFirst("\\)\\)$", "");
			}
		}

		defaultValue = super.convertDatabaseValueToObject(defaultValue, dataType, columnSize, decimalDigits, database);

		return defaultValue;
	}

	@Override
	public DataType getDataType(String columnTypeString, Boolean autoIncrement) {
		DataType type = super.getDataType(columnTypeString, autoIncrement);
		if (autoIncrement != null && autoIncrement) {
			type.setDataTypeName(type.getDataTypeName().replaceFirst(" identity$", ""));
		}
		return type;
	}

	@Override
	public DateType getDateType() {
		return new DateType("SMALLDATETIME");
	}

	@Override
	public BooleanType getBooleanType() {
		return new BooleanType.NumericBooleanType("BIT");
	}

	@Override
	public CurrencyType getCurrencyType() {
		return new CurrencyType("MONEY");
	}

	@Override
	public UUIDType getUUIDType() {
		return new UUIDType("UNIQUEIDENTIFIER");
	}

	@Override
	public ClobType getClobType() {
		return new ClobType("TEXT");
	}

	@Override
	public BlobType getBlobType() {
		return new BlobType("IMAGE");
	}

	@Override
	public NumberType getNumberType() {
		return new NumberType("NUMERIC");
	}
}
