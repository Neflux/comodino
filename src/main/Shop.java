package main;

import java.io.Serializable;
import java.util.ArrayList;

public class Shop implements Serializable {

    private int shopID = 0;
    private String name = "";
    private String description = "";
    private String website = "";
    private float rating = -1;
    private float sampleActualPrice = 0; //ovviamente uno shop non ha un prezzo singolo, ma ci serve per il modal nella ricerca

    private float latitude, longitude;
    private String city, state, zip, openingHours, address;

    private ArrayList<String> shopphoto;

    public ArrayList<String> getShopphoto() {
        return shopphoto;
    }

    public void setShopphoto(ArrayList<String> shopphoto) {
        this.shopphoto = shopphoto;
    }

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getOpeningHours() {
        return openingHours;
    }

    public void setOpeningHours(String openingHours) {
        this.openingHours = openingHours;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }



    public int getShopID() {
        return shopID;
    }

    public void setShopID(int shopID) {
        this.shopID = shopID;
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

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public float getSampleActualPrice() {
        return sampleActualPrice;
    }

    public void setSampleActualPrice(float sampleActualPrice) {
        this.sampleActualPrice = sampleActualPrice;
    }

}
