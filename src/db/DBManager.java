package db;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import main.Product;
import utils.PropertiesReader;

public class DBManager implements Serializable {
    private static transient Connection con;

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

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/" + database + timezone_fix + "&user=" + user + "&password=" + password);
        this.con = con;
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
    public User authenticate(String email, String password) throws SQLException {
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
    /**
     * Ottiene la lista dei prodotti dal DB
     *
     * @return
     * @throws SQLException
     */
    public List<Product> getProducts(String searchQuery, int offset, int limit) throws SQLException {
        List<Product> products = new ArrayList<>();

        PreparedStatement stm = con.prepareStatement(
        "SELECT P.ProductID, P.Name as ProductName, P.CategoryName, P.Rating, SP.Price, SP.Discount, SP.Quantity, S.Name as ShopName " +
                "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                "WHERE P.Name = ? AND P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity <> -1 " +
                "LIMIT ?,?"
        );

        stm.setString(1,searchQuery);
        stm.setInt(2,offset);
        stm.setInt(3,limit);

        //parametri extra se ci sono, da decidere come gestire la sidebar che aggiunge altri parametri in GET

        try {
            ResultSet rs = stm.executeQuery();

            try {
                while(rs.next()) {
                    Product p = new Product();

                    p.setProductID(rs.getInt("ProductID"));
                    p.setProductName(rs.getString("ProductName"));
                    p.setCategoryName(rs.getString("CategoryName"));

                    p.setRating(rs.getFloat("Rating"));
                    p.setPrice(rs.getFloat("Price"));
                    p.setDiscount(rs.getFloat("Discount"));
                    p.setQuantity(rs.getInt("Quantity"));
                    p.setShopName(rs.getString("ShopName"));

                    products.add(p);
                }
            } finally {
                rs.close();
            }
        } finally {
            stm.close();
        }

        return products;
    }
}