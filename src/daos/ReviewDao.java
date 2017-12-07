package daos;

import main.ProductReview;
import main.User;

import java.io.Serializable;
import java.util.ArrayList;

public interface ReviewDao extends Serializable {
    int createProductReview(String title, String description, int rating, int productID, int userID);
    ArrayList<ProductReview> getProductReview(int productID);
    ArrayList<ProductReview> getVendorProductReview(int shopID);
    User getReviewAuthor(int userID);
}