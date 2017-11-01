package servlet;

import daos.UserDao;
import daos.impl.UserDaoImpl;
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

@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/changepassword"})
public class ChangePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String curPwd = request.getParameter("CurrentPassword");
        String newPwd = request.getParameter("NewPassword");
        String repeatPwd = request.getParameter("RepeatPassword");
        System.out.println("Parametri: " + curPwd + " " + newPwd + " " + repeatPwd);
        if (Objects.equals(newPwd, repeatPwd)){
            HttpSession session = request.getSession(false);
            User user = (User) session.getAttribute("user");
            UserDao userDao = new UserDaoImpl();
            if (userDao.changePwd(user,curPwd,newPwd)){
                System.out.println("[ " + user.getFirstName() + " ] Password modificata");
                response.sendRedirect("/restricted/profile.jsp");
            }
            else {
                // metto il messaggio di errore come attributo di Request, così nel JSP si vede il messaggio
                request.setAttribute("message", "Password attuale errata o mancante!");
                RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
                rd.forward(request, response);
            }
        }
        else{
            // metto il messaggio di errore come attributo di Request, così nel JSP si vede il messaggio
            request.setAttribute("message", "Le password non coincidono!");
            RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
            rd.forward(request, response);
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
