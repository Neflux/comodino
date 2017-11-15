package daos.impl;

import daos.ReviewDao;
import db.DBManager;
import main.ProductReview;
import main.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReviewDaoImpl implements ReviewDao {

    private Connection con;

    public ReviewDaoImpl() {
        this.con = DBManager.getCon();
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

    private ArrayList<ProductReview> extractProductReviewFromResultSet(ResultSet rs) {
        ArrayList<ProductReview> reviewList = new ArrayList<>();

        try {
            ProductReview productReview;

            while (rs.next()) {

                // creo inserisco dati ordine generale
                productReview = new ProductReview();

                productReview.setCreationdate(rs.getTimestamp("CreationDate"));
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

}
