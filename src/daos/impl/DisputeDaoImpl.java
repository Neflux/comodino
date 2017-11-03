package daos.impl;

import daos.DisputeDao;
import db.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DisputeDaoImpl implements DisputeDao {
    private Connection con;

    public DisputeDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public boolean createDispute(int orderID, int productID, int shopID, String title, String description) {
        try {
            PreparedStatement stm = con.prepareStatement("INSERT INTO dispute (Title, Status, Description, OrderID, ProductID, ShopID) VALUES (?,0,?,?,?,?)");
            stm.setString(1, title);
            stm.setString(2, description);
            stm.setInt(3, orderID);
            stm.setInt(4, productID);
            stm.setInt(5, shopID);

            int result = stm.executeUpdate();
            if (result == 0){
                return false;
            }
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
