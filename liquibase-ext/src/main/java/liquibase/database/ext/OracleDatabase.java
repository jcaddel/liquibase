package liquibase.database.ext;

import java.util.HashMap;
import java.util.Map;

import liquibase.Constants;
import liquibase.database.DelimiterStyle;
import liquibase.database.structure.ForeignKeyConstraintType;
import liquibase.statement.DatabaseFunction;

public class OracleDatabase extends liquibase.database.core.OracleDatabase {
	public static final String DEFAULT_DELIMITER = "/";
	public static final DelimiterStyle DEFAULT_DELIMITER_STYLE = DelimiterStyle.ROW;
	CommonDefaultRuleHandler foreignKeyHandler = new CommonDefaultRuleHandler();

	public OracleDatabase() {
		super();
		setDelimiter(DEFAULT_DELIMITER);
		setDelimiterStyle(DEFAULT_DELIMITER_STYLE);
		databaseFunctions.add(new DatabaseFunction("SYS_GUID()"));
		liquibaseFunctionMappings.putAll(getFunctionMappings());
	}

	protected Map<String, DatabaseFunction> getFunctionMappings() {
		Map<String, DatabaseFunction> map = new HashMap<String, DatabaseFunction>();
		map.put("SYSDATE", new DatabaseFunction(LiquibaseFunction.CURRENT_DATE.getValue()));
		map.put("SYSTIMESTAMP", new DatabaseFunction(LiquibaseFunction.CURRENT_TIMESTAMP.getValue()));
		map.put("CURRENT_TIMESTAMP", new DatabaseFunction(LiquibaseFunction.CURRENT_TIMESTAMP.getValue()));
		map.put("SYS_GUID()", new DatabaseFunction(LiquibaseFunction.GUID.getValue()));
		return map;
	}

	@Override
	public int getPriority() {
		return Constants.DEFAULT_EXT_PRIORITY;
	}

	@Override
	public boolean isDefaultUpdateRule(ForeignKeyConstraintType rule) {
		return foreignKeyHandler.isDefaultUpdateRule(rule);
	}

	@Override
	public boolean isDefaultDeleteRule(ForeignKeyConstraintType rule) {
		return foreignKeyHandler.isDefaultDeleteRule(rule);
	}

	@Override
	public ForeignKeyConstraintType getDefaultUpdateRule() {
		return foreignKeyHandler.getDefaultUpdateRule();
	}

	@Override
	public ForeignKeyConstraintType getDefaultDeleteRule() {
		return foreignKeyHandler.getDefaultDeleteRule();
	}

}
