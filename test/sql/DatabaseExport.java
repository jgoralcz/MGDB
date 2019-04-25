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
import org.dbunit.database.DatabaseConfig;
import org.dbunit.database.QueryDataSet;

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

import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatDtdDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.ext.mysql.MySqlConnection;
import org.dbunit.ext.mysql.MySqlDataTypeFactory;
import org.dbunit.ext.oracle.OracleDataTypeFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.io.FileOutputStream;

public class DatabaseExport {
	
	private static String URL = "jdbc:mysql://localhost:3306/mygame_db?useSSL=false";
	private static String USERNAME = "root";
	private static String PASSWORD = "YOUR PASSWORD"; // TODO Change to YOUR SQL db password

	public static void main(String[] args) throws Exception {
        // database connection
        Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        MySqlConnection sqlConnection = new MySqlConnection(connection, connection.getSchema());

        // full database export
        IDataSet fullDataSet = sqlConnection.createDataSet(); // Does not allow for any NULL values
        MySqlDataTypeFactory type = new MySqlDataTypeFactory();
        FlatXmlDataSet.write(fullDataSet, new FileOutputStream("gameData.xml"));
        
        // write DTD file
        FlatDtdDataSet.write(sqlConnection.createDataSet(), new FileOutputStream("gameSchema.dtd"));
        
        sqlConnection.close();
        connection.close();
    }
	
}
