package mgdb.site.controller;

import mgdb.site.handler.ActionHandler;
import mgdb.site.handler.CompaniesHandler;

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


public class CompaniesServlet extends HttpServlet {

	private static Logger log = Logger.getLogger(CompaniesHandler.class.getName());
    
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

		// which path this stuff is actually in
		System.out.println(this.getClass().getResource("/").getPath());

		// wrong method error
		handlers.put("wrongmethod", new ActionHandler() {
			@Override
			public String handleIt(HttpServletRequest req, HttpServletResponse resp) {
				req.setAttribute("error", "Unexpected error.");
				return "wrongmethod";
			}
		});

		handlers.put("/", new ActionHandler() {
			@Override
			public String handleIt(HttpServletRequest req, HttpServletResponse resp) {
				req.setAttribute("error", "Unexpected error.");
				return "/";
			}
		});

		// add to handler
		handlers.put("search", new CompaniesHandler());
		
		// pages too
		pageViews.put("/", "/index.html");
		pageViews.put("companiesHome", "/companies.html");
		pageViews.put("companies", "/companies.ftl");
		pageViews.put("wrongmethod", "/wrongmethod.ftl");
    }

	/**
	 * do the requested action
	 * @param request the request
	 * @param response the response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get session
    	HttpSession session = request.getSession();
		
		// if there are errors, set in case.
		request.setAttribute("error", "Page Action Error");
//		String forwardPage = errorPage;
		String forwardPage = pageViews.get("companiesHome");

		String action = request.getParameter("action");
		
		if (action != null && action.length() > 0) {
			// Forward to web application to page indicated by action
			ActionHandler handler = handlers.get(action);
			if (handler != null) {
				String result = handler.handleIt(request, response);

				System.out.println(result);

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

		System.out.println("Forward Page: " + forwardPage);

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
