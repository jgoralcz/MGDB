package mgdb.site.model;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.jupiter.api.Test;

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


class SeriesEntryTest {
	
	Date date = new Date(2001, 04, 13);
	SeriesEntry seriesEntry = new SeriesEntry(-1, "name", date, "description", "imageURL");
	
	@Before 
    public void setUp() throws Exception {}
    
    @After
    public void tearDown() throws Exception {
    	this.seriesEntry = null;
    }
    

	@Test
	void testSeriesEntry() {
		Date newDate = new Date(2001, 04, 13);
		SeriesEntry testSeriesEntry = new SeriesEntry(-1, "name", newDate, "description", "imageURL");
	
		assertNotNull(testSeriesEntry);
	}

	@Test
	void testGetId() {
		assertFalse(seriesEntry.getId()==0);
		assertTrue(seriesEntry.getId()==-1);
	}

	@Test
	void testSetId() {
		seriesEntry.setId(10);
		
		assertTrue(seriesEntry.getId()==10);
	}

	@Test
	void testGetName() {
		assertFalse(seriesEntry.getName().equals(""));
		assertTrue(seriesEntry.getName().equals("name"));
	}

	@Test
	void testSetName() {
		seriesEntry.setName("new name");
		
		assertTrue(seriesEntry.getName().equals("new name"));
	}

	@Test
	void testGetReleaseDate() {
		Date matchDate = new Date(2001, 04, 13);
		
		assertTrue(seriesEntry.getReleaseDate().equals(matchDate));
	}

	@Test
	void testSetReleaseDate() {
		Date matchDate = new Date(1994, 07, 18);
		seriesEntry.setReleaseDate(matchDate);
		
		assertTrue(seriesEntry.getReleaseDate().equals(matchDate));
	}

	@Test
	void testGetDescription() {
		assertFalse(seriesEntry.getDescription().equals(""));
		assertTrue(seriesEntry.getDescription().equals("description"));
	}

	@Test
	void testSetDescription() {
		seriesEntry.setDescription("new description");
		
		assertTrue(seriesEntry.getDescription().equals("new description"));
	}

	@Test
	void testGetImageURL() {
		assertFalse(seriesEntry.getImageURL().equals(""));
		assertTrue(seriesEntry.getImageURL().equals("imageURL"));
	}

	@Test
	void testSetImageURL() {
		seriesEntry.setImageURL("newImageURL");
		
		assertTrue(seriesEntry.getImageURL().equals("newImageURL"));
	}

	@Test
	void testToString() {
		assertTrue(seriesEntry.toString().contains("name"));
		assertTrue(seriesEntry.toString().contains("description"));
	}

}
