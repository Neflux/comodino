package db;

import java.io.Serializable;
import java.sql.*;
import java.util.*;
import java.util.logging.Logger;

import main.ProductGroup;
import main.Shop;
import main.Product;
import utils.PropertiesReader;

import static utils.Mechanist.*;

public class DBManager implements Serializable {
    private static transient Connection con;

    public static Connection getCon() {
        return con;
    }

    public DBManager() throws SQLException {
        String database, user, password, timezone_fix;
        try {
            PropertiesReader pr = new PropertiesReader("config.properties");
            database = pr.get("database");
            user = pr.get("user");
            password = pr.get("password");
            timezone_fix = "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false";
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            throw new RuntimeException(e.toString(), e);
        }

        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/" + database + timezone_fix + "&user=" + user + "&password=" + password);
    }

    public static void shutdown() { //static?
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).info(ex.getMessage());
        }
    }

    public static ArrayList<String> getCategories(Map params) throws SQLException {
        ArrayList<String> ret = new ArrayList<String>();

        String searchQuery;
        if((searchQuery = checkSMP(params.get("q"))) == null){
            return null;
        }

        //Query PreparedStatement
        PreparedStatement stm = null;
        stm = con.prepareStatement(
                "SELECT DISTINCT P.CategoryName " +
                        "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                        "WHERE P.Name LIKE ? AND P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity > 0 "
        );
        stm.setString(1,"%"+searchQuery+"%");

        //Execution
        try (ResultSet rs = stm.executeQuery()){
            System.out.println(stm.toString());
            while(rs.next()) {
                ret.add(rs.getString("CategoryName"));
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        finally {
            stm.close();
        }

        return ret;
    }

    public static ArrayList<String> getVendors(Map params) throws SQLException {
        ArrayList<String> ret = new ArrayList<String>();

        String searchQuery;
        if((searchQuery = checkSMP(params.get("q"))) == null){
            return null;
        }

        //Query PreparedStatement
        PreparedStatement stm = null;
        stm = con.prepareStatement(
                "SELECT DISTINCT S.Name " +
                        "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                        "WHERE P.Name LIKE ? AND P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity > 0 "
        );
        stm.setString(1,"%"+searchQuery+"%");

        //Execution
        try (ResultSet rs = stm.executeQuery()){
            System.out.println(stm.toString());
            while(rs.next()) {
                ret.add(rs.getString("Name"));
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        finally {
            stm.close();
        }

        return ret;
    }

    public static ArrayList<String> getGeoZone(Map params) throws SQLException {
        ArrayList<String> ret = new ArrayList<String>();

        String searchQuery;
        if((searchQuery = checkSMP(params.get("q"))) == null){
            return null;
        }

        //Query PreparedStatement
        PreparedStatement stm = con.prepareStatement(
                "SELECT DISTINCT SI.State " +
                        "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                        "WHERE P.Name LIKE ? AND P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity > 0 "
        );
        stm.setString(1,"%"+searchQuery+"%");
        System.out.println(stm.toString());

        //Execution
        try (ResultSet rs = stm.executeQuery()){
            while(rs.next()) {
                ret.add(rs.getString("State"));
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        finally {
            stm.close();
        }
        return ret;
    }

    private final static String sortKeyword = "sort";
    private final static String minPriceKeyword = "minPrice";
    private final static String maxPriceKeyword = "maxPrice";
    private final static String minRatingKeyword = "minRat";
    private final static String categoryKeyword = "cat";
    private final static String vendorKeyword = "vendor";
    private final static String geolocalizationKeyword = "geo";

    /**
     * Ottiene la lista dei prodotti dal DB in base ai parametri, organizzati in gruppi di prodotti dallo stesso nome
     * @param params Mappa contenente tutti i parametri ottenuti precedentemente dal GET
     * @return Mappa contenente i singoli shopProduct raggruppati come product (ProductGroup in java)
     * @throws SQLException nel caso qualcosa non andasse come previsto nel database
     */
    public static Map<String, ProductGroup> getProducts(Map params) throws SQLException {
        Map<String,ProductGroup> products = new HashMap<>();

        //Search query parameter
        String searchQuery;
        if((searchQuery = checkSMP(params.get("q"))) == null){
            return null;
        }

        //Sorting parameter
        String sort = checkSMP(params.get(sortKeyword)),
                orderBySql = "ORDER BY ActualPrice ASC, P.Rating DESC, S.Rating DESC, SP.Quantity DESC";
        if(sort != null) {
            switch (sort) {
                case "price-asc":
                    orderBySql = " ORDER BY ActualPrice ASC, P.Rating DESC, S.Rating DESC, SP.Quantity DESC";
                    break;
                case "price-desc":
                    orderBySql = " ORDER BY ActualPrice DESC, P.Rating DESC, S.Rating DESC, SP.Quantity DESC";
                    break;
                case "rating-desc":
                    orderBySql = " ORDER BY P.Rating DESC, ActualPrice ASC, S.Rating DESC, SP.Quantity DESC";
                    break;
                default:
                    break;
            }
        }

        //minPrice parameter
        String minPrice = "",maxPrice = "";
        if((minPrice = checkSMP(params.get(minPriceKeyword))) != null){
            try {
                int value = Integer.parseInt(minPrice);
                if(value >= 0){
                    minPrice = " AND SP.Price >= " + minPrice + " ";
                }
                else maxPrice = "";
            } catch (NumberFormatException e) {
                e.printStackTrace();
                minPrice = "";
            }
        } else minPrice = "";

        //maxPrice parameter
        if((maxPrice = checkSMP(params.get(maxPriceKeyword))) != null){
            try {
                int value = Integer.parseInt(maxPrice);
                if(value > 0){
                    maxPrice = " AND SP.Price <= " + maxPrice + " ";
                }
                else maxPrice = "";
            } catch (NumberFormatException e) {
                e.printStackTrace();
                maxPrice = "";
            }
        } else maxPrice = "";

        //minRating parameter
        String minRating = "";
        if((minRating = checkSMP(params.get(minRatingKeyword))) != null){
            try {
                int value = Integer.parseInt(minRating);
                if(!(value >= 1 && value <= 5)){
                    minRating = "";
                }
                else {
                    minRating = " AND P.Rating >= " + minRating + " ";
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                minRating = "";
            }
        } else minRating = "";

        //Category parameter
        String[] cat;
        StringBuilder category = new StringBuilder();
        if((cat = getMMP(params.get(categoryKeyword))) != null){
            for(int i = 0; i<cat.length;i++){
                System.out.println(cat[i]);
                if(i == 0)
                    category.append(" AND (P.CategoryName = '")
                            .append(cat[i])
                            .append("'")
                            .append((i == cat.length - 1) ? ") " : "");
                else
                    category.append(" OR P.CategoryName = '")
                            .append(cat[i])
                            .append("'")
                            .append((i == cat.length - 1) ? ") " : "");
            }
        }

        //Vendor parameter
        String[] ven;
        StringBuilder vendor = new StringBuilder();
        if((ven = getMMP(params.get(vendorKeyword))) != null){
            for (String aVen : ven) {
                vendor.append(" AND (S.Name <> '").append(aVen).append("')");
            }
        }

        //Regione amministrativa
        String[] geo;
        StringBuilder region = new StringBuilder();
        if((geo = getMMP(params.get(geolocalizationKeyword))) != null){
            region.append(" AND S.ShopID = SI.ShopID ");
            for (String aGeo : geo)
                region.append(" AND (SI.State <> '").append(aGeo).append("')");
        }

        //Final query PreparedStatement
        PreparedStatement stm = con.prepareStatement(
            "SELECT DISTINCT P.ProductID, P.Name as ProductName, P.CategoryName, P.Rating, " +
                    "SP.Price, SP.Discount, SP.Quantity, S.Name as ShopName, " +
                    " round(SP.Price * (1-SP.Discount),2) as ActualPrice " +
                    "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                    "WHERE P.Name LIKE ? AND P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity > 0 " +
                    region.toString() + category.toString() + vendor.toString() + minPrice + maxPrice + minRating +
                    orderBySql
        );
        stm.setString(1,"%"+searchQuery+"%");
        System.out.println("MAIN PRODUCT QUERY: " + stm.toString());

        //Final query execute
        try {
            try (ResultSet rs = stm.executeQuery()){
                while(rs.next()) {
                    //Product crafting
                    Product p = new Product();
                    p.setProductID(rs.getInt("ProductID"));
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

            //Review count info
            stm = con.prepareStatement(
                    "SELECT COUNT(*) AS conto, product.name " +
                            "FROM productreview, product " +
                            "WHERE product.ProductID = productreview.ProductID AND product.name = ?"
            );
            stm.setString(1, pair.getKey().toString());
            System.out.println("REVIEW COUNT("+pair.getKey().toString()+"): "+stm.toString());
            try {
                try (ResultSet rs = stm.executeQuery()) {
                    rs.next();
                    gp.setReviewCount(rs.getInt("conto"));
                }
            } finally {
                stm.close();
            }

            //Decode image from first product
            Product p = gp.getList().get(0);
            String imgDataBase64 = "";
            stm = con.prepareStatement("select * from productphoto where ProductID = ?");
            stm.setInt(1,p.getProductID());
            System.out.println("DECODE FIRST PRODUCT IMAGE(productId:"+p.getProductID()+"): "+stm.toString());
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

            //Fetch shop list related to this ProductGroup
            stm = con.prepareStatement("SELECT shop.*, shopproduct.Price, shopproduct.Discount, " +
                    "shopproduct.Quantity, round(shopproduct.Price * (1-shopproduct.Discount),2) as ActualPrice " +
                    "FROM product, shopproduct, shop " +
                    "WHERE product.name = ? AND shopproduct.Quantity > 0 " +
                    "AND product.ProductID = shopproduct.ProductID AND shopproduct.ShopID = shop.ShopID " +
                    "ORDER BY ActualPrice ASC, Rating DESC"
            );
            stm.setString(1, pair.getKey().toString());
            System.out.println(stm.toString());
            try (ResultSet rs = stm.executeQuery()){
                while(rs.next()) {
                    //Shop crafting
                    Shop s = new Shop();
                    s.setShopID(rs.getInt("ShopID"));
                    s.setName(rs.getString("Name"));
                    s.setDescription(rs.getString("Description"));
                    s.setWebsite(rs.getString("Website"));
                    s.setRating(rs.getFloat("Rating"));
                    s.setSampleActualPrice(rs.getFloat("ActualPrice"));

                    //Actual insertion
                    gp.getVendors().add(s);
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
}