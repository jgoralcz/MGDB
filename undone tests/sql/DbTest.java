package sql;

/**
* Copyright © 2019 Jeremy Powell
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* I grant the right to the facility of and to Kevin Gary at
* Arizona State University the right to copy, compile, and execute
* this code. You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
* SER322 Database Management - Project
* @author Jeremy Powell jcpowel5@asu.edu
*         Software Engineering, ASU Poly
* @version April 15, 2019
*
*/

import java.io.FileInputStream;

import org.dbunit.DBTestCase;
import org.dbunit.PropertiesBasedJdbcDatabaseTester;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSetBuilder;
import org.dbunit.operation.DatabaseOperation;
import org.junit.Test;

public class DbTest extends DBTestCase {

   public DbTest(String name) {
       super(name);
       System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_DRIVER_CLASS, "com.mysql.jdbc.Driver");
       System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_CONNECTION_URL, "jdbc:mysql://localhost:3306/mygame_db");
       System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_USERNAME, "root");
       System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_PASSWORD, "PASSWORD"); //TODO Put your sql password in "YOUR PASSWORD"
   }

   protected IDataSet getDataSet() throws Exception {
       return new FlatXmlDataSetBuilder().build(new FileInputStream("test/sql/Games.xml"));
   }

   protected DatabaseOperation getSetUpOperation() throws Exception {
       return DatabaseOperation.REFRESH;
   }

   protected DatabaseOperation getTearDownOperation() throws Exception {
       return DatabaseOperation.NONE;
   }

   @Test
   public void testById() {
       int userId = 5;// get user id from database
       assertNotNull(userId);
   }
}
