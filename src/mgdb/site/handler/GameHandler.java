package mgdb.site.handler;

import mgdb.site.model.GameEntry;
import mgdb.site.service.SiteService;
import mgdb.site.service.SiteServiceFactory;
import mgdb.site.model.CompanyEntry;
import mgdb.site.model.WorkerEntry;
import mgdb.site.model.CharacterEntry;

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
				System.out.println("request URI: " + req.getRequestURI());
				System.out.println("request URL: " + req.getRequestURL());
				String action = req.getParameter("action");
				if (action == null || action.length() == 0) {
					req.setAttribute("error", "No action provided");
					System.out.println("HIIIII!!");
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
					String gameList = req.getParameter("list");
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

					// quick list of results, nothing too heavy
					else if(!gameList.equals("")) {

						// get our entries
						ArrayList<GameEntry> gameEntries = site.getMatchingGameList(gameList);
						ArrayList<String> entries = new ArrayList<>();

						String add = "";

						for (GameEntry ge : gameEntries) {
							add = "Series: " + ge.getSeries().getName() + "\n" + ge.getSeries().getReleaseDate().toString() + "\n" +
									"Game: " + ge.getEnglishName() + " - " + ge.getOtherName() + "\n" + ge.getDescription();
							entries.add(add);
						}

						String[] entriesStr = entries.toArray(new String[0]);
						req.setAttribute("entries", entriesStr);
					}

					return "games";
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

					return "series";
				}

				else if(action.equals("workers")) {
					String gameTitle = req.getParameter("name");


					if (!gameTitle.equals("")) {

						ArrayList<WorkerEntry> workerEntries = site.getAllWorkersByGameName(gameTitle);

						// get name of workers
						ArrayList<String> entries = new ArrayList<>();

						String add = "";
						for (WorkerEntry we : workerEntries) {
							add = we.getFirstName() + " " + we.getLastName();

							// get the contents out to display
							entries.add(add);
						}

						String[] entriesStr = entries.toArray(new String[0]);
						req.setAttribute("entries", entriesStr);
					}

					return "workers";
				}
				else if(action.equals("companies")) {
					String gameTitle = req.getParameter("game");
					String gameCompTitle = req.getParameter("company");


					if (!gameTitle.equals("")) {

						ArrayList<GameEntry> gameEntries = site.getCompaniesByGameTitle(gameTitle);

						// get name of workers
						ArrayList<String> entries = new ArrayList<>();

						String add = "";
						for (GameEntry ge : gameEntries) {
							add = ge.getCompany().getName() + ": " + ge.getEnglishName();

							// get the contents out to display
							entries.add(add);
						}

						String[] entriesStr = entries.toArray(new String[0]);
						req.setAttribute("entries", entriesStr);

					}
					else if (!gameCompTitle.equals("")) {
						ArrayList<CompanyEntry> companyEntries = site.getGamesByCompanyName(gameCompTitle);

						// get name of workers
						ArrayList<String> entries = new ArrayList<>();

						String add = "";
						for (CompanyEntry ce : companyEntries) {
							add = ce.getName() + ": " + ce.getNumGames();

							// get the contents out to display
							entries.add(add);
						}

						String[] entriesStr = entries.toArray(new String[0]);
						req.setAttribute("entries", entriesStr);

					}

					return "companies";
				}
				else if(action.equals("characters")) {
					String gameTitle = req.getParameter("game");

					if (!gameTitle.equals("")) {

						ArrayList<CharacterEntry> characterEntries = site.getAllMainCharactersByGameName(gameTitle);

						// get name of workers
						ArrayList<String> entries = new ArrayList<>();

						String add = "";
						for (CharacterEntry ce : characterEntries) {
							add = ce.getName() + "\n" + ce.getDescription();
							// get the contents out to display
							entries.add(add);
						}

						String[] entriesStr = entries.toArray(new String[0]);
						req.setAttribute("entries", entriesStr);
					}

					return "characters";
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
}
