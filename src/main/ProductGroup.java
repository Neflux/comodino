package main;

import java.util.ArrayList;
import java.util.List;

public class ProductGroup {

    private List<Product> list;
    private int reviewCount = 0;

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
}
