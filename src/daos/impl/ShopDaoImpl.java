package daos.impl;

import daos.ShopDao;
import db.DBManager;
import main.Product;
import main.ProductGroup;
import main.Shop;

import java.sql.*;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

public class ShopDaoImpl implements ShopDao {
    private Connection con;

    public ShopDaoImpl(){
        this.con = DBManager.getCon();
    }

    @Override
    public Shop getShop(int shopID) {
        try {
            PreparedStatement stm = con.prepareStatement("SELECT *\n" +
                    "FROM shop\n" +
                    "WHERE shop.ShopID = ?;");
            stm.setInt(1,shopID);
            ResultSet rs = stm.executeQuery();
            return extractShopFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public Map<String, ProductGroup> getProducts(String id) throws SQLException {
        Map<String, ProductGroup> products = new HashMap<>();
        //Final query PreparedStatement
        PreparedStatement stm = con.prepareStatement(
        "SELECT DISTINCT P.ProductID, P.Name as ProductName, P.CategoryName, P.Rating, " +
            "SP.ShopID, SP.Price, SP.Discount, SP.Quantity, S.Name as ShopName, " +
            " round(SP.Price * (1-SP.Discount),2) as ActualPrice " +
            "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
            "WHERE P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND S.ShopID = ? AND SP.Quantity > 0 "
        );
        stm.setString(1,id);

        System.out.println("MAIN PRODUCT QUERY: " + stm.toString().substring(45));

        //Final query execute
        try {
            try (ResultSet rs = stm.executeQuery()){
                while(rs.next()) {

                    //Product crafting
                    Product p = new Product();
                    p.setProductID(rs.getInt("ProductID"));
                    p.setShopID(rs.getInt("ShopID"));
                    p.setProductName(rs.getString("ProductName"));
                    p.setCategoryName(rs.getString("CategoryName"));
                    p.setRating(rs.getFloat("Rating"));
                    p.setPrice(rs.getFloat("Price"));
                    p.setDiscount(rs.getFloat("Discount"));
                    p.setActualPrice(rs.getFloat("ActualPrice"));
                    p.setQuantity(rs.getInt("Quantity"));
                    p.setShopName(rs.getString("ShopName"));

                    //ProductGroup crafting
                    products.computeIfAbsent(p.getProductName(), k -> new ProductGroup());
                    products.get(p.getProductName()).getList().add(p);
                }
            }
        } finally {
            stm.close();
        }

        //ProductGroup extra fetching
        for (Object o : products.entrySet()) {
            Map.Entry pair = (Map.Entry) o;
            ProductGroup gp = (ProductGroup) pair.getValue();
            System.out.println("\nPRODUCT: " + pair.getKey().toString());

                        //Decode image from first product
            Product p = gp.getList().get(0);
            String imgDataBase64;
            stm = con.prepareStatement("select * from productphoto where ProductID = ?");
            stm.setInt(1,p.getProductID());
            System.out.println("DECODE PRODUCT IMAGE: "+stm.toString().substring(45));
            try (ResultSet rs = stm.executeQuery()){
                if(rs.next()) {
                    Blob imgData = rs.getBlob("Image");
                    imgDataBase64 = new String(Base64.getEncoder().encode(imgData.getBytes(1, (int) imgData.length())));
                    gp.setImageData(imgDataBase64);
                    imgData.free();
                }
            } catch(Exception e){
                e.printStackTrace();
            }
            finally {
                stm.close();
            }

        }

        return products;
    }

    private Shop extractShopFromResultSet(ResultSet rs) throws SQLException {
        if(!rs.next()){
            return null;
        }
        Shop shop = new Shop();
        shop.setShopID(rs.getInt("ShopID"));
        shop.setName(rs.getString("Name"));
        shop.setDescription(rs.getString("Description"));
        shop.setWebsite(rs.getString("Website"));
        shop.setRating(rs.getInt("Rating"));
        return shop;
    }
}
