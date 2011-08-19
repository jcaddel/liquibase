package liquibase.change.core;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import liquibase.change.AbstractChange;
import liquibase.change.ChangeMetaData;
import liquibase.change.ChangeProperty;
import liquibase.change.ChangeWithColumns;
import liquibase.change.CheckSum;
import liquibase.change.ColumnConfig;
import liquibase.database.Database;
import liquibase.exception.UnexpectedLiquibaseException;
import liquibase.resource.ResourceAccessor;
import liquibase.statement.SqlStatement;
import liquibase.statement.core.InsertStatement;
import liquibase.util.NullValue;
import liquibase.util.SqlType;
import liquibase.util.StreamUtil;
import liquibase.util.StringUtils;
import liquibase.util.csv.CSVReader;

public class LoadDataChange extends AbstractChange implements ChangeWithColumns {

    private String schemaName;
    private String tableName;
    private String file;
    private String encoding = null;
    private String separator = liquibase.util.csv.opencsv.CSVReader.DEFAULT_SEPARATOR + "";
    private String quotchar = liquibase.util.csv.opencsv.CSVReader.DEFAULT_QUOTE_CHARACTER + "";
    @ChangeProperty(includeInSerialization = false)
    private NullValue nullValue = new NullValue();

    private List<LoadDataColumnConfig> columns = new ArrayList<LoadDataColumnConfig>();

    public LoadDataChange() {
        super("loadData", "Load Data", ChangeMetaData.PRIORITY_DEFAULT);
    }

    protected LoadDataChange(String changeName, String changeDescription) {
        super(changeName, changeDescription, ChangeMetaData.PRIORITY_DEFAULT);
    }

    public String getSchemaName() {
        return schemaName;
    }

    public void setSchemaName(String schemaName) {
        this.schemaName = StringUtils.trimToNull(schemaName);
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getEncoding() {
        return encoding;
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }

    public String getSeparator() {
        return separator;
    }

    public void setSeparator(String separator) {
        this.separator = separator;
    }

    public String getQuotchar() {
        return quotchar;
    }

    public void setQuotchar(String quotchar) {
        this.quotchar = quotchar;
    }

    @Override
    public void addColumn(ColumnConfig column) {
        columns.add((LoadDataColumnConfig) column);
    }

    @Override
    public List<ColumnConfig> getColumns() {
        return (List<ColumnConfig>) (List) columns;
    }

    protected Object convertValue(Object value, ColumnConfig columnConfig) {
        if (nullValue.isNull(value.toString())) {
            return nullValue.getValue();
        }
        if (columnConfig.getType() == null) {
            return value;
        }
        ColumnConfig valueConfig = new ColumnConfig();

        String type = columnConfig.getType();
        if (SqlType.isBoolean(type)) {
            valueConfig.setValueBoolean(Boolean.parseBoolean(value.toString().toLowerCase()));
        } else if (SqlType.isNumeric(type)) {
            valueConfig.setValueNumeric(value.toString());
        } else if (SqlType.isDate(type)) {
            valueConfig.setValueDate(value.toString());
        } else if (SqlType.isString(type)) {
            valueConfig.setValue(value.toString());
        } else if (columnConfig.getType().equalsIgnoreCase("COMPUTED")) {
            valueConfig.setValue(value.toString());
        } else {
            throw new UnexpectedLiquibaseException("loadData type of " + columnConfig.getType()
                    + " is not supported.  Please use BOOLEAN, NUMERIC, DATE, STRING, or COMPUTED");
        }
        return valueConfig.getValueObject();
    }

    protected String getColumnName(ColumnConfig columnConfig, String header) {
        String columnName = null;
        if (columnConfig != null) {
            columnName = columnConfig.getName();
        }
        if (columnName == null) {
            columnName = header;
        }
        return columnName;
    }

    protected SqlStatement getSqlStatement(String[] headers, String[] line, int lineNumber) {

        // Make sure we have a token for each column
        if (headers.length != line.length) {
            throw new UnexpectedLiquibaseException("CSV Line " + lineNumber + " has  " + line.length
                    + " columns, the header has " + headers.length);
        }

        // Create an insert statement from the data
        InsertStatement insertStatement = createStatement(getSchemaName(), getTableName());
        for (int i = 0; i < headers.length; i++) {
            Object value = line[i];
            ColumnConfig columnConfig = getColumnConfig(i, headers[i]);

            String columnName = getColumnName(columnConfig, headers[i]);
            Object newValue = convertValue(value, columnConfig);
            insertStatement.addColumnValue(columnName, newValue);
        }
        return insertStatement;
    }

    @Override
    public SqlStatement[] generateStatements(Database database) {
        CSVReader reader = null;
        try {
            // Get a handle to the csv file
            reader = getCSVReader();

            // Pull out the headers
            String[] headers = reader.readNext();
            if (headers == null) {
                throw new UnexpectedLiquibaseException("Data file " + getFile() + " was empty");
            }

            // Setup some storage and loop control variables
            List<SqlStatement> statements = new ArrayList<SqlStatement>();
            String[] line = null;
            int lineNumber = 0;

            // Iterate through the csv file
            while ((line = reader.readNext()) != null) {
                // bump our line number
                lineNumber++;

                // if it is a blank line, skip it
                if (isSkipLine(line)) {
                    continue;
                }

                // Generate an SQL insert statement from the data
                SqlStatement sqlStatement = getSqlStatement(headers, line, lineNumber);

                // Add this statement to our List
                statements.add(sqlStatement);
            }

            // Convert the List to an Array and return
            return statements.toArray(new SqlStatement[statements.size()]);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            StreamUtil.closeQuietly(reader);
        }
    }

    /**
     * Return true if it is an empty line
     */
    protected boolean isSkipLine(String[] line) {
        if (line.length == 0) {
            return true;
        }
        if (line.length == 1 && StringUtils.trimToNull(line[0]) == null) {
            return true;
        }
        return false;
    }

    protected CSVReader getCSVReader() throws IOException {
        ResourceAccessor opener = getResourceAccessor();
        if (opener == null) {
            throw new UnexpectedLiquibaseException("No file opener specified for " + getFile());
        }
        InputStream stream = opener.getResourceAsStream(getFile());
        if (stream == null) {
            throw new UnexpectedLiquibaseException("Data file " + getFile() + " was not found");
        }

        InputStreamReader streamReader;
        if (getEncoding() == null) {
            streamReader = new InputStreamReader(stream);
        } else {
            streamReader = new InputStreamReader(stream, getEncoding());
        }

        char quotchar;
        if (0 == this.quotchar.length()) {
            // hope this is impossible to have a field surrounded with non ascii char 0x01
            quotchar = '\1';
        } else {
            quotchar = this.quotchar.charAt(0);
        }

        CSVReader reader = new CSVReader(streamReader, separator.charAt(0), quotchar);

        return reader;
    }

    protected InsertStatement createStatement(String schemaName, String tableName) {
        return new InsertStatement(schemaName, tableName);
    }

    protected ColumnConfig getColumnConfig(int index, String header) {
        for (LoadDataColumnConfig config : columns) {
            if (config.getIndex() != null && config.getIndex().equals(index)) {
                return config;
            }
            if (config.getHeader() != null && config.getHeader().equalsIgnoreCase(header)) {
                return config;
            }

            if (config.getName() != null && config.getName().equalsIgnoreCase(header)) {
                return config;
            }
        }
        return null;
    }

    @Override
    public String getConfirmationMessage() {
        return "Data loaded from " + getFile() + " into " + getTableName();
    }

    @Override
    public CheckSum generateCheckSum() {
        InputStream stream = null;
        try {
            stream = getResourceAccessor().getResourceAsStream(getFile());
            if (stream == null) {
                throw new RuntimeException(getFile() + " could not be found");
            }
            return CheckSum.compute(stream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            if (stream != null) {
                try {
                    stream.close();
                } catch (IOException e) {
                    ;
                }
            }
        }
    }

    public NullValue getNullValue() {
        return nullValue;
    }

    public void setNullValue(NullValue nullValue) {
        this.nullValue = nullValue;
    }
}
