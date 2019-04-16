package mgdb.site.model;

public class CompanyEntry {

    private int id;
    private String name;
    private String description;
    private int numGames;

    public CompanyEntry(int id, String name, String description, int numGames) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.numGames = numGames;
    }

    public CompanyEntry() {}

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

    public void setNumGames(int numGames) {
        this.numGames = numGames;
    }

    public int getNumGames() {
        return numGames;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String toString() { return id + "\n" + name + "\n" + description + "\n"; }
}



