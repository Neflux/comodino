package daos.impl;

import daos.ShopDao;
import db.DBManager;
import main.PhysicalShop;
import main.Product;
import main.ProductGroup;
import main.Shop;
import utils.Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
            // testo se ha il negozio fisico
            PreparedStatement stm = con.prepareStatement("SELECT *\n" +
                    "FROM shop\n" +
                    "INNER JOIN shopinfo USING (ShopID)\n" +
                    "WHERE ShopID = ?");
            stm.setInt(1, shopID);
            ResultSet rs = stm.executeQuery();
            Shop tmp = extractPhysicalShopFromResultSet(rs);

            // se non ha negozio fisico carico solo quello online
            if (tmp == null){
                PreparedStatement stm2 = con.prepareStatement("SELECT *\n" +
                        "FROM shop\n" +
                        "WHERE ShopID = ?");
                stm2.setInt(1, shopID);
                ResultSet rs2 = stm2.executeQuery();
                tmp = extractSimpleShopFromResultSet(rs2);
            }

            // carico le immagini del negozio
            if(tmp != null) {
                System.out.println("[INFO] Shop preso con successo");
                System.out.flush();
                tmp.setShopphoto(getImages(shopID));
            }
            tmp.setExpiringProducts(obtainExpiringProducts(shopID));
            return tmp;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Product> obtainExpiringProducts (int id) {
        ArrayList<Product> expProducts = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(
                    "SELECT DISTINCT P.ProductID, P.Name as ProductName, SP.Quantity \n" +
                        "FROM Product P, ShopProduct SP \n" +
                        "WHERE P.ProductID = SP.ProductID AND SP.ShopID = ? AND Sp.Quantity <= 20\n" +
                        "ORDER BY SP.Quantity \n" +
                        "LIMIT 10"
            );
            stm.setInt(1, id);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setQuantity(rs.getInt("Quantity"));

                expProducts.add(p);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return expProducts;
    }
    @Override
    public HashMap<String, ProductGroup> getShopProducts(String id) {
        HashMap<String, ProductGroup> products = new HashMap<>();
        //Final query PreparedStatement
        try{
            PreparedStatement stm = con.prepareStatement(
                    "SELECT DISTINCT P.ProductID, P.Name as ProductName, P.CategoryName, P.Rating, SP.ShopID, SP.Price, SP.Discount, SP.Quantity, S.Name as ShopName,  round(SP.Price * (1-SP.Discount),2) as ActualPrice \n" +
                            "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI \n" +
                            "WHERE P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND S.ShopID = ? AND SP.Quantity > 0 "
            );
            stm.setString(1,id);

            //System.out.println("MAIN PRODUCT QUERY: " + stm.toString().substring(45));
            ResultSet rs = stm.executeQuery();
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

        } catch (SQLException e) {
            e.printStackTrace();
        }

        //ProductGroup extra fetching
        for (Object o : products.entrySet()) {
            Map.Entry pair = (Map.Entry) o;
            ProductGroup gp = (ProductGroup) pair.getValue();
            System.out.println("\nPRODUCT: " + pair.getKey().toString());

            //Decode image from first product
            Product p = gp.getList().get(0);

            try {
                PreparedStatement stm = con.prepareStatement("SELECT * \n" +
                        "FROM productphoto \n" +
                        "WHERE ProductID = ?");
                stm.setInt(1, p.getProductID());
                System.out.println("DECODE PRODUCT IMAGE: "+stm.toString().substring(45));
                ResultSet rs = stm.executeQuery();
                if(rs.next()) {
                    // perché non dovrebbe andare questo, più elegante?
                    gp.setImageData(Utils.getStringfromBlob(rs.getBlob("Image")));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return products;
    }

    private ArrayList<String> getImages(int shopID){

        ArrayList<String> imgBase64 = new ArrayList<>();

        try{
            PreparedStatement stm = con.prepareStatement("SELECT * FROM shopphoto WHERE shopphoto.ShopID = ?");
            stm.setInt(1, shopID);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                imgBase64.add(Utils.getStringfromBlob(rs.getBlob("Image")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imgBase64;
    }

    @Override
    public ArrayList<Shop> getPhysicalShopsByProduct (int productID){
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

    private Shop extractSimpleShopFromResultSet(ResultSet rs) {
        try {
            if(!rs.next()){
                return null;
            }
            Shop shop = new Shop();

            // creo inserisco dati ordine generale
            shop.setShopID(rs.getInt("ShopID"));
            shop.setName(rs.getString("Name"));
            shop.setDescription(rs.getString("Description"));
            shop.setWebsite(rs.getString("Website"));
            shop.setRating(rs.getInt("Rating"));
            return shop;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private PhysicalShop extractPhysicalShopFromResultSet(ResultSet rs) {
        try {
            if(!rs.next()){
                return null;
            }
            PhysicalShop shop = new PhysicalShop();

            // creo inserisco dati ordine generale
            shop.setShopID(rs.getInt("ShopID"));
            shop.setName(rs.getString("Name"));
            shop.setDescription(rs.getString("Description"));
            shop.setWebsite(rs.getString("Website"));
            shop.setRating(rs.getInt("Rating"));

            shop.setLatitude(rs.getFloat("Latitude"));
            shop.setLongitude(rs.getFloat("Longitude"));
            shop.setAddress(rs.getString("Address"));
            shop.setCity(rs.getString("City"));
            shop.setState(rs.getString("State"));
            shop.setZip(rs.getString("ZIP"));
            shop.setOpeningHours(rs.getString("OpeningHours"));
            return shop;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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
                physicalShop.setOpeningHours(rs.getString("OpeningHours"));

                // aggiungo l'ordine del prodotto al corrispettivo ordine generale
                shopList.add(physicalShop);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shopList;
    }
}

