package daos;

import main.ProductGroup;
import main.Shop;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Map;

public interface ShopDao extends Serializable {
    /**
     *  ritorna un oggetto Shop con tutte le info sul venditore
     *
     * @param shopID        id shop che vende il prodotto
     * @return              ritorna lo shop
     */
    Shop getShop(int shopID);

    Map<String, ProductGroup> getProducts(String id) throws SQLException;
}
