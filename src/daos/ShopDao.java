package daos;

import main.Shop;

import java.io.Serializable;

public interface ShopDao extends Serializable {
    /**
     *  ritorna un oggetto Shop con tutte le info sul venditore
     *
     * @param shopID        id shop che vende il prodotto
     * @return              ritorna lo shop
     */
    Shop getShop(int shopID);
}
