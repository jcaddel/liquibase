package liquibase.database.structure;

import liquibase.database.Database;
import liquibase.database.PostgresDatabase;

import java.util.List;
import java.util.Arrays;
import java.sql.Types;

public class Column implements Comparable<Column> {
    private Table table;
    private View view;
    private String name;
    private int dataType;
    private int columnSize;
    private int decimalDigits;
    private Boolean nullable;
    private String typeName;
    private String defaultValue;
    private boolean autoIncrement = false;


    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }


    public View getView() {
        return view;
    }

    public void setView(View view) {
        this.view = view;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public int getDataType() {
        return dataType;
    }

    public void setDataType(int dataType) {
        this.dataType = dataType;
    }

    public int getColumnSize() {
        return columnSize;
    }

    public void setColumnSize(int columnSize) {
        this.columnSize = columnSize;
    }

    public int getDecimalDigits() {
        return decimalDigits;
    }

    public void setDecimalDigits(int decimalDigits) {
        this.decimalDigits = decimalDigits;
    }

    public Boolean isNullable() {
        return nullable;
    }

    public void setNullable(Boolean nullable) {
        this.nullable = nullable;
    }


    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }


    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public String toString() {
        String tableOrViewName;
        if (table == null) {
            tableOrViewName = view.getName();
        } else {
            tableOrViewName = table.getName();
        }
        return tableOrViewName +"."+getName();
    }


    public int compareTo(Column o) {
        try {
            //noinspection UnusedAssignment
            int returnValue = 0;
            if (this.getTable() != null && o.getTable() == null) {
                return 1;
            } else if (this.getTable() == null && o.getTable() != null) {
                return -1;
            } else if (this.getTable() == null && o.getTable() == null) {
                returnValue = this.getView().compareTo(o.getView());
            } else {
                returnValue = this.getTable().compareTo(o.getTable());
            }

            if (returnValue == 0) {
                returnValue = this.getName().compareTo(o.getName());
            }

            return returnValue;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    public boolean equals(Object o) {
        try {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            Column column = (Column) o;

            return name.equals(column.name) && !(table != null ? !table.equals(column.table) : column.table != null) && !(view != null ? !view.equals(column.view) : column.view != null);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public int hashCode() {
        try {
            int result;
            result = (table != null ? table.hashCode() : 0);
            result = 31 * result + (view != null ? view.hashCode() : 0);
            result = 31 * result + name.hashCode();
            return result;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Returns the type name and any parameters suitable for SQL.
     */
    public String getDataTypeString(Database database) {
        List<Integer> noParens = Arrays.asList(
                Types.ARRAY,
                Types.BIGINT,
                Types.BINARY,
                Types.BIT,
                Types.BLOB,
                Types.BOOLEAN,
                Types.CLOB,
                Types.DATALINK,
                Types.DATE,
                Types.DISTINCT,
                Types.INTEGER,
                Types.JAVA_OBJECT,
                Types.LONGVARBINARY,
                Types.NULL,
                Types.OTHER,
                Types.REF,
                Types.SMALLINT,
                Types.STRUCT,
                Types.TIME,
                Types.TIMESTAMP,
                Types.TINYINT,
                Types.VARBINARY);

        List<Integer> oneParam = Arrays.asList(
                Types.CHAR,
                Types.LONGVARCHAR,
                Types.VARCHAR
        );

        List<Integer> twoParams = Arrays.asList(
                Types.DECIMAL,
                Types.DOUBLE,
                Types.FLOAT,
                Types.NUMERIC,
                Types.REAL
        );

        String translatedTypeName = this.getTypeName();
        if (database instanceof PostgresDatabase) {
            if ("bpchar".equals(translatedTypeName)) {
                translatedTypeName = "char";
            }
        }

        String dataType;
        if (noParens.contains(this.getDataType())) {
            dataType = translatedTypeName;
        } else if (oneParam.contains(this.getDataType())) {
            dataType = translatedTypeName+"("+this.getColumnSize()+")";
        } else if (twoParams.contains(this.getDataType())) {
            dataType = translatedTypeName+"("+this.getColumnSize()+","+this.getDecimalDigits()+")";
        } else {
            throw new RuntimeException("Unknown Data Type: "+this.getDataType()+" ("+this.getTypeName()+")");
        }
        return dataType;
    }

    public boolean isNumeric() {
        List<Integer> numericTypes = Arrays.asList(
                Types.BIGINT,
                Types.BIT,
                Types.INTEGER,
                Types.SMALLINT,
                Types.TINYINT,
                Types.DECIMAL,
                Types.DOUBLE,
                Types.FLOAT,
                Types.NUMERIC,
                Types.REAL
        );

        return numericTypes.contains(getDataType());
    }


    public boolean isAutoIncrement() {
        return autoIncrement;
    }

    public void setAutoIncrement(boolean autoIncrement) {
        this.autoIncrement = autoIncrement;
    }
}