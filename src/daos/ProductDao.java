package daos;

import main.Product;

import java.io.Serializable;

public interface ProductDao extends Serializable {
    /**
     *  ritorna un oggetto prodotto con tutte le info sul venditore specifico
     *
     * @param productID     id prodotto da pigliare
     * @param shopID        id shop che vende il prodotto
     * @return              ritorna il prodotto con tutte le info sul venditore
     */
    Product getProduct(int productID, int shopID);
}
