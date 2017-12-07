package daos.impl;

import daos.ReviewDao;
import db.DBManager;
import main.Product;
import main.ProductReview;
import main.User;

import java.sql.*;
import java.util.ArrayList;

public class ReviewDaoImpl implements ReviewDao {

    private Connection con;

    public ReviewDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public int createProductReview(String title, String description, int rating, int productID, int userID) {
        try {
            PreparedStatement stm = con.prepareStatement("INSERT INTO productreview (Title, Description, Rating, ProductID, UserID, CreationDate) \n" +
                    "VALUES (?,?,?,?,?,NOW())", Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, title);
            stm.setString(2, description);
            stm.setInt(3, rating);
            stm.setInt(4, productID);
            stm.setInt(5, userID);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys(); // bisogna riferirsi ai campi con il numero in sto caso
            if (rs.next()){
                return 0;
            }
            return rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public ArrayList<ProductReview> getProductReview(int productID) {
        try {
            PreparedStatement stm = con.prepareStatement("SELECT *\n" +
                    "FROM productreview\n" +
                    "WHERE ProductID = ?");
            stm.setInt(1, productID);
            ResultSet rs = stm.executeQuery();
            return extractProductReviewFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<ProductReview> getVendorProductReview(int shopID) {
        try {
            PreparedStatement stm = con.prepareStatement("SELECT *\n" +
                    "FROM productreview\n" +
                    "WHERE ProductID IN (SELECT DISTINCT P.ProductID\n" +
                    "                    FROM Product P, ShopProduct SP, Shop S, ShopInfo SI\n" +
                    "                    WHERE P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND S.ShopID = ? )");
            stm.setInt(1, shopID);
            ResultSet rs = stm.executeQuery();
            return extractProductReviewFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private ArrayList<ProductReview> extractProductReviewFromResultSet(ResultSet rs) {
        ArrayList<ProductReview> reviewList = new ArrayList<>();

        try {
            ProductReview productReview;

            while (rs.next()) {

                // creo inserisco dati ordine generale
                productReview = new ProductReview();

                productReview.setCreationDate(rs.getTimestamp("CreationDate"));
                productReview.setDescription(rs.getString("Description"));
                productReview.setRating(rs.getFloat("Rating"));
                productReview.setTitle(rs.getString("Title"));
                productReview.setUserID(rs.getInt("UserID"));
                productReview.setProductID(rs.getInt("ProductID"));

                // aggiungo l'ordine del prodotto al corrispettivo ordine generale
                reviewList.add(productReview);

            }

            return reviewList;
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return null;
    }

    public User getReviewAuthor(int userID){
        return new UserDaoImpl().getUser(userID);
    }

    public Product getReviewdProduct(int productID, int shopID){ return new ProductDaoImpl().getProduct(productID, shopID);}

}
