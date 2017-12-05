package servlet;

import daos.impl.AddressDaoImpl;
import daos.impl.NotificationDaoImpl;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "ReadNotificationsServlet", urlPatterns = {"/restricted/readnotifications"})
public class ReadNotificationsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession(false).getAttribute("user");
        boolean result = new NotificationDaoImpl().readNotifications(user);
        if (!result){
            response.sendRedirect("add_address.jsp?error=Errore in fase di inserimento, riprova.");
            return;
        }
        response.sendRedirect("add_address.jsp?success=Indirizzo aggiunto!");

    }
}