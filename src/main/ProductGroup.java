package main;

import java.util.ArrayList;
import java.util.List;

public class ProductGroup {

    private List<Product> list;
    private int reviewCount = 0;
    private String imageData = "";

    public ProductGroup(){
        list = new ArrayList<Product>();
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
        this.imageData = imageData;
    }
}
