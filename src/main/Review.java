package main;


import java.sql.Timestamp;

public class Review {

    private String title = "null";
    private Timestamp creationDate;
    private float rating = -1;
    private String description = "null";
    private int userID = 0;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public Timestamp getCreationdate() {
        return creationDate;
    }

    public void setCreationdate(Timestamp creationdate) {
        this.creationDate = creationdate;
    }


    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public long getUserID() {
        return userID;
    }

    public void setUserID(int userid) {
        this.userID = userid;
    }

}
