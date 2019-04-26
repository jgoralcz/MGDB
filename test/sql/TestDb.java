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

import java.io.File;

import org.dbunit.DBTestCase;
import org.dbunit.PropertiesBasedJdbcDatabaseTester;
import org.dbunit.database.DatabaseConfig;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.ITable;
import org.dbunit.dataset.filter.DefaultColumnFilter;
import org.dbunit.dataset.xml.FlatXmlDataSetBuilder;
import org.dbunit.ext.mysql.MySqlDataTypeFactory;
import org.dbunit.ext.mysql.MySqlMetadataHandler;
import org.dbunit.operation.DatabaseOperation;
import org.junit.Test;

public class TestDb extends DBTestCase {

	IDataSet actualDataSet, expectedDataSet;

	private static String URL = "jdbc:mysql://localhost:3306/mygame_db?useSSL=false";
	private static String USERNAME = "root";
	private static String PASSWORD = "YOUR PASSWORD"; // TODO Change to YOUR SQL db password

   public TestDb(String name) {
       super(name);
       System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_DRIVER_CLASS, "com.mysql.jdbc.Driver");
       System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_CONNECTION_URL, URL);
       System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_USERNAME, USERNAME);
       System.setProperty(PropertiesBasedJdbcDatabaseTester.DBUNIT_PASSWORD, PASSWORD);
   }

   protected void setUpDatabaseConfig(DatabaseConfig config)
   {
       config.setProperty(DatabaseConfig.PROPERTY_DATATYPE_FACTORY,
               new MySqlDataTypeFactory());
       config.setProperty(DatabaseConfig.PROPERTY_METADATA_HANDLER,
               new MySqlMetadataHandler());
   }


   protected IDataSet getDataSet() throws Exception {
//	   ReplacementDataSet dataSet = new ReplacementDataSet(new FlatXmlDataSet(new File("fullData.xml")));
//	   dataSet.addReplacementObject("[NULL]", null);
//	   dataSet.setStrictReplacement(true);
//	   return dataSet;
	   FlatXmlDataSetBuilder builder = new FlatXmlDataSetBuilder();
       builder.setColumnSensing(true);
       actualDataSet = getConnection().createDataSet();
       expectedDataSet = new FlatXmlDataSetBuilder().build(new File("test/sql/xml/gameDataExpected.xml"));
       return builder.build(new File("test/sql/xml/gameDataExpected.xml"));
   }

   protected DatabaseOperation getSetUpOperation() throws Exception {
       return DatabaseOperation.REFRESH;
   }

   protected DatabaseOperation getTearDownOperation() throws Exception {
       return DatabaseOperation.NONE;
   }

   @Test
   public void testCharactersTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Characters");
       ITable expectedTable = expectedDataSet.getTable("Characters");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testCompaniesTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Companies");
       ITable expectedTable = expectedDataSet.getTable("Companies");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testCompaniesGameTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Companies_Game");
       ITable expectedTable = expectedDataSet.getTable("Companies_Game");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testCompaniesWorkerTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Companies_Worker");
       ITable expectedTable = expectedDataSet.getTable("Companies_Worker");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testCosmeticsTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Cosmetics");
       ITable expectedTable = expectedDataSet.getTable("Cosmetics");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testCriticsTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Critics");
       ITable expectedTable = expectedDataSet.getTable("Critics");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testDLCTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("DLC");
       ITable expectedTable = expectedDataSet.getTable("DLC");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testDLCReleaseDatesTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("DLC_Release_Dates");
       ITable expectedTable = expectedDataSet.getTable("DLC_Release_Dates");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testEnginesTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Engines");
       ITable expectedTable = expectedDataSet.getTable("Engines");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testGameGenresTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Game_Genres");
       ITable expectedTable = expectedDataSet.getTable("Game_Genres");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testGameReleaseDateTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Game_Release_Date");
       ITable expectedTable = expectedDataSet.getTable("Game_Release_Date");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testGamesTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Games");
       ITable expectedTable = expectedDataSet.getTable("Games");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testMainCharactersTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Main_Characters");
       ITable expectedTable = expectedDataSet.getTable("Main_Characters");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testSideCharactersTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Side_Characters");
       ITable expectedTable = expectedDataSet.getTable("Side_Characters");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testPlatformsTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Platforms");
       ITable expectedTable = expectedDataSet.getTable("Platforms");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testRatingsTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Ratings");
       ITable expectedTable = expectedDataSet.getTable("Ratings");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testSeriesTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Series");
       ITable expectedTable = expectedDataSet.getTable("Series");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testWeaponsTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Weapons");
       ITable expectedTable = expectedDataSet.getTable("Weapons");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

   @Test
   public void testWorkersTable() throws Exception {

       ITable actualTable = actualDataSet.getTable("Workers");
       ITable expectedTable = expectedDataSet.getTable("Workers");
       ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actualTable,
    		   expectedTable.getTableMetaData().getColumns());

       assertEquals(expectedTable.getRowCount(), filteredTable.getRowCount());
   }

}
