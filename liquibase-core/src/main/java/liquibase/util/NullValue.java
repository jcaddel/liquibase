package liquibase.util;

public class NullValue {
    String value = "NULL";
    boolean caseInsensitive = true;

    public boolean isNull(String s) {
        return value.equalsIgnoreCase(s);
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public boolean isCaseInsensitive() {
        return caseInsensitive;
    }

    public void setCaseInsensitive(boolean caseInsensitive) {
        this.caseInsensitive = caseInsensitive;
    }

}
