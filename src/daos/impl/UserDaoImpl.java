package daos.impl;

import daos.UserDao;
import db.DBManager;
import main.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        user.setPrivacy(rs.getInt("Privacy"));
        return user;
    }
}
