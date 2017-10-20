package db;

import java.io.Serializable;
import java.sql.*;
import java.util.*;
import java.util.logging.Logger;

import main.ProductGroup;
import main.Shop;
import main.User;
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
            Class.forName("com.mysql.cj.jdbc.Driver");     //togliete il cj se dà problemi, ma scrivetelo nel gruppo
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

    /**
     * Autentica un utente in base a un nome utente e a una password
     *
     * @param email la email dell'utente
     * @param password la password
     * @return null se l'utente non è autenticato, un oggetto User se l'utente esiste ed è autenticato
     */
    /*
    public static User authenticate(String email, String password) throws SQLException {
        PreparedStatement stm = con.prepareStatement("SELECT * FROM User U " +
                "WHERE U.Email = ? AND U.password = ? AND U.EmailConfirm = 'yes'");
        try {
            stm.setString(1, email);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();

            try {
                if (rs.next()) {
                    User user = new User();
                    user.setUserID(rs.getInt("UserID"));
                    user.setFirstName(rs.getString("FirstName"));
                    user.setLastName(rs.getString("LastName"));
                    user.setEmail(rs.getString("Email"));
                    user.setType(rs.getInt("Type"));
                    user.setPrivacy(rs.getInt("Privacy"));
                    return user;
                } else {
                    return null;
                }
            } finally {
                rs.close();
            }
        } finally {
            stm.close();
        }
    }
    */

    public static ArrayList<String> getCategories(Map params)
    {
        ArrayList<String> ret = new ArrayList<String>();
        String searchQuery;
        if((searchQuery = checkSMP(params.get("q"))) == null){
            return null;
        }

        PreparedStatement stm = null;
        try {
            stm = con.prepareStatement(
                    "SELECT DISTINCT P.CategoryName " +
                            "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                            "WHERE P.Name LIKE ? AND P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity > 0 "
            );
            stm.setString(1,"%"+searchQuery+"%");       //a questo punto "q" è settata di sicuro

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

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ret;
    }

    public static ArrayList<String> getVendors(Map params)
    {
        ArrayList<String> ret = new ArrayList<String>();
        String searchQuery;
        if((searchQuery = checkSMP(params.get("q"))) == null){
            return null;
        }

        PreparedStatement stm = null;
        try {
            stm = con.prepareStatement(
                    "SELECT DISTINCT S.Name " +
                            "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                            "WHERE P.Name LIKE ? AND P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity > 0 "
            );
            stm.setString(1,"%"+searchQuery+"%");       //a questo punto "q" è settata di sicuro

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

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ret;
    }

    public static ArrayList<String> getGeoZone(Map params)
    {
        ArrayList<String> ret = new ArrayList<String>();
        String searchQuery;
        if((searchQuery = checkSMP(params.get("q"))) == null){
            return null;
        }

        PreparedStatement stm = null;
        try {
            stm = con.prepareStatement(
                    "SELECT DISTINCT SI.State " +
                            "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                            "WHERE P.Name LIKE ? AND P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity > 0 "
            );
            stm.setString(1,"%"+searchQuery+"%");       //a questo punto "q" è settata di sicuro

            try (ResultSet rs = stm.executeQuery()){
                System.out.println(stm.toString());
                while(rs.next()) {
                    ret.add(rs.getString("State"));
                }
            } catch(Exception e){
                e.printStackTrace();
            }
            finally {
                stm.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ret;
    }

    /**
     * Ottiene la lista dei prodotti dal DB
     *
     * @return
     * @throws SQLException
     */
    public static Map<String, ProductGroup> getProducts(Map params) throws SQLException {
        Map<String,ProductGroup> products = new HashMap<>();

        //Search query
        String searchQuery;
        if((searchQuery = checkSMP(params.get("q"))) == null){
            return null;
        }

        //Sorting
        String sort = checkSMP(params.get("sort")), orderBySql = "ORDER BY ActualPrice ASC, P.Rating DESC, S.Rating DESC, SP.Quantity DESC";
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

        //minPrice, maxPrice
        String minPrice = "",maxPrice = "";
        if((minPrice = checkSMP(params.get("minPrice"))) != null){
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
        if((maxPrice = checkSMP(params.get("maxPrice"))) != null){
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

        //minRating
        String minRating = "";
        if((minRating = checkSMP(params.get("minrat"))) != null){
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

        //Category
        String[] cat;
        StringBuilder category = new StringBuilder();
        if((cat = getMMP(params.get("cat"))) != null){
            for(int i = 0; i<cat.length;i++){
                System.out.println(cat[i]);
                if(i == 0)
                    category.append(" AND (P.CategoryName = '" + cat[i] + "'"+((i==cat.length-1)?") ":""));
                else
                    category.append(" OR P.CategoryName = '" + cat[i] + "'"+((i==cat.length-1)?") ":""));
            }
        }

        //Vendor
        String[] ven;
        StringBuilder vendor = new StringBuilder();
        if((ven = getMMP(params.get("vendor"))) != null){
            for(int i = 0; i<ven.length;i++){
                vendor.append(" AND (S.Name <> '" + ven[i] + "')");
            }
        }

        //Regione amministrativa
        String[] geo;
        StringBuilder region = new StringBuilder();
        if((geo = getMMP(params.get("geo"))) != null){
            region.append(" AND S.ShopID = SI.ShopID "); //appesantiamo la query solo se ha senso
            for(int i = 0; i<geo.length;i++){
                if(i == 0)
                    region.append(" AND (SI.State = '" + geo[i] + "'"+((i==geo.length-1)?") ":""));
                else
                    region.append(" OR SI.State = '" + geo[i] + "'"+((i==geo.length-1)?") ":""));
            }
        }

        PreparedStatement stm = con.prepareStatement(
                "SELECT DISTINCT P.ProductID, P.Name as ProductName, P.CategoryName, P.Rating, " +
                        "SP.Price, SP.Discount, SP.Quantity, S.Name as ShopName,  round(SP.Price * (1-SP.Discount),2) as ActualPrice " +
                        "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                        "WHERE P.Name LIKE ? AND P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity > 0 " +
                        region.toString() + category.toString() + vendor.toString() + minPrice + maxPrice + minRating +
                        orderBySql //+ " LIMIT 0,200"
        );
        stm.setString(1,"%"+searchQuery+"%");       //a questo punto "q" è settata di sicuro

        try {
            System.out.println(stm.toString());
            try (ResultSet rs = stm.executeQuery()){
                int sum = 0;
                while(rs.next()) {
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

                    products.computeIfAbsent(p.getProductName(), k -> new ProductGroup());

                    products.get(p.getProductName()).getList().add(p);
                }


            }
        } finally {
            stm.close();
        }

        for (Object o : products.entrySet()) {
            Map.Entry pair = (Map.Entry) o;
            ProductGroup gp = (ProductGroup) pair.getValue();

            /*System.out.println(pair.getKey().toString());
            for(Product p: gp.getList()){
                System.out.println(p.getActualPrice());
            }*/

            stm = con.prepareStatement(
                    "SELECT COUNT(*) AS conto, product.name " +
                            "FROM productreview, product " +
                            "WHERE product.ProductID = productreview.ProductID AND product.name = ?"
            );

            //gp.getList().get(0).getProductName() =========> pair.getKey()
            stm.setString(1, pair.getKey().toString());
            try {
                //System.out.println(stm.toString());
                try (ResultSet rs = stm.executeQuery()) {
                    rs.next();
                    gp.setReviewCount(rs.getInt("conto"));
                }
            } finally {
                stm.close();
            }

            Product p = gp.getList().get(0);    //il primo prodotto
            String imgDataBase64 = "";
            stm = con.prepareStatement("select * from productphoto where ProductID = ?");
            stm.setInt(1,p.getProductID());
            try (ResultSet rs = stm.executeQuery()){
                //System.out.println(stm.toString());
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


            stm = con.prepareStatement("SELECT shop.*, shopproduct.Price, shopproduct.Discount, " +
                    "shopproduct.Quantity, round(shopproduct.Price * (1-shopproduct.Discount),2) as ActualPrice " +
                    "FROM product, shopproduct, shop " +
                    "WHERE product.name = ? AND shopproduct.Quantity > 0 " +
                    "AND product.ProductID = shopproduct.ProductID AND shopproduct.ShopID = shop.ShopID " +
                    "ORDER BY ActualPrice ASC, Rating DESC"
            );

            stm.setString(1, pair.getKey().toString());
            try (ResultSet rs = stm.executeQuery()){
                System.out.println(stm.toString());
                while(rs.next()) {
                    Shop s = new Shop();
                    s.setShopID(rs.getInt("ShopID"));
                    s.setName(rs.getString("Name"));
                    s.setDescription(rs.getString("Description"));
                    s.setWebsite(rs.getString("Website"));
                    s.setRating(rs.getFloat("Rating"));

                    s.setSampleActualPrice(rs.getFloat("ActualPrice"));

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