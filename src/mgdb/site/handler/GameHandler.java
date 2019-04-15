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
			if ("POST".equals(req.getMethod())) {

				// check for action
				String action = req.getParameter("Action");
				if (action == null || action.length() == 0) {
					req.setAttribute("error", "No action provided");
					return "wrongmethod";
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

				// list
				else if (action.equals("games")) {
					String gameAll = req.getParameter("all");

					if(!gameAll.equals("")) {

						// get game entries
						ArrayList<GameEntry> gameEntries = site.getAllInformationOnGame(gameAll);
						ArrayList<String> entries = new ArrayList<>();
						ArrayList<String> images = new ArrayList<>();

						String add = "";
						String image = "";
						for (GameEntry ge : gameEntries) {
							// output = g.english_name, g.description, g.image, s.name, s.description, e.name, e.description, c.name, c.description
							add = "Series: " + ge.getSeries().getName() + "\n" + ge.getSeries().getDescription() +
									"Game: " + ge.getEnglishName() + "\n" + ge.getDescription() +
									"Engine: " + ge.getEngine().getName() + "\n" + ge.getEngine().getDescription() +
									"Company: " + ge.getCompany().getName() + "\n" + ge.getCompany().getName();
							image = ge.getImageURL();

							// get the contents out and display
							entries.add(add);
							images.add(image);
						}

						String[] entriesStr = entries.toArray(new String[0]);
						String[] imagesStr = images.toArray(new String[0]);
						req.setAttribute("images", imagesStr);
						req.setAttribute("entries", entriesStr);
					}
				}

				// get series info
				else if(action.equals("series")) {
					String gameTitle = req.getParameter("title");

					if(!gameTitle.equals("")) {
						// get game entries
						ArrayList<GameEntry> gameEntries = site.getGamesBySeriesTitle(gameTitle);
						ArrayList<String> entries = new ArrayList<>();

						String add = "";
						for (GameEntry ge : gameEntries) {
							add = ge.getSeries().getName() + ": " + ge.getEnglishName() + "\n" + ge.getSeries().getDescription();
							// get the contents out and display
							entries.add(add);
						}

						String[] entriesStr = entries.toArray(new String[0]);
						req.setAttribute("entries", entriesStr);
					}
				}

				else if(action.equals("workers")) {


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

		return "game";
	}
}
