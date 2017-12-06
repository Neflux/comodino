package servlet;

import daos.UserDao;
import daos.impl.UserDaoImpl;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "EditAddressServlet", urlPatterns = {"/restricted/editaddresss"})
public class EditAddressServlet extends HttpServlet {

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
            response.sendRedirect("/restricted/profile.jsp?success=Info aggiornate");
        }
        else {
            response.sendRedirect("/restricted/profile.jsp?warning=Info non aggiornate");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
