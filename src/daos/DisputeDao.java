package daos;

import java.io.Serializable;

public interface DisputeDao extends Serializable {

    boolean createDispute(int orderID, int productID, int shopID, String title, String description);
}
