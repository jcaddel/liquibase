package liquibase.migrator.change;

import liquibase.database.Database;
import liquibase.migrator.FileOpener;
import liquibase.migrator.exception.SetupException;
import liquibase.migrator.exception.UnsupportedChangeException;
import liquibase.util.MD5Util;
import liquibase.util.StreamUtil;
import liquibase.util.StringUtils;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/**
 * Represents a Change for custom SQL stored in a File.
 * 
 * To create an instance call the constructor as normal and then call
 * @{#setFileOpener(FileOpener)} before calling setPath otherwise the
 * file will likely not be found.
 * 
 * 
 * @author <a href="mailto:csuml@yahoo.co.uk">Paul Keeble</a>
 * 
 */
public class SQLFileChange extends AbstractChange {
    private String sql;
    private String file;

    public SQLFileChange() {
        super("sqlFile", "SQL From File");
    }

    public String getSql() {
        return sql;
    }
    
    /**
     * Used only for testing, this should not be used in code.
     * 
     * @param sql
     */
    protected void setSql(String sql) {
       this.sql = sql;
    }

    public String getPath() {
        return file;
    }

    /**
     * Sets the file name and loads the SQL from the file.
     * 
     * The file name is searched in the following order: 
     * 1. The file is searched for in the classpath 
     * 2. If not found in the classpath it is loaded from
     * the file system. 
     * 3. If no file is found an Exception is thrown.
     * 
     * @param fileName The file to use
     * @throws IllegalArgumentException If null was passed as the fileName
     */
    public void setPath(String fileName) {
        file = fileName;
    }
    
    public void setUp() throws SetupException {
        if (file == null)
            throw new SetupException("<sqlfile> - No path specified");
        
        boolean loaded = loadFromClasspath(file);
        if(!loaded)
            loaded = loadFromFileSystem(file);

        if (!loaded)
            throw new SetupException("<sqlfile path="+file+"> - Could not find file");
    }

    /**
     * Tries to load the file from the file system.
     * 
     * @param file The name of the file to search for
     * @return True if the file was found, false otherwise.
     */
    private boolean loadFromFileSystem(String file) throws SetupException {

        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
            sql = StreamUtil.getStreamContents(fis);
            return true;
        } catch (FileNotFoundException fnfe) {
            return false;
        } catch (IOException e) {
            throw new SetupException("<sqlfile path="+file+"> -Unable to read file", e);
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException ioe) {
                    // safe to ignore
                }
            }
        }

    }

    /**
     * Tries to load a file using the FileOpener.
     * 
     * If the fileOpener can not be found then the attempt to load from the
     * classpath the return is false.
     * 
     * @param file The file name to try and find.
     * @return True if the file was found and loaded, false otherwise.
     */
    private boolean loadFromClasspath(String file) throws SetupException {
        InputStream in = null;
        try {
            FileOpener fo = getFileOpener();
            if(fo== null)
                return false;
            
            in = fo.getResourceAsStream(file);
            if (in == null)
                return false;
            sql = StreamUtil.getStreamContents(in);
            return true;
        } catch (IOException ioe) {
            throw new SetupException("<sqlfile path="+file+"> -Unable to read file", ioe);
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException ioe) {
                    // safe to ignore
                }
            }
        }
    }
    
    /**
     * Calculates an MD5 from the contents of the file.
     * 
     * @see liquibase.migrator.change.AbstractChange#getMD5Sum()
     */
    public String getMD5Sum() {
        return MD5Util.computeMD5(getSql());
    }

    public Element createNode(Document currentChangeLogDOM) {
        Element sqlElement = currentChangeLogDOM.createElement("sqlFile");
        sqlElement.setAttribute("path", file);
        return sqlElement;
    }

    /**
     * Generates a single statement for all of the SQL in the file.
     */
    public String[] generateStatements(Database database)
            throws UnsupportedChangeException {
        //strip ; from end of statements
        String[] statements = StringUtils.splitSQL(sql);
        
        return statements;
    }

    public String getConfirmationMessage() {
        return "SQL File " + file + " has been executed";
    }
}