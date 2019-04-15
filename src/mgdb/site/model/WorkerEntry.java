package mgdb.site.model;

public class WorkerEntry {

    private int id;
    private String firstName;
    private String middleName;
    private String lastName;
    private String bio;

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



