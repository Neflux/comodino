package servlet;

import daos.impl.AddressDaoImpl;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "AddAddressServlet", urlPatterns = {"/restricted/addaddress"})
public class AddAddressServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession(false).getAttribute("user");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String zip = request.getParameter("zip");
        String state = request.getParameter("state");
        String phonenumber = request.getParameter("phonenumber");
        if(firstname == null || lastname == null || address == null || city == null || zip == null || state == null || phonenumber == null){
            response.sendRedirect("add_address.jsp?error=Completa tutti i campi");
        }
        boolean result = new AddressDaoImpl().addAddress(user.getUserID(),firstname,lastname,address,city,zip,state,phonenumber);
        if (!result){
            response.sendRedirect("add_address.jsp?error=Errore in fase di inserimento, riprova.");
            return;
        }
        response.sendRedirect("add_address.jsp?success=Indirizzo aggiunto!");

    }
}