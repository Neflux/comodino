package daos;

import main.Order;
import main.User;

import java.io.Serializable;
import java.util.ArrayList;

public interface OrderDao extends Serializable {

    ArrayList<Order> getAllOrders(User user);

}
