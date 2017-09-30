package daos.impl;

import daos.AddressDao;
import db.DBManager;
import main.Address;
import main.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AddressDaoImpl implements AddressDao {
    private Connection con;

    public AddressDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public Address getAddress(int addressID) {
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM shippingaddress WHERE AddressID = ?");
            stm.setInt(1, addressID);
            ResultSet rs = stm.executeQuery();
            System.out.println("");
            Address address = extractAddressFromResultSet(rs);
            System.out.println("[ INFO ] " + (address != null ? address.toString() : "Address is NULL"));
            return address;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    private Address extractAddressFromResultSet(ResultSet rs) throws SQLException {
        if(!rs.next()){
            return null;
        }
        Address address = new Address();
        address.setAddressID(rs.getInt("AddressID"));
        address.setUserID(rs.getInt("UserID"));
        address.setAddress(rs.getString("Address"));
        address.setFirstName(rs.getString("FirstName"));
        address.setLastName(rs.getString("LastName"));
        address.setCity(rs.getString("City"));
        address.setZip(rs.getString("ZIP"));
        address.setState(rs.getString("State"));
        address.setTelephoneNumber(rs.getString("TelephoneNumber"));
        address.setActive(rs.getInt("Active"));
        return address;
    }
}
