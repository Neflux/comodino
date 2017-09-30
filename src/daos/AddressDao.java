package daos;

import main.Address;
import main.Order;
import main.User;

import java.io.Serializable;
import java.util.ArrayList;

public interface AddressDao extends Serializable {

    Address getAddress(int addressID);
}
