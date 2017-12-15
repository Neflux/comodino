package daos;

import main.Cart;
import main.User;

import javax.servlet.http.Cookie;
import java.io.Serializable;

public interface UserDao extends Serializable {
    /**
     * Autentica l'utente se presente in database
     *
     * @param email     email utente
     * @param password  password utente
     * @return          restituisce l'utente se si è autenticato con successo, 'null' altrimenti
     */
    User authUser(String email, String password);

    /**
     * Modifica la password dell'utente autenticato se presente in database
     *
     * @param user      utente al quale modificare la password
     * @param curPwd    password attuale
     * @param newPwd    nuova password
     * @return          'true' se la modifica è avvenuta con successo, 'false' altrimenti
     */
    boolean changePwd(User user, String curPwd, String newPwd);

    /**
     * Modifica info personali dell'utente autenticato se presente in database
     *
     * @param user      utente al quale modificare le info
     * @return          'true' se la modifica è avvenuta con successo, 'false' altrimenti
     */
    boolean editInfo(User user);

    int getShopID (User user);

    Cart getCart(User user);

    void decreaseCartItem(User user, int productID, int shopID);

    void addCartItem(User user, int productID, int shopID);

    void removeCartItem(User user, int productID, int shopID);

    boolean register(String firstname, String lastname, String email, String password);

    boolean acceptPrivacy (User user);

    User getUser(int userID);

    boolean confirm(String token);

    int cookieToCart(User user, Cookie[] cookies);
}
