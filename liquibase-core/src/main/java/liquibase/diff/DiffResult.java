package liquibase.diff;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.xml.parsers.ParserConfigurationException;

import liquibase.change.Change;
import liquibase.change.ColumnConfig;
import liquibase.change.ConstraintsConfig;
import liquibase.change.core.AddColumnChange;
import liquibase.change.core.AddForeignKeyConstraintChange;
import liquibase.change.core.AddNotNullConstraintChange;
import liquibase.change.core.AddPrimaryKeyChange;
import liquibase.change.core.AddUniqueConstraintChange;
import liquibase.change.core.CreateIndexChange;
import liquibase.change.core.CreateSequenceChange;
import liquibase.change.core.CreateTableChange;
import liquibase.change.core.CreateViewChange;
import liquibase.change.core.DropColumnChange;
import liquibase.change.core.DropForeignKeyConstraintChange;
import liquibase.change.core.DropIndexChange;
import liquibase.change.core.DropNotNullConstraintChange;
import liquibase.change.core.DropPrimaryKeyChange;
import liquibase.change.core.DropSequenceChange;
import liquibase.change.core.DropTableChange;
import liquibase.change.core.DropUniqueConstraintChange;
import liquibase.change.core.DropViewChange;
import liquibase.change.core.InsertDataChange;
import liquibase.change.core.LoadDataChange;
import liquibase.change.core.LoadDataColumnConfig;
import liquibase.change.core.ModifyDataTypeChange;
import liquibase.change.core.compare.AddForeignKeyConstraintChangeComparator;
import liquibase.changelog.ChangeSet;
import liquibase.database.Database;
import liquibase.database.structure.Column;
import liquibase.database.structure.ForeignKey;
import liquibase.database.structure.ForeignKeyConstraintType;
import liquibase.database.structure.Index;
import liquibase.database.structure.PrimaryKey;
import liquibase.database.structure.Sequence;
import liquibase.database.structure.Table;
import liquibase.database.structure.UniqueConstraint;
import liquibase.database.structure.View;
import liquibase.database.structure.type.DataType;
import liquibase.database.typeconversion.TypeConverter;
import liquibase.database.typeconversion.TypeConverterFactory;
import liquibase.exception.DatabaseException;
import liquibase.executor.Executor;
import liquibase.executor.ExecutorService;
import liquibase.logging.LogFactory;
import liquibase.serializer.ChangeLogSerializer;
import liquibase.serializer.ChangeLogSerializerFactory;
import liquibase.serializer.core.xml.XMLChangeLogSerializer;
import liquibase.snapshot.DatabaseSnapshot;
import liquibase.statement.DatabaseFunction;
import liquibase.statement.SqlStatement;
import liquibase.statement.core.RawSqlStatement;
import liquibase.util.ISODateFormat;
import liquibase.util.SqlType;
import liquibase.util.StringUtils;
import liquibase.util.csv.CSVWriter;

public class DiffResult {
    public static final String ENCODING = "UTF-8";
    private static final String FS = System.getProperty("file.separator");
    public static final String EXCLUDE_SCHEMA_KEY = "liquibase.schema.exclude";
    private static final boolean EXCLUDE_SCHEMA = "true".equalsIgnoreCase(System.getProperty(EXCLUDE_SCHEMA_KEY));
    ISODateFormat isoDateFormat = new ISODateFormat();

    private String idRoot = Long.toHexString(System.currentTimeMillis());
    private int changeNumber = 1;

    private DatabaseSnapshot referenceSnapshot;
    private DatabaseSnapshot targetSnapshot;

    private DiffComparison productName;
    private DiffComparison productVersion;

    private SortedSet<Table> missingTables = new TreeSet<Table>();
    private SortedSet<Table> unexpectedTables = new TreeSet<Table>();

    private SortedSet<View> missingViews = new TreeSet<View>();
    private SortedSet<View> unexpectedViews = new TreeSet<View>();
    private SortedSet<View> changedViews = new TreeSet<View>();

    private SortedSet<Column> missingColumns = new TreeSet<Column>();
    private SortedSet<Column> unexpectedColumns = new TreeSet<Column>();
    private SortedSet<Column> changedColumns = new TreeSet<Column>();

    private SortedSet<ForeignKey> missingForeignKeys = new TreeSet<ForeignKey>();
    private SortedSet<ForeignKey> unexpectedForeignKeys = new TreeSet<ForeignKey>();

    private SortedSet<Index> missingIndexes = new TreeSet<Index>();
    private SortedSet<Index> unexpectedIndexes = new TreeSet<Index>();

    private SortedSet<PrimaryKey> missingPrimaryKeys = new TreeSet<PrimaryKey>();
    private SortedSet<PrimaryKey> unexpectedPrimaryKeys = new TreeSet<PrimaryKey>();

    private SortedSet<UniqueConstraint> missingUniqueConstraints = new TreeSet<UniqueConstraint>();
    private SortedSet<UniqueConstraint> unexpectedUniqueConstraints = new TreeSet<UniqueConstraint>();

    private SortedSet<Sequence> missingSequences = new TreeSet<Sequence>();
    private SortedSet<Sequence> unexpectedSequences = new TreeSet<Sequence>();

    private boolean diffData = false;
    private String dataDir = null;
    private String workingDir = null;
    private String changeSetContext;
    private String changeSetAuthor;
    private boolean flatten;

    private ChangeLogSerializerFactory serializerFactory = ChangeLogSerializerFactory.getInstance();

    public DiffResult(DatabaseSnapshot referenceDatabaseSnapshot, DatabaseSnapshot targetDatabaseSnapshot) {
        this.referenceSnapshot = referenceDatabaseSnapshot;

        if (targetDatabaseSnapshot == null) {
            targetDatabaseSnapshot = new DatabaseSnapshot(referenceDatabaseSnapshot.getDatabase(), null);
        }
        this.targetSnapshot = targetDatabaseSnapshot;
    }

    public DiffComparison getProductName() {
        return productName;
    }

    public void setProductName(DiffComparison productName) {
        this.productName = productName;
    }

    public DiffComparison getProductVersion() {
        return productVersion;
    }

    public void setProductVersion(DiffComparison product) {
        this.productVersion = product;
    }

    public void addMissingTable(Table table) {
        missingTables.add(table);
    }

    public SortedSet<Table> getMissingTables() {
        return missingTables;
    }

    public void addUnexpectedTable(Table table) {
        unexpectedTables.add(table);
    }

    public SortedSet<Table> getUnexpectedTables() {
        return unexpectedTables;
    }

    public void addMissingView(View viewName) {
        missingViews.add(viewName);
    }

    public SortedSet<View> getMissingViews() {
        return missingViews;
    }

    public void addUnexpectedView(View viewName) {
        unexpectedViews.add(viewName);
    }

    public SortedSet<View> getUnexpectedViews() {
        return unexpectedViews;
    }

    public void addChangedView(View viewName) {
        changedViews.add(viewName);
    }

    public SortedSet<View> getChangedViews() {
        return changedViews;
    }

    public void addMissingColumn(Column columnName) {
        missingColumns.add(columnName);
    }

    public SortedSet<Column> getMissingColumns() {
        return missingColumns;
    }

    public void addUnexpectedColumn(Column columnName) {
        unexpectedColumns.add(columnName);
    }

    public SortedSet<Column> getUnexpectedColumns() {
        return unexpectedColumns;
    }

    public void addChangedColumn(Column columnName) {
        changedColumns.add(columnName);
    }

    public SortedSet<Column> getChangedColumns() {
        return changedColumns;
    }

    public void addMissingForeignKey(ForeignKey fkName) {
        missingForeignKeys.add(fkName);
    }

    public SortedSet<ForeignKey> getMissingForeignKeys() {
        return missingForeignKeys;
    }

    public void addUnexpectedForeignKey(ForeignKey fkName) {
        unexpectedForeignKeys.add(fkName);
    }

    public SortedSet<ForeignKey> getUnexpectedForeignKeys() {
        return unexpectedForeignKeys;
    }

    public void addMissingIndex(Index fkName) {
        missingIndexes.add(fkName);
    }

    public SortedSet<Index> getMissingIndexes() {
        return missingIndexes;
    }

    public void addUnexpectedIndex(Index fkName) {
        unexpectedIndexes.add(fkName);
    }

    public SortedSet<Index> getUnexpectedIndexes() {
        return unexpectedIndexes;
    }

    public void addMissingPrimaryKey(PrimaryKey primaryKey) {
        missingPrimaryKeys.add(primaryKey);
    }

    public SortedSet<PrimaryKey> getMissingPrimaryKeys() {
        return missingPrimaryKeys;
    }

    public void addUnexpectedPrimaryKey(PrimaryKey primaryKey) {
        unexpectedPrimaryKeys.add(primaryKey);
    }

    public SortedSet<PrimaryKey> getUnexpectedPrimaryKeys() {
        return unexpectedPrimaryKeys;
    }

    public void addMissingSequence(Sequence sequence) {
        missingSequences.add(sequence);
    }

    public SortedSet<Sequence> getMissingSequences() {
        return missingSequences;
    }

    public void addUnexpectedSequence(Sequence sequence) {
        unexpectedSequences.add(sequence);
    }

    public SortedSet<Sequence> getUnexpectedSequences() {
        return unexpectedSequences;
    }

    public void addMissingUniqueConstraint(UniqueConstraint uniqueConstraint) {
        missingUniqueConstraints.add(uniqueConstraint);
    }

    public SortedSet<UniqueConstraint> getMissingUniqueConstraints() {
        return this.missingUniqueConstraints;
    }

    public void addUnexpectedUniqueConstraint(UniqueConstraint uniqueConstraint) {
        unexpectedUniqueConstraints.add(uniqueConstraint);
    }

    public SortedSet<UniqueConstraint> getUnexpectedUniqueConstraints() {
        return unexpectedUniqueConstraints;
    }

    public boolean shouldDiffData() {
        return diffData;
    }

    public void setDiffData(boolean diffData) {
        this.diffData = diffData;
    }

    public String getDataDir() {
        return dataDir;
    }

    public void setDataDir(String dataDir) {
        this.dataDir = dataDir;
    }

    public String getChangeSetContext() {
        return changeSetContext;
    }

    public void setChangeSetContext(String changeSetContext) {
        this.changeSetContext = changeSetContext;
    }

    public boolean differencesFound() throws DatabaseException, IOException {
        boolean differencesInData = false;
        if (shouldDiffData()) {
            List<ChangeSet> changeSets = new ArrayList<ChangeSet>();
            addInsertDataChanges(changeSets);
            differencesInData = !changeSets.isEmpty();
        }

        return getMissingColumns().size() > 0 || getMissingForeignKeys().size() > 0 || getMissingIndexes().size() > 0
                || getMissingPrimaryKeys().size() > 0 || getMissingSequences().size() > 0
                || getMissingTables().size() > 0 || getMissingUniqueConstraints().size() > 0
                || getMissingViews().size() > 0 || getUnexpectedColumns().size() > 0
                || getUnexpectedForeignKeys().size() > 0 || getUnexpectedIndexes().size() > 0
                || getUnexpectedPrimaryKeys().size() > 0 || getUnexpectedSequences().size() > 0
                || getUnexpectedTables().size() > 0 || getUnexpectedUniqueConstraints().size() > 0
                || getUnexpectedViews().size() > 0 || differencesInData;
    }

    public void printResult(PrintStream out) throws DatabaseException {
        out.println("Reference Database: " + referenceSnapshot.getDatabase());
        out.println("Target Database: " + targetSnapshot.getDatabase());

        printComparision("Product Name", productName, out);
        printComparision("Product Version", productVersion, out);
        printSetComparison("Missing Tables", getMissingTables(), out);
        printSetComparison("Unexpected Tables", getUnexpectedTables(), out);
        printSetComparison("Missing Views", getMissingViews(), out);
        printSetComparison("Unexpected Views", getUnexpectedViews(), out);
        printSetComparison("Changed Views", getChangedViews(), out);
        printSetComparison("Missing Columns", getMissingColumns(), out);
        printSetComparison("Unexpected Columns", getUnexpectedColumns(), out);
        printColumnComparison(getChangedColumns(), out);
        printSetComparison("Missing Foreign Keys", getMissingForeignKeys(), out);
        printSetComparison("Unexpected Foreign Keys", getUnexpectedForeignKeys(), out);
        printSetComparison("Missing Primary Keys", getMissingPrimaryKeys(), out);
        printSetComparison("Unexpected Primary Keys", getUnexpectedPrimaryKeys(), out);
        printSetComparison("Unexpected Unique Constraints", getUnexpectedUniqueConstraints(), out);
        printSetComparison("Missing Unique Constraints", getMissingUniqueConstraints(), out);
        printSetComparison("Missing Indexes", getMissingIndexes(), out);
        printSetComparison("Unexpected Indexes", getUnexpectedIndexes(), out);
        printSetComparison("Missing Sequences", getMissingSequences(), out);
        printSetComparison("Unexpected Sequences", getUnexpectedSequences(), out);
    }

    private void printSetComparison(String title, SortedSet<?> objects, PrintStream out) {
        out.print(title + ": ");
        if (objects.size() == 0) {
            out.println("NONE");
        } else {
            out.println();
            for (Object object : objects) {
                out.println("     " + object);
            }
        }
    }

    private void printColumnComparison(SortedSet<Column> changedColumns, PrintStream out) {
        out.print("Changed Columns: ");
        if (changedColumns.size() == 0) {
            out.println("NONE");
        } else {
            out.println();
            for (Column column : changedColumns) {
                out.println("     " + column);
                Column baseColumn = referenceSnapshot.getColumn(column.getTable().getName(), column.getName());
                if (baseColumn != null) {
                    if (baseColumn.isDataTypeDifferent(column)) {
                        out.println("           from "
                                + TypeConverterFactory.getInstance().findTypeConverter(referenceSnapshot.getDatabase())
                                        .convertToDatabaseTypeString(baseColumn, referenceSnapshot.getDatabase())
                                + " to "
                                + TypeConverterFactory
                                        .getInstance()
                                        .findTypeConverter(targetSnapshot.getDatabase())
                                        .convertToDatabaseTypeString(
                                                targetSnapshot.getColumn(column.getTable().getName(), column.getName()),
                                                targetSnapshot.getDatabase()));
                    }
                    if (baseColumn.isNullabilityDifferent(column)) {
                        Boolean nowNullable = targetSnapshot.getColumn(column.getTable().getName(), column.getName())
                                .isNullable();
                        if (nowNullable == null) {
                            nowNullable = Boolean.TRUE;
                        }
                        if (nowNullable) {
                            out.println("           now nullable");
                        } else {
                            out.println("           now not null");
                        }
                    }
                }
            }
        }
    }

    private void printComparision(String title, DiffComparison comparison, PrintStream out) {
        out.print(title + ":");

        if (comparison == null) {
            out.print("NULL");
            return;
        }

        if (comparison.areTheSame()) {
            out.println(" EQUAL");
        } else {
            out.println();
            out.println("     Reference:   '" + comparison.getReferenceVersion() + "'");
            out.println("     Target: '" + comparison.getTargetVersion() + "'");
        }

    }

    public void printChangeLog(String changeLogFile, Database targetDatabase) throws ParserConfigurationException,
            IOException, DatabaseException {
        ChangeLogSerializer changeLogSerializer = serializerFactory.getSerializer(changeLogFile);
        this.printChangeLog(changeLogFile, targetDatabase, changeLogSerializer);
    }

    public void printChangeLog(PrintStream out, Database targetDatabase) throws ParserConfigurationException,
            IOException, DatabaseException {
        this.printChangeLog(out, targetDatabase, new XMLChangeLogSerializer());
    }

    public void printChangeLog(String changeLogFile, Database targetDatabase, ChangeLogSerializer changeLogSerializer)
            throws ParserConfigurationException, IOException, DatabaseException {
        File file = new File(changeLogFile);
        if (!file.exists()) {
            LogFactory.getLogger().info(file + " does not exist, creating");
            FileOutputStream stream = new FileOutputStream(file);
            printChangeLog(new PrintStream(stream), targetDatabase, changeLogSerializer);
            stream.close();
        } else {
            LogFactory.getLogger().info(file + " exists, appending");
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            printChangeLog(new PrintStream(out), targetDatabase, changeLogSerializer);

            String xml = new String(out.toByteArray());
            xml = xml.replaceFirst("(?ms).*<databaseChangeLog[^>]*>", "");
            xml = xml.replaceFirst("</databaseChangeLog>", "");
            xml = xml.trim();
            if ("".equals(xml)) {
                LogFactory.getLogger().info("No changes found, nothing to do");
                return;
            }

            String lineSeparator = System.getProperty("line.separator");
            BufferedReader fileReader = new BufferedReader(new FileReader(file));
            String line;
            long offset = 0;
            while ((line = fileReader.readLine()) != null) {
                int index = line.indexOf("</databaseChangeLog>");
                if (index >= 0) {
                    offset += index;
                } else {
                    offset += line.getBytes().length;
                    offset += lineSeparator.getBytes().length;
                }
            }
            fileReader.close();

            fileReader = new BufferedReader(new FileReader(file));
            fileReader.skip(offset);

            fileReader.close();

            // System.out.println("resulting XML: " + xml.trim());

            RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
            randomAccessFile.seek(offset);
            randomAccessFile.writeBytes("    ");
            randomAccessFile.write(xml.getBytes());
            randomAccessFile.writeBytes(lineSeparator);
            randomAccessFile.writeBytes("</databaseChangeLog>" + lineSeparator);
            randomAccessFile.close();

            // BufferedWriter fileWriter = new BufferedWriter(new
            // FileWriter(file));
            // fileWriter.append(xml);
            // fileWriter.close();
        }
    }

    /**
     * Prints changeLog that would bring the target database to be the same as the reference database
     */
    public void printChangeLog(PrintStream out, Database targetDatabase, ChangeLogSerializer changeLogSerializer)
            throws ParserConfigurationException, IOException, DatabaseException {
        List<ChangeSet> changeSets = new ArrayList<ChangeSet>();
        addMissingTableChanges(changeSets, targetDatabase);
        addMissingColumnChanges(changeSets, targetDatabase);
        addChangedColumnChanges(changeSets);
        addMissingPrimaryKeyChanges(changeSets);
        addUnexpectedPrimaryKeyChanges(changeSets);
        addUnexpectedForeignKeyChanges(changeSets);
        addMissingUniqueConstraintChanges(changeSets);
        addUnexpectedUniqueConstraintChanges(changeSets);

        if (diffData) {
            addInsertDataChanges(changeSets);
        }

        addMissingForeignKeyChanges(changeSets, targetDatabase);
        addUnexpectedIndexChanges(changeSets);
        addMissingIndexChanges(changeSets);
        addUnexpectedColumnChanges(changeSets);
        addMissingSequenceChanges(changeSets);
        addUnexpectedSequenceChanges(changeSets);
        addMissingViewChanges(changeSets);
        addUnexpectedViewChanges(changeSets);
        addChangedViewChanges(changeSets);
        addUnexpectedTableChanges(changeSets);

        changeLogSerializer.write(changeSets, out);

        out.flush();
    }

    private ChangeSet generateChangeSet(Change change) {
        ChangeSet changeSet = generateChangeSet();
        changeSet.addChange(change);
        return changeSet;
    }

    private ChangeSet generateChangeSet() {
        return new ChangeSet(generateId(), getChangeSetAuthor(), false, false, null, getChangeSetContext(), null);
    }

    private String getChangeSetAuthor() {
        if (changeSetAuthor != null) {
            return changeSetAuthor;
        }
        String author = System.getProperty("user.name");
        if (StringUtils.trimToNull(author) == null) {
            return "diff-generated";
        } else {
            return author + " (generated)";
        }
    }

    public void setChangeSetAuthor(String changeSetAuthor) {
        this.changeSetAuthor = changeSetAuthor;
    }

    public void setIdRoot(String idRoot) {
        this.idRoot = idRoot;
    }

    protected String generateId() {
        return idRoot + "-" + changeNumber++;
    }

    private void addUnexpectedIndexChanges(List<ChangeSet> changes) {
        for (Index index : getUnexpectedIndexes()) {

            if (index.getAssociatedWith().contains(Index.MARK_PRIMARY_KEY)
                    || index.getAssociatedWith().contains(Index.MARK_FOREIGN_KEY)
                    || index.getAssociatedWith().contains(Index.MARK_UNIQUE_CONSTRAINT)) {
                continue;
            }

            DropIndexChange change = new DropIndexChange();
            change.setTableName(index.getTable().getName());
            change.setSchemaName(index.getTable().getSchema());
            change.setIndexName(index.getName());
            change.setAssociatedWith(index.getAssociatedWithAsString());

            changes.add(generateChangeSet(change));
        }
    }

    private void addMissingIndexChanges(List<ChangeSet> changes) {
        for (Index index : getMissingIndexes()) {

            CreateIndexChange change = new CreateIndexChange();
            change.setTableName(index.getTable().getName());
            change.setTablespace(index.getTablespace());
            change.setSchemaName(index.getTable().getSchema());
            change.setIndexName(index.getName());
            change.setUnique(index.isUnique());
            change.setAssociatedWith(index.getAssociatedWithAsString());

            if (index.getAssociatedWith().contains(Index.MARK_PRIMARY_KEY)
                    || index.getAssociatedWith().contains(Index.MARK_FOREIGN_KEY)
                    || index.getAssociatedWith().contains(Index.MARK_UNIQUE_CONSTRAINT)) {
                continue;
            }

            for (String columnName : index.getColumns()) {
                ColumnConfig column = new ColumnConfig();
                column.setName(columnName);
                change.addColumn(column);
            }
            changes.add(generateChangeSet(change));
        }
    }

    private void addUnexpectedPrimaryKeyChanges(List<ChangeSet> changes) {
        for (PrimaryKey pk : getUnexpectedPrimaryKeys()) {

            if (!getUnexpectedTables().contains(pk.getTable())) {
                DropPrimaryKeyChange change = new DropPrimaryKeyChange();
                change.setTableName(pk.getTable().getName());
                change.setSchemaName(pk.getTable().getSchema());
                change.setConstraintName(pk.getName());

                changes.add(generateChangeSet(change));
            }
        }
    }

    private void addMissingPrimaryKeyChanges(List<ChangeSet> changes) {
        for (PrimaryKey pk : getMissingPrimaryKeys()) {

            AddPrimaryKeyChange change = new AddPrimaryKeyChange();
            change.setTableName(pk.getTable().getName());
            change.setSchemaName(pk.getTable().getSchema());
            change.setConstraintName(pk.getName());
            change.setColumnNames(pk.getColumnNames());
            change.setTablespace(pk.getTablespace());

            changes.add(generateChangeSet(change));
        }
    }

    private void addUnexpectedUniqueConstraintChanges(List<ChangeSet> changes) {
        for (UniqueConstraint uc : getUnexpectedUniqueConstraints()) {
            // Need check for nulls here due to NullPointerException using Postgres
            if (null != uc) {
                if (null != uc.getTable()) {
                    DropUniqueConstraintChange change = new DropUniqueConstraintChange();
                    change.setTableName(uc.getTable().getName());
                    change.setSchemaName(uc.getTable().getSchema());
                    change.setConstraintName(uc.getName());

                    changes.add(generateChangeSet(change));
                }
            }
        }
    }

    private void addMissingUniqueConstraintChanges(List<ChangeSet> changes) {
        for (UniqueConstraint uc : getMissingUniqueConstraints()) {
            // Need check for nulls here due to NullPointerException using Postgres
            if (null != uc)
                if (null != uc.getTable()) {
                    AddUniqueConstraintChange change = new AddUniqueConstraintChange();
                    change.setTableName(uc.getTable().getName());
                    change.setTablespace(uc.getTablespace());
                    change.setSchemaName(uc.getTable().getSchema());
                    change.setConstraintName(uc.getName());
                    change.setColumnNames(uc.getColumnNames());
                    change.setDeferrable(uc.isDeferrable());
                    change.setInitiallyDeferred(uc.isInitiallyDeferred());
                    change.setDisabled(uc.isDisabled());
                    changes.add(generateChangeSet(change));
                }
        }
    }

    private void addUnexpectedForeignKeyChanges(List<ChangeSet> changes) {
        for (ForeignKey fk : getUnexpectedForeignKeys()) {

            DropForeignKeyConstraintChange change = new DropForeignKeyConstraintChange();
            change.setConstraintName(fk.getName());
            change.setBaseTableName(fk.getForeignKeyTable().getName());
            change.setBaseTableSchemaName(fk.getForeignKeyTable().getSchema());

            changes.add(generateChangeSet(change));
        }
    }

    private void addMissingForeignKeyChanges(List<ChangeSet> changes, Database database) {
        List<AddForeignKeyConstraintChange> fks = new ArrayList<AddForeignKeyConstraintChange>();

        for (ForeignKey fk : getMissingForeignKeys()) {

            AddForeignKeyConstraintChange change = new AddForeignKeyConstraintChange();
            change.setConstraintName(fk.getName());

            change.setReferencedTableName(fk.getPrimaryKeyTable().getName());
            if (!EXCLUDE_SCHEMA) {
                change.setReferencedTableSchemaName(fk.getPrimaryKeyTable().getSchema());
            }
            change.setReferencedColumnNames(fk.getPrimaryKeyColumns());

            change.setBaseTableName(fk.getForeignKeyTable().getName());
            if (!EXCLUDE_SCHEMA) {
                change.setBaseTableSchemaName(fk.getForeignKeyTable().getSchema());
            }
            change.setBaseColumnNames(fk.getForeignKeyColumns());

            change.setDeferrable(fk.isDeferrable());
            change.setInitiallyDeferred(fk.isInitiallyDeferred());
            change.setOnUpdate(getUpdateRule(fk.getUpdateRule(), database));
            change.setOnDelete(getDeleteRule(fk.getDeleteRule(), database));

            change.setReferencesUniqueColumn(fk.getReferencesUniqueColumn());
            fks.add(change);

        }
        Collections.sort(fks, new AddForeignKeyConstraintChangeComparator());
        for (Change change : fks) {
            changes.add(generateChangeSet(change));
        }
    }

    protected ForeignKeyConstraintType getDeleteRule(ForeignKeyConstraintType rule, Database database) {
        if (database.isDefaultDeleteRule(rule)) {
            return database.getDefaultDeleteRule();
        } else {
            return rule;
        }
    }

    protected ForeignKeyConstraintType getUpdateRule(ForeignKeyConstraintType rule, Database database) {
        if (database.isDefaultUpdateRule(rule)) {
            return database.getDefaultUpdateRule();
        } else {
            return rule;
        }
    }

    private void addUnexpectedSequenceChanges(List<ChangeSet> changes) {
        for (Sequence sequence : getUnexpectedSequences()) {

            DropSequenceChange change = new DropSequenceChange();
            change.setSequenceName(sequence.getName());
            change.setSchemaName(sequence.getSchema());

            changes.add(generateChangeSet(change));
        }
    }

    private void addMissingSequenceChanges(List<ChangeSet> changes) {
        for (Sequence sequence : getMissingSequences()) {

            CreateSequenceChange change = new CreateSequenceChange();
            change.setSequenceName(sequence.getName());
            change.setStartValue(sequence.getStartValue());
            if (!EXCLUDE_SCHEMA) {
                change.setSchemaName(sequence.getSchema());
            }

            changes.add(generateChangeSet(change));
        }
    }

    private void addUnexpectedColumnChanges(List<ChangeSet> changes) {
        for (Column column : getUnexpectedColumns()) {
            if (!shouldModifyColumn(column)) {
                continue;
            }

            DropColumnChange change = new DropColumnChange();
            change.setTableName(column.getTable().getName());
            change.setSchemaName(column.getTable().getSchema());
            change.setColumnName(column.getName());

            changes.add(generateChangeSet(change));
        }
    }

    private void addMissingViewChanges(List<ChangeSet> changes) {
        for (View view : getMissingViews()) {

            CreateViewChange change = new CreateViewChange();
            change.setViewName(view.getName());
            if (!EXCLUDE_SCHEMA) {
                change.setSchemaName(view.getSchema());
            }
            String selectQuery = view.getDefinition();
            if (selectQuery == null) {
                selectQuery = "COULD NOT DETERMINE VIEW QUERY";
            }
            change.setSelectQuery(selectQuery);

            changes.add(generateChangeSet(change));
        }
    }

    private void addChangedViewChanges(List<ChangeSet> changes) {
        for (View view : getChangedViews()) {

            CreateViewChange change = new CreateViewChange();
            change.setViewName(view.getName());
            change.setSchemaName(view.getSchema());
            String selectQuery = view.getDefinition();
            if (selectQuery == null) {
                selectQuery = "COULD NOT DETERMINE VIEW QUERY";
            }
            change.setSelectQuery(selectQuery);
            change.setReplaceIfExists(true);

            changes.add(generateChangeSet(change));
        }
    }

    private void addChangedColumnChanges(List<ChangeSet> changes) {
        for (Column column : getChangedColumns()) {
            if (!shouldModifyColumn(column)) {
                continue;
            }

            TypeConverter targetTypeConverter = TypeConverterFactory.getInstance().findTypeConverter(
                    targetSnapshot.getDatabase());
            boolean foundDifference = false;
            Column referenceColumn = referenceSnapshot.getColumn(column.getTable().getName(), column.getName());
            if (column.isDataTypeDifferent(referenceColumn)) {
                ModifyDataTypeChange change = new ModifyDataTypeChange();
                change.setTableName(column.getTable().getName());
                change.setSchemaName(column.getTable().getSchema());
                change.setColumnName(column.getName());
                change.setNewDataType(targetTypeConverter.convertToDatabaseTypeString(referenceColumn,
                        targetSnapshot.getDatabase()));
                changes.add(generateChangeSet(change));
                foundDifference = true;
            }
            if (column.isNullabilityDifferent(referenceColumn)) {
                if (referenceColumn.isNullable() == null || referenceColumn.isNullable()) {
                    DropNotNullConstraintChange change = new DropNotNullConstraintChange();
                    change.setTableName(column.getTable().getName());
                    change.setSchemaName(column.getTable().getSchema());
                    change.setColumnName(column.getName());
                    change.setColumnDataType(targetTypeConverter.convertToDatabaseTypeString(referenceColumn,
                            targetSnapshot.getDatabase()));

                    changes.add(generateChangeSet(change));
                    foundDifference = true;
                } else {
                    AddNotNullConstraintChange change = new AddNotNullConstraintChange();
                    change.setTableName(column.getTable().getName());
                    change.setSchemaName(column.getTable().getSchema());
                    change.setColumnName(column.getName());
                    change.setColumnDataType(targetTypeConverter.convertToDatabaseTypeString(referenceColumn,
                            targetSnapshot.getDatabase()));

                    Object defaultValue = column.getDefaultValue();
                    String defaultValueString;
                    if (defaultValue != null) {
                        defaultValueString = targetTypeConverter.getDataType(defaultValue).convertObjectToString(
                                defaultValue, targetSnapshot.getDatabase());

                        if (defaultValueString != null) {
                            change.setDefaultNullValue(defaultValueString);
                        }
                    }

                    changes.add(generateChangeSet(change));
                    foundDifference = true;
                }

            }
            if (!foundDifference) {
                throw new RuntimeException("Unknown difference");
            }
        }
    }

    private boolean shouldModifyColumn(Column column) {
        return column.getView() == null
                && !referenceSnapshot.getDatabase().isLiquibaseTable(column.getTable().getName());

    }

    private void addUnexpectedViewChanges(List<ChangeSet> changes) {
        for (View view : getUnexpectedViews()) {

            DropViewChange change = new DropViewChange();
            change.setViewName(view.getName());
            change.setSchemaName(view.getSchema());

            changes.add(generateChangeSet(change));
        }
    }

    private void addMissingColumnChanges(List<ChangeSet> changes, Database database) {
        for (Column column : getMissingColumns()) {
            if (!shouldModifyColumn(column)) {
                continue;
            }

            TypeConverterFactory factory = TypeConverterFactory.getInstance();
            TypeConverter converter = factory.findTypeConverter(database);

            AddColumnChange change = new AddColumnChange();
            change.setTableName(column.getTable().getName());
            change.setSchemaName(column.getTable().getSchema());

            ColumnConfig columnConfig = new ColumnConfig();
            columnConfig.setName(column.getName());

            String dataType = converter.convertToDatabaseTypeString(column, database);

            columnConfig.setType(dataType);

            Object defaultValue = column.getDefaultValue();
            if (defaultValue != null) {
                DataType databaseDataType = converter.getDataType(defaultValue);
                String defaultValueString = databaseDataType.convertObjectToString(defaultValue, database);

                if (defaultValueString != null) {
                    defaultValueString = defaultValueString.replaceFirst("'", "").replaceAll("'$", "");
                }
                columnConfig.setDefaultValue(defaultValueString);
            }

            if (column.getRemarks() != null) {
                columnConfig.setRemarks(column.getRemarks());
            }
            ConstraintsConfig constraintsConfig = columnConfig.getConstraints();
            if (column.isNullable() != null && !column.isNullable()) {
                if (constraintsConfig == null) {
                    constraintsConfig = new ConstraintsConfig();
                }
                constraintsConfig.setNullable(false);
            }
            if (column.isUnique()) {
                if (constraintsConfig == null) {
                    constraintsConfig = new ConstraintsConfig();
                }
                constraintsConfig.setUnique(true);
            }
            if (constraintsConfig != null) {
                columnConfig.setConstraints(constraintsConfig);
            }

            change.addColumn(columnConfig);

            changes.add(generateChangeSet(change));
        }
    }

    protected PrimaryKey getPrimaryKey(String tableName) {
        for (PrimaryKey pk : getMissingPrimaryKeys()) {
            if (pk.getTable().getName().equalsIgnoreCase(tableName)) {
                return pk;
            }
        }
        return null;
    }

    protected void handleConstraints(Table table, Column column, ColumnConfig columnConfig) {
        ConstraintsConfig constraintsConfig = null;
        if (column.isPrimaryKey()) {
            PrimaryKey primaryKey = null;
            for (PrimaryKey pk : getMissingPrimaryKeys()) {
                if (pk.getTable().getName().equalsIgnoreCase(table.getName())) {
                    primaryKey = pk;
                }
            }

            if (primaryKey == null || primaryKey.getColumnNamesAsList().size() == 1) {
                constraintsConfig = new ConstraintsConfig();
                constraintsConfig.setPrimaryKey(true);
                constraintsConfig.setPrimaryKeyTablespace(column.getTablespace());

                if (primaryKey != null) {
                    constraintsConfig.setPrimaryKeyName(primaryKey.getName());
                    getMissingPrimaryKeys().remove(primaryKey);
                }
            }
        }

        if (column.isAutoIncrement()) {
            columnConfig.setAutoIncrement(true);
        }

        if (column.isNullable() != null && !column.isNullable()) {
            if (constraintsConfig == null) {
                constraintsConfig = new ConstraintsConfig();
            }

            constraintsConfig.setNullable(false);
        }
        // if (column.isUnique()) {
        // if (constraintsConfig == null) {
        // constraintsConfig = new ConstraintsConfig();
        // }
        // constraintsConfig.setUnique(true);
        // }
        if (constraintsConfig != null) {
            columnConfig.setConstraints(constraintsConfig);
        }
    }

    protected ColumnConfig getColumnConfig(Database database, Table table, Column column, TypeConverter converter) {
        String jdbcType = converter.convertToJDBCTypeString(column, database);

        ColumnConfig columnConfig = new ColumnConfig();
        columnConfig.setName(column.getName());
        columnConfig.setType(jdbcType);
        columnConfig.setRemarks(column.getRemarks());
        columnConfig.setAutoIncrement(column.isAutoIncrement());

        handleConstraints(table, column, columnConfig);
        updateDefaultValue(column, column.getDefaultValue(), columnConfig);

        return columnConfig;
    }

    protected void updateDefaultValue(Column column, Object defaultValue, ColumnConfig columnConfig) {
        if (defaultValue == null) {
            // do nothing
        } else if (column.isAutoIncrement()) {
            // do nothing
        } else if (defaultValue instanceof Date) {
            columnConfig.setDefaultValueDate((Date) defaultValue);
        } else if (defaultValue instanceof Boolean) {
            columnConfig.setDefaultValueBoolean(((Boolean) defaultValue));
        } else if (defaultValue instanceof Number) {
            columnConfig.setDefaultValueNumeric(((Number) defaultValue));
        } else if (defaultValue instanceof DatabaseFunction) {
            columnConfig.setDefaultValueComputed((DatabaseFunction) defaultValue);
        } else {
            columnConfig.setDefaultValue(defaultValue.toString());
        }
    }

    protected CreateTableChange getCreateTableChange(Database database, Table table, TypeConverter converter) {
        CreateTableChange change = new CreateTableChange();
        change.setTableName(table.getName());
        change.setSchemaName(table.getSchema());
        change.setRemarks(table.getRemarks());
        for (Column column : table.getColumns()) {
            ColumnConfig columnConfig = getColumnConfig(database, table, column, converter);
            change.addColumn(columnConfig);
        }
        return change;

    }

    private void addMissingTableChanges(List<ChangeSet> changes, Database database) {
        TypeConverterFactory factory = TypeConverterFactory.getInstance();
        TypeConverter converter = factory.findTypeConverter(database);

        for (Table missingTable : getMissingTables()) {
            if (referenceSnapshot.getDatabase().isLiquibaseTable(missingTable.getName())) {
                continue;
            }
            CreateTableChange change = getCreateTableChange(database, missingTable, converter);
            ChangeSet changeSet = generateChangeSet(change);
            changes.add(changeSet);
        }
    }

    private void addUnexpectedTableChanges(List<ChangeSet> changes) {
        for (Table unexpectedTable : getUnexpectedTables()) {
            DropTableChange change = new DropTableChange();
            change.setTableName(unexpectedTable.getName());
            change.setSchemaName(unexpectedTable.getSchema());

            changes.add(generateChangeSet(change));
        }
    }

    protected List<Map> getList(Database database, String schema, Table table) throws DatabaseException {
        ExecutorService service = ExecutorService.getInstance();
        Executor executor = service.getExecutor(referenceSnapshot.getDatabase());
        String sql = "SELECT * FROM " + database.escapeTableName(schema, table.getName());
        SqlStatement ss = new RawSqlStatement(sql);
        return executor.queryForList(ss);
    }

    protected List<String> getColumnNames(Table table) {
        List<String> columnNames = new ArrayList<String>();
        for (Column column : table.getColumns()) {
            columnNames.add(column.getName());
        }
        return columnNames;
    }

    protected List<SqlType> getColumnTypes(Table table) {
        List<SqlType> columnTypes = new ArrayList<SqlType>();
        for (Column column : table.getColumns()) {
            SqlType sqlType = getSqlType(column.getDataType());
            columnTypes.add(sqlType);
        }
        return columnTypes;
    }

    protected SqlType getSqlType(int dataType) {
        SqlType[] sqlTypes = SqlType.values();
        for (SqlType sqlType : sqlTypes) {
            if (dataType == sqlType.getValue()) {
                return sqlType;
            }
        }
        return SqlType.UNKNOWN;
    }

    protected File getDataFile(String dataDir, String filename) {
        if (dataDir != null) {
            filename = dataDir + FS + filename;
        }

        File parentDir = new File(dataDir);
        if (!parentDir.exists()) {
            parentDir.mkdirs();
        }
        if (!parentDir.isDirectory()) {
            throw new RuntimeException(parentDir + " is not a directory");
        }
        return new File(filename);
    }

    protected String getFilenameFromTableName(Table table) {
        return table.getName().toLowerCase() + ".csv";
    }

    protected void updateDataTypes(int index, String[] dataTypes, Object value) {
        String existingDataType = dataTypes[index];
        if (existingDataType != null) {
            return;
        }
        if (value == null) {
            return;
        }
        String dataType = getDataType(value);
        dataTypes[index] = dataType;
    }

    protected String getDataType(Object value) {
        if (value instanceof Number) {
            return "NUMERIC";
        } else if (value instanceof Boolean) {
            return "BOOLEAN";
        } else if (value instanceof Date) {
            return "DATE";
        } else {
            return "STRING";
        }
    }

    protected String getPrintValue(Object value) {
        if (value == null) {
            return "NULL";
        }
        if (value instanceof Date) {
            return isoDateFormat.format(((Date) value));
        } else {
            if (this.flatten && value instanceof String) {
                return StringUtils.flatten((String) value);
            } else {
                return value.toString();
            }
        }
    }

    protected String[] getStringArray(List<String> columnNames, Map<String, Object> row) {
        String[] line = new String[columnNames.size()];
        for (int i = 0; i < columnNames.size(); i++) {
            Object value = row.get(columnNames.get(i).toUpperCase());
            line[i] = getPrintValue(value);
        }
        return line;
    }

    protected void printCSV(LoadDataContext context, String filename) throws IOException {

        List<String> columnNames = getColumnNames(context.getTable());

        // Get a CSV writer
        CSVWriter writer = new CSVWriter(new FileWriter(filename));

        // Print the columns
        String[] columns = columnNames.toArray(new String[columnNames.size()]);
        writer.writeNext(columns);

        // Print the data
        for (Map<String, Object> row : context.getData()) {
            String[] line = getStringArray(columnNames, row);
            writer.writeNext(line);
        }
        writer.flush();
        writer.close();
    }

    protected LoadDataChange getLoadDataChange(LoadDataContext context, String filename) {

        LoadDataChange change = new LoadDataChange();
        change.setFile(filename);
        change.setEncoding(ENCODING);
        change.setSchemaName(context.getSchema());
        change.setTableName(context.getTable().getName());
        change.setFlattened(Boolean.toString(flatten));
        List<SqlType> columnTypes = getColumnTypes(context.getTable());

        Table table = context.getTable();
        List<Column> columns = table.getColumns();
        for (int i = 0; i < columns.size(); i++) {
            Column column = columns.get(i);
            String columnName = column.getName();
            SqlType columnType = columnTypes.get(i);
            LoadDataColumnConfig columnConfig = new LoadDataColumnConfig();
            if (column.isPrimaryKey()) {
                ConstraintsConfig cc = new ConstraintsConfig();
                cc.setPrimaryKey(true);
                columnConfig.setConstraints(cc);
            }
            columnConfig.setHeader(columnName);
            columnConfig.setName(columnName);
            columnConfig.setType(columnType.name());
            change.addColumn(columnConfig);
        }
        return change;
    }

    protected InsertDataChange getInsertDataChange(Table table, String schema, List<String> columnNames, Map row) {
        InsertDataChange change = new InsertDataChange();
        change.setSchemaName(schema);
        change.setTableName(table.getName());

        // loop over all columns for this row
        for (int i = 0; i < columnNames.size(); i++) {
            ColumnConfig column = new ColumnConfig();
            column.setName(columnNames.get(i));
            Object value = row.get(columnNames.get(i).toUpperCase());
            if (value == null) {
                column.setValue(null);
            } else if (value instanceof Number) {
                column.setValueNumeric((Number) value);
            } else if (value instanceof Boolean) {
                column.setValueBoolean((Boolean) value);
            } else if (value instanceof Date) {
                column.setValueDate((Date) value);
            } else { // string
                column.setValue(value.toString().replace("\\", "\\\\"));
            }
            change.addColumn(column);
        }
        return change;

    }

    /**
     * This method returns a relative url suitable for passing to a resource loader
     *
     * Given a dataFile of:
     *
     * <pre>
     * /tmp/workspace/target/src/main/resources/org/kuali/data.csv
     * </pre>
     *
     * and a workingDir of:
     *
     * <pre>
     * /tmp/workspace/target/src/main/resources
     * </pre>
     *
     * This method returns: <code>org/kuali/data.csv</code>
     */
    protected String getRelativeUrl(File dataFile, String workingDir) throws IOException {
        if (workingDir == null) {
            return dataFile.getCanonicalPath();
        }
        File base = new File(workingDir);
        String workingDirPath = base.getCanonicalPath();
        String dataDirPath = dataFile.getCanonicalPath();
        int pos = dataDirPath.indexOf(workingDirPath);
        if (pos != 0) {
            throw new IOException(dataDirPath + " must be a subdirectory of " + workingDirPath);
        }
        int index = workingDirPath.length();

        // Skip past the working directory (and the file separator)
        String s = dataDirPath.substring(index + FS.length());

        // Replace any backslashes with a forward slash
        s = s.replace("\\", "/");
        return s;
    }

    protected boolean isUseLoadDataTag() {
        return dataDir != null;
    }

    protected List<Change> doLoadDataTag(LoadDataContext context) throws IOException {
        String filename = getFilenameFromTableName(context.getTable());
        File dataFile = getDataFile(dataDir, filename);
        String url = getRelativeUrl(dataFile, workingDir);
        printCSV(context, dataFile.getCanonicalPath());
        LoadDataChange change = getLoadDataChange(context, url);
        List<Change> changes = new ArrayList<Change>();
        changes.add(change);
        return changes;
    }

    protected List<Map<String, Object>> copy(@SuppressWarnings("rawtypes") List<Map> rs) {
        List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
        for (Map<?, ?> row : rs) {
            data.add(copy(row));
        }
        return data;
    }

    protected Map<String, Object> copy(Map<?, ?> rs) {
        Map<String, Object> data = new HashMap<String, Object>();
        Set<?> keys = rs.keySet();
        for (Object key : keys) {
            Object value = rs.get(key);
            data.put((String) key, value);
        }
        return data;
    }

    protected List<Change> getChanges(Table table, List<Map> rs, String schema) throws IOException {

        // Print a .csv file that is referenced by a loadData tag
        if (isUseLoadDataTag()) {
            LoadDataContext context = new LoadDataContext();
            context.setTable(table);
            context.setData(copy(rs));
            context.setSchema(schema);
            return doLoadDataTag(context);
        }

        List<String> columnNames = getColumnNames(table);
        // Create inline insert data changes, there is one insert change per row in the table
        // Wrapped inside of a changeSet tag for the table
        List<Change> changes = new ArrayList<Change>();
        for (Map row : rs) {
            Change change = getInsertDataChange(table, schema, columnNames, row);
            changes.add(change);
        }
        return changes;
    }

    /**
     * Create ChangeSet objects representing the need to insert data
     */
    private void addInsertDataChanges(List<ChangeSet> changeSets) throws DatabaseException, IOException {
        Database database = referenceSnapshot.getDatabase();
        try {
            String schema = referenceSnapshot.getSchema();
            for (Table table : referenceSnapshot.getTables()) {
                // Extract data from this table
                List<Map> rs = getList(database, schema, table);

                // Table is empty
                if (rs.size() == 0) {
                    continue;
                }

                // Convert the data to one or more change objects
                List<Change> changes = getChanges(table, rs, schema);

                // Double check that there is data to insert
                if (changes.size() == 0) {
                    continue;
                }

                // Create a new changeSet for this table
                ChangeSet changeSet = generateChangeSet();
                for (Change change : changes) {
                    changeSet.addChange(change);
                }

                // Add this changeSet to the list
                changeSets.add(changeSet);
            }
        } catch (Exception e) {
            throw new DatabaseException(e);
        }
    }

    public String getWorkingDir() {
        return workingDir;
    }

    public void setWorkingDir(String workingDir) {
        this.workingDir = workingDir;
    }

    public boolean isFlatten() {
        return flatten;
    }

    public void setFlatten(boolean flatten) {
        this.flatten = flatten;
    }

}
