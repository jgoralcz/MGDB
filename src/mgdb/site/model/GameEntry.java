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


    public String toString() { return description + "\n" + englishName + "\n" + otherName + "\n" + imageURL + "\n" + engine.toString() + "\n" + series + "\n" + company.toString(); }
}



