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
import java.util.Comparator;

public class NotificationDaoImpl implements NotificationDao {
    private Connection con;

    private boolean DEBUG = false;

    public NotificationDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public ArrayList<Notification> getVendorNotifications(User user) {
        ArrayList<Notification> notifications = new ArrayList<>();
        notifications.addAll(getReviewNotifications(new UserDaoImpl().getShopID(user)));
        notifications.addAll(getDisputeNotifications(new UserDaoImpl().getShopID(user)));
        Comparator<Notification> dateComparator = Comparator.comparing(Notification::getCreationDate);
        notifications.sort(dateComparator.reversed());
        printNotifications(notifications, DEBUG);
        return notifications;
    }

    @Override
    public ArrayList<Notification> getAdminNotifications() {
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM disputenotification ORDER BY CreationDate DESC");
            ResultSet rs = stm.executeQuery();
            ArrayList<Notification> notifications = extractDisputeNotificationFromResultSet(rs);
            printNotifications(notifications, DEBUG);
            return notifications;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Notification> getReviewNotifications(int shopID){
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM reviewnotification WHERE ShopID = ? ORDER BY CreationDate DESC");
            stm.setInt(1, shopID);
            ResultSet rs = stm.executeQuery();
            ArrayList<Notification> notifications = extractReviewNotificationFromResultSet(rs);
            printNotifications(notifications, DEBUG);
            return notifications;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Notification> getDisputeNotifications(int shopID){
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM disputenotification WHERE ShopID = ? ORDER BY CreationDate DESC");
            stm.setInt(1, shopID);
            ResultSet rs = stm.executeQuery();
            ArrayList<Notification> notifications = extractDisputeNotificationFromResultSet(rs);
            printNotifications(notifications, DEBUG);
            return notifications;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean createDisputeNotification(String title, int orderID, int productID, int shopID) {
        try {
            PreparedStatement stm = con.prepareStatement("INSERT INTO disputenotification (Title, OrderID, ProductID, ShopID, AdminStatus, ShopStatus) VALUES (?,?,?,?,0,0)");
            stm.setString(1, title);
            stm.setInt(2, orderID);
            stm.setInt(3, productID);
            stm.setInt(4, shopID);

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

    private ArrayList<Notification> extractReviewNotificationFromResultSet(ResultSet rs) {
        ArrayList<Notification> notifications = new ArrayList<>();

        try {
            while (rs.next()){
                Notification n = new Notification();
                n.setTitle(rs.getString("Title"));
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

    private ArrayList<Notification> extractDisputeNotificationFromResultSet(ResultSet rs) {
        ArrayList<Notification> notifications = new ArrayList<>();

        try {
            while (rs.next()){
                NotificationDispute n = new NotificationDispute();
                n.setTitle(rs.getString("Title"));
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

    private void printNotifications(ArrayList<Notification> a, boolean DEBUG){
        if (!DEBUG)
            return;
        for (Notification n: a){
            System.out.println("Notification:");
            System.out.println("    Creation date: " + n.getCreationDate());
            System.out.println("    Shop ID: " + n.getShopId());
            System.out.println("    Shop Status: " + n.getShopStatus());
            System.out.flush();
        }
    }
}
