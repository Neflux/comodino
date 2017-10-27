package daos.impl;

import daos.UserDao;
import db.DBManager;
import javafx.util.Pair;
import main.Product;
import main.User;

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
    public boolean hasShop(User user) {
        if (user == null)
            return false;
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM usershop WHERE UserID = ?");
            stm.setInt(1,user.getUserID());
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
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
    public ArrayList<Pair<Product, Integer>> getCart(User user) {
        if (user == null)
            return null;
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM cart WHERE UserID = ? ORDER BY AddDate DESC");
            stm.setInt(1,user.getUserID());
            ResultSet rs = stm.executeQuery();
            ArrayList<Pair<Product, Integer>> cart = new ArrayList<>();
            while (true){
                Pair<Product,Integer> cartItem = extractCartItemFromResultSet(rs);
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

    public void addCartItem(User user, int productID, int shopID){
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
                PreparedStatement stm2 = con.prepareStatement("UPDATE cart SET Quantity = Quantity + 1, AddDate = NOW() WHERE UserID = ? AND ProductID = ? AND ShopID = ?");
                stm2.setInt(1, user.getUserID());
                stm2.setInt(2, productID);
                stm2.setInt(3, shopID);
                stm2.execute();
                user.updateCart();
            }
            else
            {
                PreparedStatement stm3 = con.prepareStatement("INSERT INTO cart VALUES ('1',NOW(),?,?,?)");
                stm3.setInt(1, user.getUserID());
                stm3.setInt(2, productID);
                stm3.setInt(3, shopID);
                stm3.execute();
                user.updateCart();
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
        user.updateHasShop();
        user.updateCart();
        user.setPrivacy(rs.getInt("Privacy"));
        return user;
    }

    private Pair<Product, Integer> extractCartItemFromResultSet(ResultSet rs) throws SQLException {
        if(!rs.next()){
            return null;
        }
        int productID = rs.getInt("ProductID");
        int shopID = rs.getInt("ShopID");
        Product p = new ProductDaoImpl().getProduct(productID,shopID);
        return new Pair<>(p,rs.getInt("Quantity"));
    }
}
