package mgdb.site.controller;

import mgdb.site.handler.ActionHandler;
import mgdb.site.handler.GameHandler;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;


public class ControllerServlet extends HttpServlet {

	private static Logger log = Logger.getLogger(GameHandler.class.getName());
    
    private static final long serialVersionUID = 1L;
    private static String errorPage = "wrongmethod.ftl";
    private static Map<String, ActionHandler> handlers = new HashMap<>();
    private static Map<String, String> pageViews = new HashMap<>();
    
    
    /**
     * read in file and get login
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
		// if you forget this your getServletContext() will get a NPE! 
		super.init(config);

//		which path this stuff is actually in
//		System.out.println(this.getClass().getResource("/").getPath());


		// normally we read this in from a config file
		handlers.put("/", new ActionHandler() {
			@Override
			public String handleIt(HttpServletRequest req, HttpServletResponse resp) {
				req.setAttribute("error", "Unexpected error.");
				return "/";
			}
		});


		handlers.put("games", new ActionHandler() {
			@Override
			public String handleIt(HttpServletRequest req, HttpServletResponse resp) {
				req.setAttribute("error", "Unexpected error.");
				return "games";
			}
		});

		handlers.put("series", new ActionHandler() {
			@Override
			public String handleIt(HttpServletRequest req, HttpServletResponse resp) {
				req.setAttribute("error", "Unexpected error.");
				return "series";
			}
		});


		handlers.put("workers", new ActionHandler() {
			@Override
			public String handleIt(HttpServletRequest req, HttpServletResponse resp) {
				req.setAttribute("error", "Unexpected error.");
				return "workers";
			}
		});


		handlers.put("wrongmethod", new ActionHandler() {
			@Override
			public String handleIt(HttpServletRequest req, HttpServletResponse resp) {
				req.setAttribute("error", "Unexpected error.");
				return "wrongmethod";
			}
		});

		handlers.put("phone", new GameHandler());
		
		// pages too
		pageViews.put("/", "/index.html");
		pageViews.put("games", "/games.ftl");
		pageViews.put("series", "/series.html");
		pageViews.put("workers", "/workers.html");
		pageViews.put("wrongmethod", "/wrongmethod.ftl");
    }
    
    private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get session
    	HttpSession session = request.getSession();
		
		// if there are errors, set in case.
		request.setAttribute("error", "Page Action Error");
		String forwardPage = errorPage;

		String action = request.getParameter("action");

		// print out our action for debuggin
		System.out.println(action);
		
		
		if (action != null && action.length() > 0) {
			// Forward to web application to page indicated by action
			ActionHandler handler = handlers.get(action);
			if (handler != null) {
				String result = handler.handleIt(request, response);
				
				if (result != null && result.length() > 0) {
					System.out.println("result: " + result);
					forwardPage = pageViews.get(result);
				}
				
				if (forwardPage == null || forwardPage.length() == 0) {
					request.setAttribute("error", "Page Action Error");
					forwardPage = errorPage;
				}
			}
		}

		// use our dispatcher to forward the request.
		request.getRequestDispatcher(forwardPage).forward(request, response);
    }

    /**
     * Handle forms
     *
     * @param request HTTP Request object
     * @param response HTTP Response object
     *
     * @throws ServletException
     * @throws IOException
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// A more intelligent framework would do something more intelligent!
    	doAction(request, response);
    }

    /**
     *
     * @param request HTTP Request object
     * @param response HTTP Response object
     *
     * @throws ServletException
     * @throws IOException
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// A more intelligent framework would do something more intelligent!
    	doAction(request, response);
    }
}
