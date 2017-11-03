package servlet;


import daos.NotificationDao;
import daos.impl.NotificationDaoImpl;
import main.Notification;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


// PER TEST
@WebServlet(name = "getNotificationsServlet", urlPatterns = {"/getnotifications"})
public class getNotificationsServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NotificationDao nd = new NotificationDaoImpl();
        ArrayList<Notification> notifications = nd.getVendorNotifications((User) req.getSession(false).getAttribute("user"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
