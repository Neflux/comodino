package daos.impl;

import daos.UserDao;
import db.DBManager;
import javafx.util.Pair;
import main.Cart;
import main.CartItem;
import main.Product;
import main.User;
import utils.Utils;

import javax.servlet.http.Cookie;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDaoImpl implements UserDao {
    private Connection con;

    public UserDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public User authUser(String email, String password) {
        if (email.isEmpty() | password.isEmpty())
            return null;
        try {
            PreparedStatement stm = this.con.prepareStatement("SELECT * FROM user U WHERE U.Email = ? AND U.password = ? AND U.EmailConfirm = 'yes'");
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            return extractUserFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean changePwd(User user, String curPwd, String newPwd) {
        try {
            // controllo se la password attuale coincide con quella nel database
            if(authUser(user.getEmail(),curPwd) == null) {
                return false;
            }
            // se la password attuale coincide posso aggiornare il campo con la nuova password
            PreparedStatement stm = this.con.prepareStatement("UPDATE user SET Password = ? WHERE UserID = ?");
            stm.setString(1, newPwd);
            stm.setInt(2, user.getUserID());
            int i = stm.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editInfo(User user) {
        try {
            // se la password attuale coincide posso aggiornare il campo con la nuova password
            PreparedStatement stm = this.con.prepareStatement("UPDATE user SET FirstName = ?, LastName = ?, Email = ? WHERE UserID = ?");
            stm.setString(1, user.getFirstName());
            stm.setString(2, user.getLastName());
            stm.setString(3, user.getEmail());
            stm.setInt(4, user.getUserID());
            int i = stm.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public int getShopID (User user) {
        if (user == null)
            return 0;
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM usershop WHERE UserID = ?");
            stm.setInt(1,user.getUserID());
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                return rs.getInt("ShopID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public Cart getCart(User user) {
        if (user == null)
            return null;
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM cart WHERE UserID = ? ORDER BY AddDate DESC");
            stm.setInt(1,user.getUserID());
            ResultSet rs = stm.executeQuery();
            Cart cart = new Cart();
            while (true){
                CartItem cartItem = extractCartItemFromResultSet(rs);
                if (cartItem != null)
                    cart.add(cartItem);
                else
                    break;
            }
            return cart;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void decreaseCartItem(User user, int productID, int shopID){
        if (user == null)
            return;
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM `cart` WHERE UserID = ? AND ProductID = ? AND ShopID = ?");
            stm.setInt(1, user.getUserID());
            stm.setInt(2, productID);
            stm.setInt(3, shopID);
            ResultSet rs = stm.executeQuery();
            if (rs.next())
            {
                PreparedStatement stm2 = con.prepareStatement("UPDATE cart SET Quantity = Quantity - 1, AddDate = NOW() WHERE UserID = ? AND ProductID = ? AND ShopID = ?");
                stm2.setInt(1, user.getUserID());
                stm2.setInt(2, productID);
                stm2.setInt(3, shopID);
                stm2.execute();
                user.updateCart();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addCartItem(User user, int productID, int shopID){
        if (user == null)
            return;
        try {
            PreparedStatement stm_q = con.prepareStatement("SELECT Quantity FROM `shopproduct` WHERE ProductID = ? AND ShopID = ?"); // controllo se la quantità è > 0
            stm_q.setInt(1, productID);
            stm_q.setInt(2, shopID);
            ResultSet rs_q = stm_q.executeQuery();
            if (rs_q.next())
            {
                int maxQuantity = rs_q.getInt("Quantity");
                PreparedStatement stm = con.prepareStatement("SELECT * FROM `cart` WHERE UserID = ? AND ProductID = ? AND ShopID = ?"); // controllo se è già nel carrello
                stm.setInt(1, user.getUserID());
                stm.setInt(2, productID);
                stm.setInt(3, shopID);
                ResultSet rs = stm.executeQuery();
                if (rs.next()) { // se ce l'ho già nel carrello faccio += 1
                    int quantityInCart = rs.getInt("Quantity");
                    // se la quantità che ho in carrello è minore della quantità max del venditore posso aumentare
                    if (quantityInCart < maxQuantity){
                        PreparedStatement stm2 = con.prepareStatement("UPDATE cart SET Quantity = Quantity + 1, AddDate = NOW() WHERE UserID = ? AND ProductID = ? AND ShopID = ?");
                        stm2.setInt(1, user.getUserID());
                        stm2.setInt(2, productID);
                        stm2.setInt(3, shopID);
                        stm2.execute();
                        user.updateCart();
                    }
                }
                else // sennò lo aggiungo
                {
                    if (maxQuantity > 0) { // solo se il prodotto è disponibile aggiungo
                        PreparedStatement stm3 = con.prepareStatement("INSERT INTO cart (Quantity, AddDate, UserID, ProductID, ShopID) VALUES ('1',NOW(),?,?,?)");
                        stm3.setInt(1, user.getUserID());
                        stm3.setInt(2, productID);
                        stm3.setInt(3, shopID);
                        stm3.executeUpdate();
                        user.updateCart();
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeCartItem(User user, int productID, int shopID){
        if (user == null)
            return;
        try {
            PreparedStatement stm = con.prepareStatement("DELETE FROM cart WHERE UserID = ? AND ProductID = ? AND ShopID = ?");
            stm.setInt(1, user.getUserID());
            stm.setInt(2, productID);
            stm.setInt(3, shopID);
            stm.execute();
            user.updateCart();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private User extractUserFromResultSet(ResultSet rs) throws SQLException {
        if(!rs.next()){
            return null;
        }
        User user = new User();
        user.setUserID(rs.getInt("UserID"));
        user.setFirstName(rs.getString("FirstName"));
        user.setLastName(rs.getString("LastName"));
        user.setEmail(rs.getString("Email"));
        user.setType(rs.getInt("Type"));
        user.updateShopID();
        user.updateCart();
        user.setPrivacy(rs.getInt("Privacy"));
        return user;
    }

    private CartItem extractCartItemFromResultSet(ResultSet rs) throws SQLException {
        if(!rs.next()){
            return null;
        }
        int productID = rs.getInt("ProductID");
        int shopID = rs.getInt("ShopID");
        Product p = new ProductDaoImpl().getProduct(productID,shopID);
        CartItem item = new CartItem();
        item.put(p,rs.getInt("Quantity"), rs.getInt("AddressID"));
        return item;
    }

    @Override
    public boolean register(String firstname, String lastname, String email, String password) {
        if (firstname.isEmpty() || lastname.isEmpty() || email.isEmpty() | password.isEmpty())
            return false;

        // controllo che non ci siano utenti già presenti con la stessa mail
        try {
            PreparedStatement stm = this.con.prepareStatement("SELECT * FROM user U WHERE U.Email = ? AND U.EmailConfirm = 'yes'");
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (extractUserFromResultSet(rs) != null){
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String emailToken = Utils.sendVerificationEmail(firstname, lastname, email);
        if(emailToken == null){
            System.out.println("[ERROR] Si è verificato un errore con la connessione SMTP ai server Google");
            return false;
        }
        try {
            // TODO: Da aggiungere un campo al db con un tempo per fare scadere il token dopo un tot
            PreparedStatement stm = this.con.prepareStatement("INSERT INTO user (UserID,FirstName,LastName,Email,Password,Type,Privacy,EmailConfirm) VALUES (NULL,?,?,?,?,0,0,?)");
            stm.setString(1, firstname);
            stm.setString(2, lastname);
            stm.setString(3, email);
            stm.setString(4, password);
            stm.setString(5, emailToken);
            int result = stm.executeUpdate();
            return result != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean acceptPrivacy (User user){
        try {
            PreparedStatement stm = this.con.prepareStatement("UPDATE user SET Privacy = 1 WHERE UserID = ?");
            stm.setInt(1, user.getUserID());
            int result = stm.executeUpdate();
            return result != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User getUser(int userID) {
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM user WHERE UserID = ?");
            stm.setInt(1,userID);
            ResultSet rs = stm.executeQuery();
            return extractUserFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean confirm(String token) {
        User user = null;
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM user WHERE EmailConfirm = ?");
            stm.setString(1,token);
            ResultSet rs = stm.executeQuery();
            user = extractUserFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(user != null){
            try {
                PreparedStatement stm = this.con.prepareStatement("UPDATE user SET EmailConfirm = 'yes' WHERE UserID = ?");
                stm.setInt(1, user.getUserID());
                int result = stm.executeUpdate();
                return result != 0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /**
     *
     * @param user
     * @param cookies
     * @return -1: cookie vuoto o assente, situazione invariata
     *          0: errore nel parsing del cookie
     *          x>0: quantità di prodotti successivamente integrati
     */
    @Override
    public int cookieToCart(User user, Cookie[] cookies) {

        Cookie products = null;
        for (Cookie c:cookies) {
            if (c.getName().equals("cartproducts")){
                products = c;
            }
        }

        if(products == null || products.getValue().isEmpty()){
            return -1; //non c'è niente da aggiungere, da considerare come operazione andata a "buon fine"
        }

        ArrayList<Pair<Integer,Integer>> legitProducts = new ArrayList<>();

        String[] productList = products.getValue().split("\\|");
        for(String prod : productList){
            String[] prodinfo = prod.split("_");

            if(prodinfo.length == 4) {
                for (int i = 0; i < Integer.parseInt(prodinfo[3]); i++) {
                    try {
                        int productID = Integer.parseInt(prodinfo[0]);
                        int shopID = Integer.parseInt(prodinfo[2]);
                        legitProducts.add(new Pair<>(productID,shopID));
                    } catch (NumberFormatException e){
                        return 0;
                        //e.printStackTrace();
                    }

                }
            }
        }

        for(Pair<Integer,Integer> p: legitProducts) {
            addCartItem(user, p.getKey(), p.getValue());
        }

        return legitProducts.size();
    }
}
