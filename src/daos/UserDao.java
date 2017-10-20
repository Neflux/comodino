package daos;

import javafx.util.Pair;
import main.Product;
import main.User;

import java.io.Serializable;
import java.util.ArrayList;

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

    boolean hasShop(User user);

    ArrayList<Pair<Product, Integer>> getCart(User user);

}
