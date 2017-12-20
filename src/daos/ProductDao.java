package daos;

import main.Product;
import main.ProductGroup;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public interface ProductDao extends Serializable {
    /**
     *  ritorna un oggetto prodotto con tutte le info sul venditore specifico
     *
     * @param productID     id prodotto da pigliare
     * @param shopID        id shop che vende il prodotto
     * @return              ritorna il prodotto con tutte le info sul venditore
     */
    Product getProduct(int productID, int shopID);
    ArrayList<Product> allProducts();

    /**
     * Ottiene la lista dei prodotti dal DB in base ai parametri, organizzati in gruppi di prodotti dallo stesso nome
     * @param params Mappa contenente tutti i parametri ottenuti precedentemente dal GET
     * @return Mappa contenente i singoli shopProduct raggruppati come product (ProductGroup in java)
     * @throws SQLException nel caso qualcosa non andasse come previsto nel database
     */
    Map<String, ProductGroup> getProducts(Map params) throws SQLException;

    boolean checkAvailability(int productID, int shopID, Integer quantity);

    boolean reduceAvailability(int productID, int shopID, Integer quantity);

    boolean updateProductRating(int productID);

    ArrayList<String> getImages(int productID);

    String getAutocompleteProducts(String term);
}
