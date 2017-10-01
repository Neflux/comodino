package main;

import daos.impl.UserDaoImpl;

import java.io.Serializable;

public class User implements Serializable {

    private int userID;
    private String firstName;
    private String lastName;
    private String email;
    private int type; // 0 normale o venditore, 1 admin
    private boolean hasShop; // true se è venditore
    private int privacy;

    public User() {
        updateHasShop();
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public boolean hasShop() {
        return hasShop;
    }

    public void updateHasShop() {
        this.hasShop = new UserDaoImpl().hasShop(this);
    }

    public int getPrivacy() {
        return privacy;
    }

    public void setPrivacy(int privacy) {
        this.privacy = privacy;
    }
}