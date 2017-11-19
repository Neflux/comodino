package daos;

import main.Address;
import main.User;

import java.io.Serializable;
import java.util.ArrayList;

public interface AddressDao extends Serializable {

    boolean addAddress(int userID, String firstname, String lastname, String address, String city, String zip, String state, String phonenumber);

    Address getAddress(int addressID);

    ArrayList<Address> getAllAddresses(User user);

    boolean removeAddress(int addressID, int userID);
}
