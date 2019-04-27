package mgdb.site.handler;

import mgdb.site.model.GameEntry;
import mgdb.site.service.SiteService;
import mgdb.site.service.SiteServiceFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

// get out database info

public class GameHandler implements ActionHandler {

	private SiteService site = SiteServiceFactory.getInstance();

	public String handleIt(HttpServletRequest req, HttpServletResponse resp) {
		try {

			// verify correct method
			if ("POST".equals(req.getMethod()) || "GET".equals(req.getMethod())) {

				// check for action
				String action = req.getParameter("action");
				String action2 = req.getParameter("Action");
				String search = req.getParameter("search");

				System.out.println("actions: " + action + " " + action2 + " " + search);
				if (action == null || action.length() == 0 || action2 == null || action2.length() == 0) {
					// redirect them back home.
					req.setAttribute("error", "No action provided");
					return "/";
				}


				// add a new game
				else if (action.equals("add")) {
					System.out.println("hi");

					// get all of our data
					String englishName = req.getParameter("english_name");
					String otherName = req.getParameter("other_name");
					String gameDescription = req.getParameter("game_description");
					String gameImage = req.getParameter("image");

					// series
					String seriesName = req.getParameter("series_name");

					// engine
					String engineName = req.getParameter("english_name");

					// Platform
					String platformName = req.getParameter("platform_name");
					// create game

					// notice: while I could put it into a transaction, it doesn't really matter in my opinion.
					// the whole point of the site is to add as much details as we possibly can. That's it.

					System.out.println(site.insertSeries(seriesName, null, null, null));

					System.out.println(site.insertEngine(engineName, null, null, null));

//					site.insertPlatform(platformName, null, null, null);

//					site.insertGame(engineID, seriesID, englishName, otherName, gameDescription, gameImage);

					req.setAttribute("add", "Added the new game.");

					return "games";
				}

				// list
				else if (action.equals("search")) {

//					if(action2.equals("search")) {

						// get game entries
						ArrayList<GameEntry> gameEntries = site.getAllInformationOnGame(search);
						ArrayList<String> entries = new ArrayList<>();
						ArrayList<String> images = new ArrayList<>();

						String add = "";
						String image = "";
						for (GameEntry ge : gameEntries) {
							// output = g.english_name, g.description, g.image, s.name, s.description, e.name, e.description, c.name, c.description
							add = "Series: " + ge.getSeries().getName() + "\n" + ge.getSeries().getDescription() +
									"\nGame: " + ge.getEnglishName() + "\n" + ge.getDescription() +
									"\nEngine: " + ge.getEngine().getName() + "\n" + ge.getEngine().getDescription() +
									"\nCompany: " + ge.getCompany().getName() + "\n" + ge.getCompany().getName();
							image = ge.getImageURL();

							// get the contents out and display
							entries.add(add);
							images.add(image);
						}

						String[] entriesStr = entriesNone(entries);
						String[] imagesStr = entriesNone(images);
						req.setAttribute("images", imagesStr);
						req.setAttribute("entries", entriesStr);
//					}

					return "games";
				}

			} else {
				resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
				req.setAttribute("error", "Get not supported by this servlet.");
				return "wrongmethod";
			}
		} catch (Exception e) {
			e.printStackTrace();

			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return "wrongmethod";
		}

		return "games";
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
