package liquibase.database.typeconversion.core;

import java.util.Locale;

import liquibase.database.Database;
import liquibase.database.core.SQLiteDatabase;
import liquibase.database.structure.type.BlobType;
import liquibase.database.structure.type.BooleanType;
import liquibase.database.structure.type.ClobType;
import liquibase.database.structure.type.CurrencyType;
import liquibase.database.structure.type.CustomType;
import liquibase.database.structure.type.DataType;
import liquibase.database.structure.type.DateTimeType;
import liquibase.database.structure.type.FloatType;
import liquibase.database.structure.type.IntType;

public class SQLiteTypeConverter extends AbstractTypeConverter {

    @Override
    public int getPriority() {
        return PRIORITY_DATABASE;
    }

    @Override
    public boolean supports(Database database) {
        return database instanceof SQLiteDatabase;
    }

    @Override
    public DataType getDataType(String columnTypeString, Boolean autoIncrement) {
        DataType type;
        if (columnTypeString.equals("INTEGER") || columnTypeString.toLowerCase(Locale.ENGLISH).contains("int")
                || columnTypeString.toLowerCase(Locale.ENGLISH).contains("bit")) {
            type = new IntType("INTEGER");
        } else if (columnTypeString.equals("TEXT") || columnTypeString.toLowerCase(Locale.ENGLISH).contains("uuid")
                || columnTypeString.toLowerCase(Locale.ENGLISH).contains("uniqueidentifier")
                || columnTypeString.toLowerCase(Locale.ENGLISH).equals("uniqueidentifier")
                || columnTypeString.toLowerCase(Locale.ENGLISH).equals("datetime")
                || columnTypeString.toLowerCase(Locale.ENGLISH).contains("timestamp")
                || columnTypeString.toLowerCase(Locale.ENGLISH).contains("char")
                || columnTypeString.toLowerCase(Locale.ENGLISH).contains("clob")
                || columnTypeString.toLowerCase(Locale.ENGLISH).contains("text")) {
            type = new CustomType("TEXT", 0, 0);
        } else if (columnTypeString.equals("REAL") || columnTypeString.toLowerCase(Locale.ENGLISH).contains("float")) {
            type = new FloatType("REAL");
        } else if (columnTypeString.toLowerCase(Locale.ENGLISH).contains("blob")
                || columnTypeString.toLowerCase(Locale.ENGLISH).contains("binary")) {
            type = new BlobType("BLOB");
        } else if (columnTypeString.toLowerCase(Locale.ENGLISH).contains("boolean")
                || columnTypeString.toLowerCase(Locale.ENGLISH).contains("binary")) {
            type = new BooleanType("BOOLEAN");
        } else {
            type = super.getDataType(columnTypeString, autoIncrement);
        }
        return type;
    }

    @Override
    public BooleanType getBooleanType() {
        return new BooleanType() {
            @Override
            public String getFalseBooleanValue() {
                return "0";
            }

            @Override
            public String getTrueBooleanValue() {
                return "1";
            }
        };
    }

    @Override
    public ClobType getClobType() {
        return new ClobType("TEXT");
    }

    @Override
    public CurrencyType getCurrencyType() {
        return new CurrencyType("REAL");
    }

    @Override
    public DateTimeType getDateTimeType() {
        return new DateTimeType("TEXT");
    }
}
