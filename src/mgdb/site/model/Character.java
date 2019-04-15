package mgdb.site.model;

public class Character {

    private int id;
    private int gameID;
    private String name;
    private String description;
    private boolean isMainCharacter;

    public Character(int id, int gameID, String name, String description, boolean mainCharacter) {
        this.id = id;
        this.gameID = gameID;
        this.name = name;
        this.description = description;
        this.isMainCharacter = mainCharacter;
    }


    public String toString() { return id + "\n" + gameID + "\n" + name + "\n" + description + "\nIs main character: " + isMainCharacter; }
}



