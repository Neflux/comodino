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

        // se non esiste, ridirigo verso pagina di login con messaggio di errore
        switch(new UserDaoImpl().register(firstname, lastname, email, password)) {
            case -3:
                response.sendRedirect(request.getContextPath() + "/index.jsp?error=Errore: connessione SMPT fallita");
                break;
            case -2:
                response.sendRedirect(request.getContextPath() + "/index.jsp?error=Errore: alcuni campi sono rimasti vuoti");
                break;
            case -1: case 0:
                response.sendRedirect(request.getContextPath() + "/index.jsp?error=Errore: email gia' in uso");
                break;
            case 1:
                response.sendRedirect(request.getContextPath() + "/index.jsp?success=Registrazione effettuata! Controlla la mail "+email);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/index.jsp?error=Errore interno del server");
                break;
        }
    }
}
