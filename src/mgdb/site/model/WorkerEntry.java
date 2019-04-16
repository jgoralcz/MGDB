package mgdb.site.model;

public class WorkerEntry {

    private int id;
    private String firstName;
    private String middleName;
    private String lastName;
    private String bio;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public WorkerEntry(int id, String firstName, String middleName, String lastName, String bio) {
        this.id = id;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.bio = bio;
    }

    public WorkerEntry() {}

    public String toString() { return firstName + "\n" + middleName + "\n" + lastName + "\n" + bio; }
}



