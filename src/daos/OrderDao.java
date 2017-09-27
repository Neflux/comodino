package daos;

import main.User;

import java.io.Serializable;
import java.util.ArrayList;

public interface OrderDao extends Serializable {

    ArrayList getAllOrders(User user);

}
