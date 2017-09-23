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
            PreparedStatement ps = this.con.prepareStatement("SELECT * FROM user U WHERE U.Email = ? AND U.password = ? AND U.EmailConfirm = 'yes'");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return extractUserFromResultSet(rs);
            } else {
                return null;
            }
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
            PreparedStatement ps = this.con.prepareStatement("UPDATE user SET Password = ? WHERE UserID = ?");
            ps.setString(1, newPwd);
            ps.setInt(2, user.getUserID());
            int i = ps.executeUpdate();
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
            PreparedStatement ps = this.con.prepareStatement("UPDATE user SET FirstName = ?, LastName = ?, Email = ? WHERE UserID = ?");
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setInt(4, user.getUserID());
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private User extractUserFromResultSet(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserID(rs.getInt("UserID"));
        user.setFirstName(rs.getString("FirstName"));
        user.setLastName(rs.getString("LastName"));
        user.setEmail(rs.getString("Email"));
        user.setType(rs.getInt("Type"));
        user.setPrivacy(rs.getInt("Privacy"));
        return user;
    }
}
