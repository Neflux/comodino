package daos;

import main.User;

import java.io.Serializable;

public interface PaymentDao extends Serializable {

    int createPayment(User user, String cardHolder, String cardNumber, String expiryDate, int cvv);
}
