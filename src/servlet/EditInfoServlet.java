package servlet;

import daos.UserDao;
import daos.impl.UserDaoImpl;
import db.DBManager;
import main.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "EditInfoServlet", urlPatterns = {"/editinfo"})
public class EditInfoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String email = request.getParameter("Email");
        System.out.println("Parametri: " + firstName + " " + lastName + " " + email);
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (!firstName.isEmpty()){
            user.setFirstName(firstName);
        }
        if (!lastName.isEmpty()){
            user.setLastName(lastName);
        }
        if (!email.isEmpty()){
            user.setEmail(email);
        }
        UserDao userDao = new UserDaoImpl();
        if (userDao.editInfo(user)){
            System.out.println("[ " + user.getFirstName() + " ] Info modificate");
            response.sendRedirect(request.getContextPath() + "/profile.jsp");
        }
        else {
            // metto il messaggio di errore come attributo di Request, così nel JSP si vede il messaggio
            request.setAttribute("message", "Info non modificate!");
            RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
            rd.forward(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
