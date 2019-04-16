package mgdb.site.model;

public class CharacterEntry {

    private int id;
    private int gameID;
    private String name;
    private String description;
    private boolean isMainCharacter;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGameID() {
        return gameID;
    }

    public void setGameID(int gameID) {
        this.gameID = gameID;
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

    public boolean isMainCharacter() {
        return isMainCharacter;
    }

    public void setMainCharacter(boolean mainCharacter) {
        isMainCharacter = mainCharacter;
    }

    public CharacterEntry(int id, int gameID, String name, String description, boolean mainCharacter) {
        this.id = id;
        this.gameID = gameID;
        this.name = name;
        this.description = description;
        this.isMainCharacter = mainCharacter;
    }


    public String toString() { return id + "\n" + gameID + "\n" + name + "\n" + description + "\nIs main character: " + isMainCharacter; }
}



