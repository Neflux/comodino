package main;

public class Shop {

    private int ShopID;
    private String Name;
    private String Description;
    private String Website;
    private float Rating;
    private float sampleActualPrice; //ovviamente uno shop non ha un prezzo singolo, ma ci serve per il modal nella ricerca

    public Shop(){

    }

    public int getShopID() {
        return ShopID;
    }

    public void setShopID(int shopID) {
        ShopID = shopID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getWebsite() {
        return Website;
    }

    public void setWebsite(String website) {
        Website = website;
    }

    public float getRating() {
        return Rating;
    }

    public void setRating(float rating) {
        Rating = rating;
    }

    public float getSampleActualPrice() {
        return sampleActualPrice;
    }

    public void setSampleActualPrice(float sampleActualPrice) {
        this.sampleActualPrice = sampleActualPrice;
    }
}
