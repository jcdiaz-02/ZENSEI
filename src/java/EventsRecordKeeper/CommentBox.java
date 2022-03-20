package EventsRecordKeeper;

public class CommentBox {
    private int id;
    private String comment;
    private String firstName;
    private String lastName;
    private String course;
    private String email;

    public CommentBox(String comment, String firstName, String lastName, String course, String email) {
        this.comment = comment;
        this.firstName = firstName;
        this.lastName = lastName;
        this.course = course;
        this.email = email;

    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getComment() {
        return comment;
    }

    public String getCourse() {
        return course;
    }

    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

}
