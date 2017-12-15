package servlet;

import daos.impl.ShopDaoImpl;
import daos.impl.UserDaoImpl;
import main.User;
import main.Shop;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("email") == null || request.getParameter("password") == null){
            response.sendRedirect("/index.jsp?error=Parametri Mancanti");
            return;
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("Parametri: " + email + " " + password);

        // controllo nel DB se esiste un utente con lo stesso username + password
        User user = new UserDaoImpl().authUser(email,password);
        // se non esiste, ridirigo verso pagina di login con messaggio di errore
        if (user == null) {
            // TODO: bruttissimo che non sappia la differenza tra username/password errati e email ancora da verificare
            response.sendRedirect("/index.jsp?error=Username o password errati");
        }
        else {
            // imposto l'utente connesso come attributo di sessione
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            if (user.hasShop()) {
                Shop shop = new ShopDaoImpl().getShop(user.getShopID());
                session.setAttribute("shop", shop);
            }
            // mando un redirect alla servlet che carica i prodotti
            response.sendRedirect("/index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp?error=Percorso invalido");
    }
}
