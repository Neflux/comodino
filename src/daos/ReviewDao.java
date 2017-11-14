package daos;

import main.*;

import java.io.Serializable;
import java.util.ArrayList;

public interface ReviewDao extends Serializable {

    ArrayList<ProductReview> getProductReview(int productID);
    String getReviewAuthor(int productID, int userID);
}