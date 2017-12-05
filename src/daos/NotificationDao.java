package daos;

import main.Notification;
import main.User;

import java.io.Serializable;
import java.util.ArrayList;

public interface NotificationDao extends Serializable {

    boolean createProductReviewNotification(int reviewID, String title, int rating);

    boolean createDisputeNotification(String title, int orderID, int productID, int shopID);

    ArrayList<Notification> getVendorNotifications(User user);

    ArrayList<Notification> getAdminNotifications();

    ArrayList<Notification> getProductReviewNotifications(int shopID);

    ArrayList<Notification> getShopReviewNotifications(int shopID);

    ArrayList<Notification> getDisputeNotifications(int shopID);

    boolean readNotifications(User user);
}