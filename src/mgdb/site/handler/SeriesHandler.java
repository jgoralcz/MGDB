package mgdb.site.handler;

import mgdb.site.model.GameEntry;
import mgdb.site.service.SiteService;
import mgdb.site.service.SiteServiceFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

// get out database info

public class SeriesHandler implements ActionHandler {

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
				if (action == null || action.length() == 0 || action2 == null || action2.length() == 0) {
					// redirect them back home.
					req.setAttribute("error", "No action provided");
					return "/";
				}

				// add a new game
				else if (action.equals("add")) {

					// get all of our data
					String seriesName = req.getParameter("name");
					String description = req.getParameter("description");
					String image = req.getParameter("image");

					Integer seriesKey = site.insertSeries(seriesName, null, description, image);

					req.setAttribute("add", "Added the new series.");

					return "series";
				}

				// get series info
				else if(action.equals("search")) {

					if(action2.equals("search")) {
						// get game entries
						ArrayList<GameEntry> gameEntries = site.getGamesBySeriesTitle(search);
						ArrayList<String> entries = new ArrayList<>();

						String add = "";
						for (GameEntry ge : gameEntries) {
							add = "Series: " + ge.getSeries().getName() + "\n Game: " + ge.getEnglishName() + "\n" + ge.getSeries().getDescription();
							// get the contents out and display
							entries.add(add);
						}

						String[] entriesStr = entriesNone(entries);
						req.setAttribute("entries", entriesStr);
					}

					return "series";
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

		return "series";
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
