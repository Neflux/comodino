package servlet;

import daos.impl.UserDaoImpl;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("[INFO] Registrazione: " + firstname + " " + lastname + ", " + email + " " + password);
        if (firstname.isEmpty() || lastname.isEmpty() || email.isEmpty() || password.isEmpty()){
            response.sendRedirect("/index.jsp?action=register_error");
            return;
        }

        User user = new UserDaoImpl().register(firstname, lastname, email, password);
        // se non esiste, ridirigo verso pagina di login con messaggio di errore
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?action=email_already_in_use_error");
            return;
        }
        else {
            // imposto l'utente connesso come attributo di sessione
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);

            // mando un redirect alla servlet che carica i prodotti
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

}
