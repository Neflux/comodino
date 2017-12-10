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
            response.sendRedirect("/index.jsp?error=Alcuni campi sono rimasti vuoti");
            return;
        }
        boolean successfulRegistration = new UserDaoImpl().register(firstname, lastname, email, password);
        // se non esiste, ridirigo verso pagina di login con messaggio di errore
        if (!successfulRegistration) {
            // TODO: non è carino che venga questo messaggio anche nel caso in cui l'SMTP dà problemi, da fixare
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=Email già in uso");
        }
        else {
            response.sendRedirect(request.getContextPath() + "/index.jsp?success=Registrazione effettuata! Controlla la mail "+email);
        }
    }

}
