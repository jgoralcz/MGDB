package mgdb.site.service;

import mgdb.site.model.CompanyEntry;
import mgdb.site.model.GameEntry;
import mgdb.site.model.WorkerEntry;
import mgdb.site.model.SeriesEntry;
import mgdb.site.model.CharacterEntry;

import java.util.ArrayList;

// we'll build on this later
public interface SiteService {

    ArrayList<GameEntry> getGamesBySeriesTitle(String seriesTitle);

    ArrayList<GameEntry> getMatchingGameList(String word);

    ArrayList<CompanyEntry> getGamesByCompanyName(String companyName);

    ArrayList<GameEntry> getCompaniesByGameTitle(String gameTitle);

    ArrayList<GameEntry> getAllInformationOnGame(String gameTitle);

    ArrayList<WorkerEntry> getAllWorkersByGameName(String gameTitle);

    ArrayList<CharacterEntry> getAllMainCharactersByGameName(String gameTitle);

    ArrayList<SeriesEntry> getAllSeriesInfo(String id);

    Integer insertGame(int engineID, int seriesID, String englishName, String otherName, String gameDescription, String image);

    Integer insertSeries(String seriesName, String date, String description, String image);

    Integer insertEngine(String engineName, String date, String description, String image);

    Integer insertPlatform(String platformName, String date, String description, String image);

}
