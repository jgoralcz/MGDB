package mgdb.site.service.impl;

import mgdb.site.service.SiteService;

import mgdb.site.model.CompanyEntry;
import mgdb.site.model.GameEntry;
import mgdb.site.model.SeriesEntry;
import mgdb.site.model.WorkerEntry;
import mgdb.site.model.Engine;

import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

//A simple impl of interface PhoneBookService
public class RDBMSiteServiceImpl implements SiteService {
	private static Properties __dbProperties;
	private static String __jdbcUrl;
	private static String __jdbcUser;
	private static String __jdbcPasswd;
	private static String __jdbcDriver;
	
	private Connection getConnection() throws Exception {
		try {
			Class.forName(__jdbcDriver);
			return DriverManager.getConnection(__jdbcUrl, __jdbcUser, __jdbcPasswd);
		} catch (Exception exc) {
			throw exc;
		}
	}

	// Only instantiated by factory within package scope
	public RDBMSiteServiceImpl() {

	}

	// This class is going to look for a file named rdbm.properties in the classpath
	// to get its initial settings
	static {
		try {
			__dbProperties = new Properties();
			__dbProperties.load(mgdb.site.service.impl.RDBMSiteServiceImpl.class.getClassLoader().getResourceAsStream("rdbm.properties"));
			__jdbcUrl    = __dbProperties.getProperty("jdbcUrl");
			__jdbcUser   = __dbProperties.getProperty("jdbcUser");
			__jdbcPasswd = __dbProperties.getProperty("jdbcPasswd");
			__jdbcDriver = __dbProperties.getProperty("jdbcDriver");
		} catch (Throwable t) {
			t.printStackTrace();
		}
	}

	@Override
	public ArrayList<GameEntry> getGamesBySeriesTitle(String seriesTitle) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<GameEntry> rval = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(__dbProperties.getProperty("sql.getGamesBySeriesTitle"));
			stmt.setString(1, seriesTitle);
			rs = stmt.executeQuery();
			while (rs.next()) {
				rval.add(new GameEntry(-1, null, rs.getString(3), null, null, null,
						new SeriesEntry(-1, rs.getString(2), null, rs.getString(1), null),
						null));
			}
		} catch (Exception sqe) {
			sqe.printStackTrace();
			rval = null;
		} finally {  // why nest all of these try/finally blocks?
			try {
				rs.close();
				if (stmt != null) { stmt.close(); }
			} catch (Exception e2) { e2.printStackTrace(); }
			finally {
				try {
					if (conn != null) { conn.close(); }
				} catch (Exception e3) { e3.printStackTrace(); }
			}
		}
		return rval;
	}

	@Override
	public ArrayList<GameEntry> getMatchingGameList(String word) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<GameEntry> rval = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(__dbProperties.getProperty("sql.getMatchingGameList"));
			stmt.setString(1, word);
			stmt.setString(2, word);
			rs = stmt.executeQuery();
			while (rs.next()) {
				rval.add(new GameEntry(-1, rs.getString(3), rs.getString(1), rs.getString(1), rs.getString(4),
						null,
						 new SeriesEntry(-1, rs.getString(4), rs.getDate(5), null, null),
						null));
			}
		} catch (Exception sqe) {
			sqe.printStackTrace();
			rval = null;
		} finally {  // why nest all of these try/finally blocks?
			try {
				rs.close();
				if (stmt != null) { stmt.close(); }
			} catch (Exception e2) { e2.printStackTrace(); }
			finally {
				try {
					if (conn != null) { conn.close(); }
				} catch (Exception e3) { e3.printStackTrace(); }
			}
		}
		return rval;
	}

	@Override
	public ArrayList<CompanyEntry> getGamesByCompanyName(String companyName) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<CompanyEntry> rval = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(__dbProperties.getProperty("sql.getGamesByCompanyName"));
			stmt.setString(1, companyName);
			stmt.setInt(2, 0);
			rs = stmt.executeQuery();
			while (rs.next()) {
				rval.add(new CompanyEntry(-1, rs.getString(1), null, rs.getInt(2)));
			}
		} catch (Exception sqe) {
			sqe.printStackTrace();
			rval = null;
		} finally {  // why nest all of these try/finally blocks?
			try {
				rs.close();
				if (stmt != null) { stmt.close(); }
			} catch (Exception e2) { e2.printStackTrace(); }
			finally {
				try {
					if (conn != null) { conn.close(); }
				} catch (Exception e3) { e3.printStackTrace(); }
			}
		}
		return rval;
	}

	@Override
	public ArrayList<GameEntry> getCompaniesByGameTitle(String gameTitle) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<GameEntry> rval = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(__dbProperties.getProperty("sql.getCompaniesByGameName"));
			stmt.setString(1, gameTitle);
			rs = stmt.executeQuery();
			while (rs.next()) {
				rval.add(new GameEntry(-1, null, rs.getString(1), null, null, null, null,
						new CompanyEntry(-1, rs.getString(2), null, -1)));
			}
		} catch (Exception sqe) {
			sqe.printStackTrace();
			rval = null;
		} finally {  // why nest all of these try/finally blocks?
			try {
				rs.close();
				if (stmt != null) { stmt.close(); }
			} catch (Exception e2) { e2.printStackTrace(); }
			finally {
				try {
					if (conn != null) { conn.close(); }
				} catch (Exception e3) { e3.printStackTrace(); }
			}
		}
		return rval;
	}

	@Override
	public ArrayList<GameEntry> getAllInformationOnGame(String gameTitle) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<GameEntry> rval = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(__dbProperties.getProperty("sql.getAllInformationOnGame"));
			stmt.setString(1, gameTitle);
			rs = stmt.executeQuery();
			while (rs.next()) {
				rval.add(new GameEntry(-1, rs.getString(2), rs.getString(1), null, rs.getString(3),
						new Engine(-1, rs.getString(6), rs.getString(7), null, null),
						new SeriesEntry(-1, rs.getString(4), null, rs.getString(5), null),
						new CompanyEntry(-1, rs.getString(8), rs.getString(9), -1)));
			}
		} catch (Exception sqe) {
			sqe.printStackTrace();
			rval = null;
		} finally {  // why nest all of these try/finally blocks?
			try {
				rs.close();
				if (stmt != null) { stmt.close(); }
			} catch (Exception e2) { e2.printStackTrace(); }
			finally {
				try {
					if (conn != null) { conn.close(); }
				} catch (Exception e3) { e3.printStackTrace(); }
			}
		}
		return rval;
	}

	@Override
	public ArrayList<WorkerEntry> getAllWorkersByGameID(String gameID) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<WorkerEntry> rval = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(__dbProperties.getProperty("sql.getAllWorkersByGameID"));
			stmt.setString(1, gameID);
			rs = stmt.executeQuery();
			while (rs.next()) {
				rval.add(new WorkerEntry(-1, rs.getString(1), null, rs.getString(2), null));
			}
		} catch (Exception sqe) {
			sqe.printStackTrace();
			rval = null;
		} finally {  // why nest all of these try/finally blocks?
			try {
				rs.close();
				if (stmt != null) { stmt.close(); }
			} catch (Exception e2) { e2.printStackTrace(); }
			finally {
				try {
					if (conn != null) { conn.close(); }
				} catch (Exception e3) { e3.printStackTrace(); }
			}
		}
		return rval;
	}

	@Override
	public ArrayList<GameEntry> getAllMainCharactersByGameID(String gameID) {
		return null;
	}


	@Override
	// intentionally not implemented
	public ArrayList<SeriesEntry> getAllSeriesInfo(String seriesID) {
		return null;
	}
}
