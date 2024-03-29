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

public class WorkerEntryTest {

	WorkerEntry workerEntry = new WorkerEntry(-1, "first", "middle", "last", "bio");

	@Before
    public void setUp() throws Exception {}

    @After
    public void tearDown() throws Exception {
    	this.workerEntry = null;
    }


	@Test
	public void testWorkerEntry() {
		WorkerEntry newWorkerEntry = new WorkerEntry(100, "firstN", "middleN", "lastN", "bio1");

		assertNotNull(newWorkerEntry);
	}

	@Test
	public void testGetId() {
		assertFalse(workerEntry.getId()==0);
		assertTrue(workerEntry.getId()==-1);
	}

	@Test
	public void testSetId() {
		workerEntry.setId(10);
		assertTrue(workerEntry.getId()==10);
	}

	@Test
	public void testGetFirstName() {
		assertFalse(workerEntry.getFirstName().equals(""));
		assertTrue(workerEntry.getFirstName().equals("first"));
	}

	@Test
	public void testSetFirstName() {
		workerEntry.setFirstName("firstName");
		assertTrue(workerEntry.getFirstName().equals("firstName"));
	}

	@Test
	public void testGetMiddleName() {
		assertFalse(workerEntry.getMiddleName().equals(""));
		assertTrue(workerEntry.getMiddleName().equals("middle"));
	}

	@Test
	public void testSetMiddleName() {
		workerEntry.setMiddleName("middleName");
		assertTrue(workerEntry.getMiddleName().equals("middleName"));
	}

	@Test
	public void testGetLastName() {
		assertFalse(workerEntry.getLastName().equals(""));
		assertTrue(workerEntry.getLastName().equals("last"));
	}

	@Test
	public void testSetLastName() {
		workerEntry.setLastName("lastName");
		assertTrue(workerEntry.getLastName().equals("lastName"));
	}

	@Test
	public void testGetBio() {
		assertFalse(workerEntry.getBio().equals(""));
		assertTrue(workerEntry.getBio().equals("bio"));
	}

	@Test
	public void testSetBio() {
		workerEntry.setBio("new bio");
		assertTrue(workerEntry.getBio().equals("new bio"));
	}

	@Test
	public void testToString() {
		assertTrue(workerEntry.toString().contains("first"));
		assertTrue(workerEntry.toString().contains("middle"));
		assertTrue(workerEntry.toString().contains("last"));
		assertTrue(workerEntry.toString().contains("bio"));
	}

}
