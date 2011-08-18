package liquibase.changelog.conversion;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter implements Converter<Date> {
    public static final String DEFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss.S z";
    String format = DEFAULT_DATE_FORMAT;
    private SimpleDateFormat formatter = new SimpleDateFormat(format);

    @Override
    public String getString(Date date) {
        if (date == null) {
            return null;
        }
        return formatter.format(date);
    }

    @Override
    public Date getObject(String s) throws ConversionException {
        if (s == null) {
            return null;
        }
        try {
            return formatter.parse(s);
        } catch (ParseException e) {
            throw new ConversionException(e);
        }
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

}
