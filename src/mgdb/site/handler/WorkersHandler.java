package mgdb.site.handler;

import mgdb.site.model.WorkerEntry;
import mgdb.site.service.SiteService;
import mgdb.site.service.SiteServiceFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

// get out database info

public class WorkersHandler implements ActionHandler {

	private SiteService site = SiteServiceFactory.getInstance();

	public String handleIt(HttpServletRequest req, HttpServletResponse resp) {
		try {

			// verify correct method
			if ("POST".equals(req.getMethod()) || "GET".equals(req.getMethod())) {

				// check for action
				String action = req.getParameter("action");
				String action2 = req.getParameter("Action");
				String search = req.getParameter("search");

				System.out.println(action + " " + action2 + " " + search);
				if (action == null || action.length() == 0 || action2 == null || action2.length() == 0 || search == null || search.length() == 0) {
					// redirect them back home.
					req.setAttribute("error", "No action provided");
					return "/";
				}

				// add a new game
				// for the purpose of our assignment, we will not be adding a game.
//				if (action.equals("Add")) {
//					String fName = req.getParameter("title");
//
//					// create game
//					PhoneVO phoneVO = DAOMockBizLayer.createGame(title);
//					// inserts if it's not found
//					DAOMockBizLayer.insert(phoneVO);
//
//					req.setAttribute("add", "Added the new game.");
//				}

				// get series info
				else if(action.equals("search")) {

					if (action2.equals("search")) {

						ArrayList<WorkerEntry> workerEntries = site.getAllWorkersByGameName(search);

						// get name of workers
						ArrayList<String> entries = new ArrayList<>();

						String add = "";
						for (WorkerEntry we : workerEntries) {
							add = we.getFirstName() + " " + we.getLastName();

							// get the contents out to display
							entries.add(add);
						}

						String[] entriesStr = entriesNone(entries);
						req.setAttribute("entries", entriesStr);
					}

					return "workers";
				}
			} else {
				resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
				req.setAttribute("error", "not supported by this servlet.");
				return "wrongmethod";
			}
		} catch (Exception e) {
			e.printStackTrace();

			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return "wrongmethod";
		}

		return "/";
	}

	// if entries array is empty, say none.
	private String[] entriesNone(ArrayList<String> entries) {

		String[] entriesStr = entries.toArray(new String[0]);
		if(entriesStr.length <= 0) {
			entriesStr = new String[1];
			entriesStr[0] = "none";
		}

		return entriesStr;

	}
}
