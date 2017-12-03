package daos;

import main.Payment;
import main.User;

import java.io.Serializable;

public interface PaymentDao extends Serializable {

    Payment createPayment(User user, String cardHolder, String cardNumber, String expiryDate, int cvv);
}
