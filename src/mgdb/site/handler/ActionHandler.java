package mgdb.site.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ActionHandler {

	String handleIt(HttpServletRequest req, HttpServletResponse resp);
	
}
