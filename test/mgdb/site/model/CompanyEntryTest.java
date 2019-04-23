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

public class CompanyEntryTest {

	CompanyEntry mainCompanyEntry = new CompanyEntry(-1, "main name", "main description", 5);
	CompanyEntry blankCompanyEntry = new CompanyEntry();

	@Before
    public void setUp() throws Exception {}

    @After
    public void tearDown() throws Exception {
    	this.mainCompanyEntry = null;
    	this.blankCompanyEntry = null;
    }

    @Test
    public void testCompanyEntry() {
		assertNotNull(mainCompanyEntry);
		assertNotNull(blankCompanyEntry);
	}

	@Test
	public void testGetId() {
		assertTrue(mainCompanyEntry.getId()== -1);
		assertTrue(blankCompanyEntry.getId()== 0);
	}

	@Test
	public void testSetId() {
		mainCompanyEntry.setId(10);
		blankCompanyEntry.setId(20);
		assertTrue(mainCompanyEntry.getId()== 10);
		assertTrue(blankCompanyEntry.getId()== 20);
	}

	@Test
	public void testGetName() {
		assertFalse(mainCompanyEntry.getName().equals(""));
		assertTrue(mainCompanyEntry.getName().equals("main name"));
	}

	@Test
	public void testSetName() {
		mainCompanyEntry.setName("new main name");
		blankCompanyEntry.setName("new null name");
		assertTrue(mainCompanyEntry.getName().equals("new main name"));
		assertTrue(blankCompanyEntry.getName().equals("new null name"));
	}

	@Test
	public void testGetNumGames() {
		assertTrue(mainCompanyEntry.getNumGames()==5);
		assertTrue(blankCompanyEntry.getNumGames()==0);
	}

	@Test
	public void testSetNumGames() {
		mainCompanyEntry.setNumGames(15);
		blankCompanyEntry.setNumGames(10);
		assertTrue(mainCompanyEntry.getNumGames()==15);
		assertTrue(blankCompanyEntry.getNumGames()==10);
	}

	@Test
	public void testGetDescription() {
		assertFalse(mainCompanyEntry.getDescription().equals(""));
		assertTrue(mainCompanyEntry.getDescription().equals("main description"));
	}

	@Test
	public void testSetDescription() {
		mainCompanyEntry.setDescription("new main description");
		blankCompanyEntry.setDescription("new null description");
		assertTrue(mainCompanyEntry.getDescription().equals("new main description"));
		assertTrue(blankCompanyEntry.getDescription().equals("new null description"));
	}

	@Test
	public void testToString() {
		//id + "\n" + name + "\n" + description + "\n"
		assertTrue(mainCompanyEntry.toString().contains("-1"));
		assertTrue(mainCompanyEntry.toString().contains("main name"));
		assertTrue(mainCompanyEntry.toString().contains("main description"));

	}

}
