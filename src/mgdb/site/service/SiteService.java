package mgdb.site.service;

import mgdb.site.model.CompanyEntry;
import mgdb.site.model.GameEntry;
import mgdb.site.model.WorkerEntry;
import mgdb.site.model.SeriesEntry;

import java.util.ArrayList;

// we'll build on this later
public interface SiteService {

    ArrayList<GameEntry> getGamesBySeriesTitle(String seriesTitle);

    ArrayList<GameEntry> getMatchingGameList(String word);

    ArrayList<CompanyEntry> getGamesByCompanyName(String companyName);

    ArrayList<GameEntry> getCompaniesByGameTitle(String gameTitle);

    ArrayList<GameEntry> getAllInformationOnGame(String gameTitle);

    ArrayList<WorkerEntry> getAllWorkersByGameID(String gameID);

    ArrayList<GameEntry> getAllMainCharactersByGameID(String gameID);

    ArrayList<SeriesEntry> getAllSeriesInfo(String id);

}
