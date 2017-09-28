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
            PreparedStatement stm = con.prepareStatement("SELECT *\n" +
                    "FROM product\n" +
                    "INNER JOIN productphoto USING(ProductID)\n" +
                    "INNER JOIN shopproduct USING (ProductID)\n" +
                    "WHERE product.ProductID = ? AND shopproduct.ShopID = ?;");
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
        prod.setDescription(rs.getString("Description"));
        prod.setRating(rs.getInt("Rating"));
        prod.setCategoryName(rs.getString("CategoryName"));
        prod.setImgBase64(Utils.getStringfromBlob(rs.getBlob("Image")));
        prod.setPrice(rs.getFloat("Price"));
        prod.setShopID(rs.getInt("ShopID"));
        return prod;
    }
}
