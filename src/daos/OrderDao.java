package daos;

import main.Order;
import main.User;

import java.io.Serializable;
import java.util.ArrayList;

public interface OrderDao extends Serializable {

    ArrayList<Order> getAllOrders(User user);

    boolean setOrderAddresses(User user, String address, ArrayList<String> ritironegozio);

    int createOrder(User user, int paymentID);

    boolean cleanCart(User user);
}
