package mgdb.site.model;

public class GameEntry {

    private int id;
    private String description;
    private String englishName;
    private String otherName;
    private String imageURL;
    private Engine engine;
    private SeriesEntry series;
    private CompanyEntry company;

    public GameEntry(int id, String description, String englishName, String otherName, String imageURL, Engine engine, SeriesEntry series, CompanyEntry company) {
        this.id = id;
        this.description = description;
        this.englishName = englishName;
        this.otherName = otherName;
        this.imageURL = imageURL;
        this.engine = engine;
        this.series = series;
        this.company = company;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getOtherName() {
        return otherName;
    }

    public void setOtherName(String otherName) {
        this.otherName = otherName;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public Engine getEngine() {
        return engine;
    }

    public void setEngine(Engine engine) {
        this.engine = engine;
    }

    public SeriesEntry getSeries() {
        return series;
    }

    public void setSeries(SeriesEntry series) {
        this.series = series;
    }

    public CompanyEntry getCompany() {
        return company;
    }

    public void setCompany(CompanyEntry company) {
        this.company = company;
    }



    public String toString() { return description + "\n" + englishName + "\n" + otherName + "\n" + imageURL + "\n" + engine.toString() + "\n" + series + "\n" + company.toString(); }
}



