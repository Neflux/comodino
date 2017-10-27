package daos.impl;

import daos.NotificationDao;
import db.DBManager;
import main.NotificationDispute;
import main.Notification;
import main.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NotificationDaoImpl implements NotificationDao {
    private Connection con;

    public NotificationDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public ArrayList<Notification> getNotifications(User user) {
        ArrayList<Notification> notifications = new ArrayList<>();
        notifications.addAll(getRewiewNotifications(new UserDaoImpl().getShopID(user)));
        notifications.addAll(getDisputeNotifications(new UserDaoImpl().getShopID(user)));
        return notifications;
    }

    @Override
    public ArrayList<Notification> getRewiewNotifications(int shopID){
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM reviewnotification WHERE ShopID = ?");
            stm.setInt(1, shopID);
            ResultSet rs = stm.executeQuery();
            return extractRewiewNotificationFromResultSet(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private ArrayList<Notification> extractRewiewNotificationFromResultSet(ResultSet rs) {
        ArrayList<Notification> notifications = new ArrayList<>();

        try {
            while (rs.next()){
                Notification n = new Notification();
                n.setShopId(rs.getInt("ShopID"));
                n.setCreationDate(rs.getTimestamp("CreationDate"));
                n.setShopStatus(rs.getInt("ShopStatus"));

                notifications.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

    @Override
    public ArrayList<Notification> getDisputeNotifications(int shopID){
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM disputenotification WHERE ShopID = ?");
            stm.setInt(1, shopID);
            ResultSet rs = stm.executeQuery();
            return extractDisputeNotificationFromResultSet(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private ArrayList<Notification> extractDisputeNotificationFromResultSet(ResultSet rs) {
        ArrayList<Notification> notifications = new ArrayList<>();

        try {
            while (rs.next()){
                NotificationDispute n = new NotificationDispute();
                n.setShopId(rs.getInt("ShopID"));
                n.setCreationDate(rs.getTimestamp("CreationDate"));
                n.setShopStatus(rs.getInt("ShopStatus"));
                n.setAdminStatus(rs.getInt("AdminStatus"));
                n.setOrderId(rs.getInt("OrderID"));
                n.setProductId(rs.getInt("ProductID"));

                notifications.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

}
