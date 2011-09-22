package liquibase.database.typeconversion.core;

import liquibase.database.Database;
import liquibase.database.core.MySQLDatabase;
import liquibase.database.structure.type.BlobType;
import liquibase.database.structure.type.BooleanType;
import liquibase.database.structure.type.ClobType;
import liquibase.database.structure.type.DataType;
import liquibase.database.structure.type.DateTimeType;
import liquibase.database.structure.type.NumberType;

public class MySQLTypeConverter extends AbstractTypeConverter {

    @Override
    public int getPriority() {
        return PRIORITY_DATABASE;
    }

    @Override
    public boolean supports(Database database) {
        return database instanceof MySQLDatabase;
    }

    @Override
    public BooleanType getBooleanType() {
        return new BooleanType.NumericBooleanType("TINYINT(1)");
    }

    @Override
    public ClobType getClobType() {
        return new ClobType("LONGTEXT");
    }

    @Override
    public BlobType getLongBlobType() {
        return new BlobType("LONGBLOB");
    }

    @Override
    public NumberType getNumberType() {
        return new NumberType("NUMERIC");
    }

    @Override
    protected DataType getDataType(String columnTypeString, Boolean autoIncrement, DataTypeContext context) {
        if (columnTypeString.equalsIgnoreCase("timestamp")) {
            return new DateTimeType("TIMESTAMP");
        }
        return super.getDataType(columnTypeString, autoIncrement, context);
    }
}
