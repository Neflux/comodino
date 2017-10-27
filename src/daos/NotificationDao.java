package daos;

import daos.impl.NotificationDaoImpl;
import main.Notification;
import main.User;

import java.io.Serializable;
import java.util.ArrayList;

public interface NotificationDao extends Serializable {

    ArrayList<Notification> getNotifications(User user);

    ArrayList<Notification> getRewiewNotifications(int shopID);

    ArrayList<Notification> getDisputeNotifications(int shopID);

}