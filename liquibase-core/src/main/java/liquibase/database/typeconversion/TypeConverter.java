package liquibase.database.typeconversion;

import java.text.ParseException;

import liquibase.change.ColumnConfig;
import liquibase.database.Database;
import liquibase.database.structure.Column;
import liquibase.database.structure.type.BigIntType;
import liquibase.database.structure.type.BlobType;
import liquibase.database.structure.type.BooleanType;
import liquibase.database.structure.type.CharType;
import liquibase.database.structure.type.ClobType;
import liquibase.database.structure.type.CurrencyType;
import liquibase.database.structure.type.DataType;
import liquibase.database.structure.type.DateTimeType;
import liquibase.database.structure.type.DateType;
import liquibase.database.structure.type.DoubleType;
import liquibase.database.structure.type.FloatType;
import liquibase.database.structure.type.IntType;
import liquibase.database.structure.type.TextType;
import liquibase.database.structure.type.TimeType;
import liquibase.database.structure.type.TinyIntType;
import liquibase.database.structure.type.UUIDType;
import liquibase.database.structure.type.VarcharType;
import liquibase.servicelocator.PrioritizedService;

public interface TypeConverter extends PrioritizedService {

    @Override
    int getPriority();

    boolean supports(Database database);

    Object convertDatabaseValueToObject(Object defaultValue, int dataType, int firstParameter, int secondParameter,
            Database database) throws ParseException;

    String convertToDatabaseTypeString(Column referenceColumn, Database database);

    DataType getDataType(Object object);

    DataType getDataType(String columnTypeString, Boolean autoIncrement);

    DataType getDataType(ColumnConfig columnConfig);

    CharType getCharType();

    VarcharType getVarcharType();

    BooleanType getBooleanType();

    CurrencyType getCurrencyType();

    UUIDType getUUIDType();

    TextType getTextType();

    ClobType getClobType();

    BlobType getBlobType();

    BlobType getLongBlobType();

    DateType getDateType();

    FloatType getFloatType();

    DoubleType getDoubleType();

    IntType getIntType();

    TinyIntType getTinyIntType();

    DateTimeType getDateTimeType();

    TimeType getTimeType();

    BigIntType getBigIntType();

}
