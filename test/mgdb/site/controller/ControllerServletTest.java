package mgdb.site.controller;

import static org.junit.Assert.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.After;
import org.junit.Before;
import org.junit.jupiter.api.Test;
import static org.hamcrest.CoreMatchers.*;

class ControllerServletTest {
	ControllerServlet servlet;

	
	@Before
    public void setUp() throws Exception {
		servlet = new ControllerServlet();
    }
    
    @After
    public void tearDown() throws Exception {
    	servlet.destroy();
    }

	@Test
	void testInitServletConfig() {
		ControllerServlet servlet = new ControllerServlet();
		assertThat(servlet, is(notNullValue()));
	}

	@Test
	void testDoPostHttpServletRequestHttpServletResponse() {
		assertTrue(true); // TODO
	}

	@Test
	void testDoGetHttpServletRequestHttpServletResponse() {
		assertTrue(true); // TODO
	}

}
