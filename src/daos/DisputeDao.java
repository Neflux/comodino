package daos;

import main.Dispute;

import java.io.Serializable;
import java.util.ArrayList;

public interface DisputeDao extends Serializable {

    boolean createDispute(int orderID, int productID, int shopID, String title, String description);
    ArrayList<Dispute> allDisputes();
}
