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

import java.sql.Date;

public class EngineTest {
	Date date = new Date(2001, 04, 13);

	Engine engine = new Engine(-1, "name", "description", date, "imageURL");
	Engine blankEngine = new Engine();

	@Before
    public void setUp() throws Exception {}

    @After
    public void tearDown() throws Exception {
    	this.engine = null;
    	this.blankEngine = null;
    }


	@Test
	public void testEngineIntStringStringDateString() {
		Date newDate = new Date(2000, 01, 15);

		Engine engineTest = new Engine(-1, "name", "description", newDate, "imageURL");
		assertNotNull(engineTest);
	}

	@Test
	public void testEngine() {
		Engine blankEngineTest = new Engine();
		assertNotNull(blankEngineTest);
	}

	@Test
	public void testGetId() {
		assertFalse(engine.getId()==0);
		assertTrue(engine.getId()==-1);
	}

	@Test
	public void testSetId() {
		engine.setId(10);
		blankEngine.setId(20);
		assertFalse(blankEngine.getId() == 0);
		assertTrue(engine.getId() == 10);
		assertTrue(blankEngine.getId() == 20);
	}

	@Test
	public void testGetName() {
		assertFalse(engine.getName().equals(""));
		assertTrue(engine.getName().equals("name"));
	}

	@Test
	public void testSetName() {
		engine.setName("new name");
		blankEngine.setName("new blank name");
		assertTrue(engine.getName().equals("new name"));
		assertTrue(blankEngine.getName().equals("new blank name"));
	}

	@Test
	public void testGetDescription() {
		assertFalse(engine.getDescription().equals(""));
		assertTrue(engine.getDescription().equals("description"));
	}

	@Test
	public void testSetDescription() {
		engine.setDescription("new description");
		blankEngine.setDescription("new blank description");
		assertTrue(engine.getDescription().equals("new description"));
		assertTrue(blankEngine.getDescription().equals("new blank description"));
	}

	@Test
	public void testGetDate() {
		Date matchDate = new Date(2001, 04, 13);
		assertTrue(engine.getDate().equals(matchDate));
	}

	@Test
	public void testSetDate() {
		Date newDate = new Date(1994, 07, 18);
		engine.setDate(newDate);
		assertTrue(engine.getDate().equals(newDate));
	}

	@Test
	public void testGetImageURL() {
		assertFalse(engine.getImageURL().equals(""));
		assertTrue(engine.getImageURL().equals("imageURL"));
	}

	@Test
	public void testSetImageURL() {
		engine.setImageURL("newImageURL");
		blankEngine.setImageURL("newBlankImageURL");
		assertTrue(engine.getImageURL().equals("newImageURL"));
		assertTrue(blankEngine.getImageURL().equals("newBlankImageURL"));
	}

	@Test
	public void testToString() {
		assertTrue(engine.toString().contains("-1"));
		assertTrue(engine.toString().contains("name"));
		assertTrue(engine.toString().contains("description"));
		assertTrue(engine.toString().contains("3901-05-13"));
		assertTrue(engine.toString().contains("imageURL"));
	}

}
