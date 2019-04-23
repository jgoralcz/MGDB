package mgdb.site.model;

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

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.Date;

public class GameEntryTest {

	Date date = new Date(2001, 04, 13);
	Engine engine = new Engine(-1, "name", "description", date, "imageURL");
	SeriesEntry series = new SeriesEntry(-1, "name", date, "description", "imageURL");
	CompanyEntry company = new CompanyEntry(-1, "main name", "main description", 5);
	GameEntry gameEntry = new GameEntry(-1, "description", "english name", "other name", "imageURL", engine, series, company);

	@Before
    public void setUp() throws Exception {}

    @After
    public void tearDown() throws Exception {
    	this.gameEntry = null;
    }


	@Test
	public void testGameEntry() {
		GameEntry testGameEntry = new GameEntry(10, "description", "english name", "other name", "imageURL", engine, series, company);
		assertNotNull(testGameEntry);
	}

	@Test
	public void testToString() {
		//description + "\n" + englishName + "\n" + otherName + "\n" + imageURL + "\n" + engine.toString() + "\n" + series + "\n" + company.toString(); }
		assertTrue(gameEntry.toString().contains("english name"));
		assertTrue(gameEntry.toString().contains("other name"));
		assertTrue(gameEntry.toString().contains("imageURL"));
	}

}
