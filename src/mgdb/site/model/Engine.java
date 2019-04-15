package mgdb.site.model;

import java.util.Date;

public class Engine {

    private int id;
    private String name;
    private String description;
    private Date date;
    private String imageURL;


    public Engine(int id, String name, String description, Date date, String imageURL) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.date = date;
        this.imageURL = imageURL;
    }

    public Engine() {}

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String toString() { return name + "\n" + description + "\n" + date.toString() + "\n" + imageURL; }
}



