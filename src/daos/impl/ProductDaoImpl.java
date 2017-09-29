package daos.impl;

import daos.ProductDao;
import db.DBManager;
import main.Product;
import utils.Utils;

import java.sql.*;

public class ProductDaoImpl implements ProductDao {
    private Connection con;

    ProductDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public Product getProduct(int productID, int shopID) {
        try {
            PreparedStatement stm = con.prepareStatement("SELECT *, s.Name AS ShopName \n" +
                    "FROM product AS p\n" +
                    "INNER JOIN productphoto AS pp USING(ProductID)\n" +
                    "INNER JOIN shopproduct AS sp USING (ProductID)\n" +
                    "INNER JOIN shop AS s USING (ShopID)\n" +
                    "WHERE p.ProductID = ? AND sp.ShopID = ?;");
            stm.setInt(1,productID);
            stm.setInt(2,shopID);
            ResultSet rs = stm.executeQuery();
            return extractProductFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    private Product extractProductFromResultSet(ResultSet rs) throws SQLException {
        if(!rs.next()){
            return null;
        }
        Product prod = new Product();
        prod.setProductID(rs.getInt("ProductID"));
        prod.setProductName(rs.getString("Name"));
        prod.setShopID(rs.getInt("ShopID"));
        prod.setShopName(rs.getString("ShopName"));
        prod.setDescription(rs.getString("Description"));
        prod.setImgBase64(Utils.getStringfromBlob(rs.getBlob("Image")));
        prod.setPrice(rs.getFloat("Price"));
        prod.setQuantity(rs.getInt("Quantity"));
        prod.setDiscount(rs.getFloat("Discount"));
        prod.setActualPrice(prod.getPrice()*(1-prod.getDiscount()));
        prod.setCategoryName(rs.getString("CategoryName"));
        prod.setRating(rs.getInt("Rating"));
        return prod;
    }
}
