package main;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ProductGroup implements Serializable {

    private List<Product> list;
    private int reviewCount = 0;
    private String imageData = "";
    private List<Shop> vendors;
    private ArrayList<String> geo;

    public ProductGroup(){
        list = new ArrayList<Product>();
        vendors = new ArrayList<Shop>();
        geo = new ArrayList<String>();
    }

    public List<Product> getList() {
        return list;
    }

    public float getReviewCount() {
        return reviewCount;
    }

    public void setReviewCount(int reviewCount) {
        this.reviewCount = reviewCount;
    }

    public String getImageData() {
        return imageData;
    }

    public void setImageData(String imageData) {
        this.imageData = "data:image/gif;base64," + imageData;
    }

    public List<Shop> getVendors() {
        return vendors;
    }

    public ArrayList<String> getGeo() {
        return geo;
    }
}
