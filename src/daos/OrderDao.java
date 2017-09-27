package daos;

import main.Product;
import main.User;

import java.io.Serializable;
import java.util.Map;

public interface OrderDao extends Serializable {

    Map<Integer, Product> getAllOrders(User user);

}
