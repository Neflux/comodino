package daos;

import main.Product;
import main.ProductReview;
import main.User;

import java.io.Serializable;
import java.util.ArrayList;

public interface ReviewDao extends Serializable {
    int createProductReview(String title, String description, int rating, int productID, int userID);
    int createProductReviewReply(String description, int reviewID);
    int isReviewReplied(int reviewID);
    ArrayList<ProductReview> getProductReviews(int productID);
    ArrayList<ProductReview> getVendorProductReviews(int shopID);
    User getReviewAuthor(int userID);
    Product getReviewProduct(int productID, int shopID);
    ProductReview getProductReviewByUser(User user, int productID);
}