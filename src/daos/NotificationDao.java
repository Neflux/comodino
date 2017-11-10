package daos;

import daos.impl.NotificationDaoImpl;
import main.Notification;
import main.User;

import java.io.Serializable;
import java.util.ArrayList;

public interface NotificationDao extends Serializable {

    ArrayList<Notification> getVendorNotifications(User user);

    ArrayList<Notification> getAdminNotifications();

    ArrayList<Notification> getReviewNotifications(int shopID);

    ArrayList<Notification> getDisputeNotifications(int shopID);

    boolean createDisputeNotification(String title, int orderID, int productID, int shopID);
}