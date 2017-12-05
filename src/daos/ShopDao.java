package daos;

import main.Product;
import main.ProductGroup;
import main.Shop;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

public interface ShopDao extends Serializable {

    /**
     *  ritorna un oggetto Shop con tutte le info sul venditore
     *
     * @param shopID        id shop che vende il prodotto
     * @return              ritorna lo shop
     */
    Shop getShop(int shopID);

    HashMap<String, ProductGroup> getShopProducts(String id);

    ArrayList<Shop> getPhysicalShopsByProduct (int productID);

    ArrayList<Product> obtainExpiringProducts (int id);

}
