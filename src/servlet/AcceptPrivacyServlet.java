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

@WebServlet(name = "AcceptPrivacyServlet", urlPatterns = {"/restricted/acceptprivacy"})
public class AcceptPrivacyServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        UserDao userDao = new UserDaoImpl();
        boolean result = userDao.acceptPrivacy(user);
        if (result) {
            user.setPrivacy(1);
            response.sendRedirect("/restricted/profile.jsp?action=privacy_accepted");
        }
        else{
            response.sendRedirect("/restricted/profile.jsp?error=Privacy non settata");
        }
    }
}
