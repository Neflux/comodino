package daos.impl;

import daos.ShopDao;
import db.DBManager;
import main.PhysicalShop;
import main.Product;
import main.ProductGroup;
import main.Shop;
import utils.Utils;

import java.sql.*;
import java.util.ArrayList;
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
            PreparedStatement stm = con.prepareStatement("SELECT * " +
                    "FROM shop, shopinfo " +
                    "WHERE shop.ShopID = ? AND shopinfo.ShopID = shop.ShopID");
            stm.setInt(1,shopID);
            //System.out.println(stm.toString());
            ResultSet rs = stm.executeQuery();
            Shop tmp = extractShopFromResultSet(rs);
            if(tmp != null)
                tmp.setShopphoto(getImages(shopID));
            return tmp;
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
                    // perché non dovrebbe andare questo, più elegante?
                    // gp.setImageData(Utils.getStringfromBlob(rs.getBlob("Image")));

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

    private ArrayList<String> getImages(int shopID) throws SQLException {
        PreparedStatement stm = con.prepareStatement("SELECT * FROM shopphoto WHERE shopphoto.ShopID = ?");
        stm.setInt(1, shopID);
        ResultSet rs = stm.executeQuery();
        ArrayList<String> imgBase64 = new ArrayList<>();
        while (rs.next()) {
            imgBase64.add(Utils.getStringfromBlob(rs.getBlob("Image")));
        }
        return imgBase64;
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
        shop.setLatitude(rs.getInt("Latitude"));
        shop.setLongitude(rs.getInt("Longitude"));
        shop.setAddress(rs.getString("Address"));
        shop.setCity(rs.getString("City"));
        shop.setState(rs.getString("State"));
        shop.setZip(rs.getString("ZIP"));
        shop.setOpeningHours(rs.getString("OpeningHours"));
        return shop;
    }

    public ArrayList<Shop> getPhysicalShopsbyProduct (int productID){
        ArrayList<Shop> shops = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement("SELECT s.*, si.*\n" +
                    "FROM shop s\n" +
                    "INNER JOIN shopinfo si ON s.ShopID = si.ShopID\n" +
                    "INNER JOIN shopproduct sp ON s.ShopID = sp.ShopID\n" +
                    "WHERE sp.ProductID = ? AND sp.Quantity > 0");
            stm.setInt(1, productID);

            ResultSet rs = stm.executeQuery();
            shops = extractPhysicalShopsFromResultSet(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shops;
    }
    private ArrayList<Shop> extractPhysicalShopsFromResultSet(ResultSet rs) {
        ArrayList<Shop> shopList = new ArrayList<>();

        try {
            PhysicalShop physicalShop;

            while (rs.next()) {

                // creo inserisco dati ordine generale
                physicalShop = new PhysicalShop();

                physicalShop.setShopID(rs.getInt("s.ShopID"));
                physicalShop.setName(rs.getString("Name"));
                physicalShop.setDescription(rs.getString("Description"));
                physicalShop.setWebsite(rs.getString("Website"));
                physicalShop.setRating(rs.getInt("Rating"));

                physicalShop.setLatitude(rs.getFloat("Latitude"));
                physicalShop.setLongitude(rs.getFloat("Longitude"));
                physicalShop.setAddress(rs.getString("Address"));
                physicalShop.setCity(rs.getString("City"));
                physicalShop.setState(rs.getString("State"));
                physicalShop.setZip(rs.getString("ZIP"));
                physicalShop.setOpeninghours(rs.getString("OpeningHours"));

                // aggiungo l'ordine del prodotto al corrispettivo ordine generale
                shopList.add(physicalShop);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shopList;
    }
}

