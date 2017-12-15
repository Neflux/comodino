package daos;

import main.*;

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

    ArrayList<Product> obtainProducts(int id);

    boolean editPhysicalInfo(PhysicalShop shop);

    boolean editInfo(Shop shop);

    int createNewShop(int userID, String shopName, String shopDescription, String shopWebsite);

    boolean createNewPhysicalShop(int userID, String shopName, String shopDescription, String shopWebsite, String shopAddress, String shopCity, String shopState, String shopZIP, String shopOpeningHours);
}
