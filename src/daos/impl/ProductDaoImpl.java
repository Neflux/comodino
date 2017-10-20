package daos.impl;

import daos.ProductDao;
import db.DBManager;
import main.Product;
import utils.Utils;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

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
        try{
            prod.setProductID(rs.getInt("ProductID"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setProductName(rs.getString("Name"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setShopID(rs.getInt("ShopID"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setShopName(rs.getString("ShopName"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setDescription(rs.getString("Description"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setImgBase64(Utils.getStringfromBlob(rs.getBlob("Image")));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setPrice(rs.getFloat("Price"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setQuantity(rs.getInt("Quantity"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setDiscount(rs.getFloat("Discount"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setActualPrice(prod.getPrice()*(1-prod.getDiscount()));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setCategoryName(rs.getString("CategoryName"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setRating(rs.getInt("Rating"));
        }catch (Exception e){
            e.printStackTrace();
        }

        return prod;
    }
}
