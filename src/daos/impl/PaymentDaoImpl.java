package daos.impl;

import daos.PaymentDao;
import db.DBManager;
import main.Payment;
import main.User;

import java.sql.*;

public class PaymentDaoImpl implements PaymentDao {
    private Connection con;

    public PaymentDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public Payment createPayment(User user, String cardHolder, String cardNumber, String expiryDate, int cvv) {
        try {
            PreparedStatement stm = con.prepareStatement("INSERT INTO userpayment (UserID, CardHolder, CardNumber, ExpiryDate)  VALUES (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, user.getUserID());
            stm.setString(2, cardHolder);
            stm.setString(3, cardNumber);
            stm.setString(4, expiryDate);
            stm.executeUpdate();

            ResultSet rs = stm.getGeneratedKeys();
            Payment payment = extractPaymentFromResultSet(rs);

            if (payment == null)
                return null;

            System.out.println("[INFO] Payment created: "+ payment.getCardNumber());
            return payment;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Payment extractPaymentFromResultSet(ResultSet rs) {
        try {
            if (!rs.next())
                return null;
            Payment payment = new Payment();
            payment.setPaymentID(rs.getInt("PaymentID"));
            payment.setUserID(rs.getInt("UserID"));
            payment.setCardHolder(rs.getString("CardHolder"));
            payment.setCardNumber(rs.getString("CardNumber"));
            payment.setExpiryDate(rs.getString("ExpiryDate"));
            payment.setCvv(rs.getInt("Cvv"));

            return payment;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
