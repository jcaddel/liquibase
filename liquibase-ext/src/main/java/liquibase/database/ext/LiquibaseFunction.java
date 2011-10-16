package liquibase.database.ext;

public enum LiquibaseFunction {
	CURRENT_TIMESTAMP("liquibase.CURRENT_TIMESTAMP"), //
	CURRENT_DATE("liquibase.CURRENT_DATE"), //
	GUID("liquibase.GUID");

	private final String value;

	LiquibaseFunction(String value) {
		this.value = value;
	}

	public String getValue() {
		return this.value;
	}

}
