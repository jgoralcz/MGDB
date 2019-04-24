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


import java.sql.DriverManager;

import org.dbunit.database.*;
import org.dbunit.dataset.*;
import org.dbunit.dataset.xml.*;

import java.sql.Connection;
import java.io.FileOutputStream;

public class DatabaseExport {

	public static void main(String[] args) throws Exception {
        // database connection
        Class driverClass = Class.forName("com.mysql.jdbc.Driver");
        Connection jdbcConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mygame_db?useSSL=false", "root", "Josh1997");
        IDatabaseConnection connection = new DatabaseConnection(jdbcConnection);

        // full database export
        IDataSet fullDataSet = connection.createDataSet();
        FlatXmlDataSet.write(fullDataSet, new FileOutputStream("full.xml"));

        jdbcConnection.close();
        connection.close();
    }
}
