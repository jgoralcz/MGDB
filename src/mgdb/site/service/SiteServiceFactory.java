package mgdb.site.service;

import mgdb.site.service.impl.RDBMSiteServiceImpl;

import java.util.Properties;

public class SiteServiceFactory {

	private SiteServiceFactory() {}

	final static String propertiesFile = "/service.properties";
	private static SiteService siteService;

	public static SiteService getInstance() {
		// should really read from a property here
		if (siteService == null) {
			siteService = new RDBMSiteServiceImpl();
		}
		return siteService;
	}

	// This class is going to look for a file named service.properties in the classpath
	// to get its initial settings
	static {
		try {
			Properties dbProperties = new Properties();
			Class<?> initClass = null;
			dbProperties.load(mgdb.site.service.impl.RDBMSiteServiceImpl.class.getClassLoader().getResourceAsStream(propertiesFile));
			String serviceImpl = dbProperties.getProperty("serviceImpl");
			if (serviceImpl != null) {
				initClass = Class.forName(serviceImpl);
			} else {
				throw new Error("Must have the file: mgdb.site.service.impl.RDBMSiteServiceImpl in the properties file.");
			}
			siteService = (SiteService) initClass.newInstance();
		} catch (Throwable t) {
			t.printStackTrace();
		}
	}
}
