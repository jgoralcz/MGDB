package sql;

import org.dbunit.JdbcDatabaseTester;
import org.dbunit.database.IDatabaseConnection;
import org.dbunit.dataset.IDataSet;
import org.dbunit.operation.DatabaseOperation;

import junit.framework.TestCase;

public class DbTest extends TestCase {
    	
	public DbTest(String name) {
        super(name);
    }

    protected void setUp() throws Exception {
        super.setUp();
        
        // initialize your database connection here
        IDatabaseConnection connection = null;
        // ...

        // initialize your dataset here
        IDataSet dataSet = null;
        // ...

        try {
            DatabaseOperation.CLEAN_INSERT.execute(connection, dataSet);
        }
        finally {
            connection.close();
        }
    }

    protected void tearDown() throws Exception
    {
	// will call default tearDownOperation
        //databaseTester.onTearDown();
    }
}