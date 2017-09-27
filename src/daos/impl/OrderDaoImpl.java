package daos.impl;

import daos.OrderDao;
import db.DBManager;
import main.Product;
import main.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class OrderDaoImpl implements OrderDao {
    private Connection con;

    public OrderDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public Map<Integer, Product> getAllOrders(User user) {

        // DA FARE

        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM orderlist INNER JOIN ordertable USING(OrderID) WHERE UserID = ?");
            stm.setInt(1,user.getUserID());
            ResultSet rs = stm.executeQuery();


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
