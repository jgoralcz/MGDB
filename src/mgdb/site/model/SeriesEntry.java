package mgdb.site.model;

import java.util.Date;

public class SeriesEntry {

    private int id;
    private String name;
    private Date releaseDate;
    private String description;
    private String imageURL;

    public SeriesEntry(int id, String name, Date releaseDate, String description, String imageURL) {
        this.id = id;
        this.name = name;
        this.releaseDate = releaseDate;
        this.description = description;
        this.imageURL = imageURL;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String toString() { return name + "\n" + releaseDate.toString() + "\n" + description + "\n" + imageURL; }
}



