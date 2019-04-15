package mgdb.site.handler;

import mgdb.site.controller.ControllerServlet;
//import mgdb.site.model.PhoneBook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;

import mgdb.site.model.GameEntry;
import mgdb.site.service.impl.RDBMSiteServiceImpl;

// get out database info

public class GameHandler implements ActionHandler {

	private RDBMSiteServiceImpl site = ControllerServlet.rdbm;

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

					ArrayList<GameEntry> gameEntries = getGamesBySeriesTitle



					String[] entries = _pbook.listEntries();
					
					ArrayList<String> allEntries = new ArrayList<String>(Arrays.asList(entries));
					allEntries.add("\nSQL\n");
					
					//get all from database, this will be printed out using
					Map<String, PhoneVO> mp = DAOMockBizLayer.getEntries();
					PhoneVO phone = null;
					Iterator it = mp.entrySet().iterator();
				    while (it.hasNext()) {
				        Map.Entry pair = (Map.Entry)it.next();
				        System.out.println(pair.getKey() + " = " + pair.getValue());
				        
				        phone = (PhoneVO) pair.getValue();
				        allEntries.add(phone.getFirstName()+"\n"+phone.getLastName()+"\n"+phone.getPhone());
				        it.remove();
				    }
				    entries = allEntries.toArray(new String[allEntries.size()]);
					
					req.setAttribute("entries", entries);
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

		return "phone";
	}
}
