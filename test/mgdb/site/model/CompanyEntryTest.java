package mgdb.site.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.After;
import org.junit.Before;
import org.junit.jupiter.api.Test;

class CompanyEntryTest {
	
	CompanyEntry mainCompanyEntry = new CompanyEntry(-1, "main name", "main description", 5);
	CompanyEntry nullCompanyEntry = new CompanyEntry();

	@Before 
    public void setUp() throws Exception {}
    
    @After
    public void tearDown() throws Exception {
    	this.mainCompanyEntry = null;
    	this.nullCompanyEntry = null;
    }

    
	@Test
	void testGetId() {
		assertTrue(mainCompanyEntry.getId()== -1);
		assertTrue(nullCompanyEntry.getId()== 0);
	}

	@Test
	void testSetId() {
		mainCompanyEntry.setId(10);
		nullCompanyEntry.setId(20);
		assertTrue(mainCompanyEntry.getId()== 10);
		assertTrue(nullCompanyEntry.getId()== 20);
	}

	@Test
	void testGetName() {
		assertFalse(mainCompanyEntry.getName().equals(""));
		assertTrue(mainCompanyEntry.getName().equals("main name"));
	}

	@Test
	void testSetName() {
		mainCompanyEntry.setName("new main name");
		nullCompanyEntry.setName("new null name");
		assertTrue(mainCompanyEntry.getName().equals("new main name"));
		assertTrue(nullCompanyEntry.getName().equals("new null name"));
	}

	@Test
	void testGetNumGames() {
		assertTrue(mainCompanyEntry.getNumGames()==5);
		assertTrue(nullCompanyEntry.getNumGames()==0);
	}
	
	@Test
	void testSetNumGames() {
		mainCompanyEntry.setNumGames(15);
		nullCompanyEntry.setNumGames(10);
		assertTrue(mainCompanyEntry.getNumGames()==15);
		assertTrue(nullCompanyEntry.getNumGames()==10);
	}

	@Test
	void testGetDescription() {
		assertFalse(mainCompanyEntry.getDescription().equals(""));
		assertTrue(mainCompanyEntry.getDescription().equals("main description"));
	}

	@Test
	void testSetDescription() {
		mainCompanyEntry.setDescription("new main description");
		nullCompanyEntry.setDescription("new null description");
		assertTrue(mainCompanyEntry.getDescription().equals("new main description"));
		assertTrue(nullCompanyEntry.getDescription().equals("new null description"));
	}

	@Test
	void testToString() {
		//id + "\n" + name + "\n" + description + "\n"
		assertTrue(mainCompanyEntry.toString().contains("-1"));
		assertTrue(mainCompanyEntry.toString().contains("main name"));
		assertTrue(mainCompanyEntry.toString().contains("main description"));

	}

}
