package daos;

import main.User;

import java.io.Serializable;

public interface UserDao extends Serializable {
    /**
     *
     * @param email     email utente
     * @param password  password utente
     * @return          restituisce l'utente se si è autenticato con successo, 'null' altrimenti
     */
    public User authUser(String email, String password);

    /**
     *
     * @param u         utente al quale modificare la password
     * @param curPwd    password attuale
     * @param newPwd    nuova password
     * @return          'true' se la modifica è avvenuta con successo, 'false' altrimenti
     */
    public boolean changePwd(User u, String curPwd, String newPwd);
}
