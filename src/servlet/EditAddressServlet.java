package servlet;

import daos.UserDao;
import daos.impl.UserDaoImpl;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditAddressServlet", urlPatterns = {"/restricted/editaddress"})
public class EditAddressServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String addressID = request.getParameter("AddressID");
        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String address = request.getParameter("Address");
        String city = request.getParameter("City");
        String zip = request.getParameter("Zip");
        String phone = request.getParameter("Phone");
        System.out.println("Parametri: " + firstName + " " + lastName + " " + address + " ecc...");
        User user = (User) request.getSession().getAttribute("user");
        if(addressID.isEmpty() || firstName.isEmpty() || lastName.isEmpty() || address.isEmpty() || city.isEmpty() || zip.isEmpty() || phone.isEmpty()) {
            System.out.println("[INFO] EditAddress: Missing parameters");
            response.sendRedirect("/restricted/add_address.jsp?error=Parametri mancanti");
            return;
        }
        UserDao userDao = new UserDaoImpl();
        if (userDao.editAddress(user,addressID,firstName,lastName,address,city,zip,phone)){
            System.out.println("[INFO] EditAddress: Address edited");
            response.sendRedirect("/restricted/add_address.jsp?success=Indirizzo aggiornato");
        }
        else {
            System.out.println("[INFO] EditAddress: Internal error, address not edited");
            response.sendRedirect("/restricted/add_address.jsp?warning=Indirizzo non aggiornato, riprova...");
        }
    }
}
