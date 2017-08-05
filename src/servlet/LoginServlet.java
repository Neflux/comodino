package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import db.User;
import db.DBManager;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    private DBManager manager;

    @Override
    public void init() throws ServletException {
        // inizializza il DBManager dagli attributi di Application
        this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("ciao!");
        System.out.println(email + " "+ password);
        // controllo nel DB se esiste un utente con lo stesso username + password
        User user;
        try {
            user = manager.authenticate(email, password);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
        // se non esiste, ridirigo verso pagina di login con messaggio di errore
        if (user == null) {
            // metto il messaggio di errore come attributo di Request, così nel JSP si vede il messaggio

            request.setAttribute("message", "email/password non esistente !");

            RequestDispatcher rd = request.getRequestDispatcher("/logindc.jsp");
            rd.forward(request, response);

        } else {
            // imposto l'utente connesso come attributo di sessione
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);

            // mando un redirect alla servlet che carica i prodotti
            response.sendRedirect(request.getContextPath() + "/Search");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
