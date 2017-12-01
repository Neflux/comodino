package servlet;

import daos.impl.OrderDaoImpl;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "SetOrderAddressesServlet", urlPatterns = {"/restricted/setorderaddresses"})
public class SetOrderAddressesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession(false).getAttribute("user");
        String address = request.getParameter("address");
        // TODO: gestire il porcoddio di valore di ritorno della selezione multipla delle checkbox
        String ritironegozio = request.getParameter("ritironegozio");
        System.out.println("[INFO] SetAddress: " + ritironegozio);
        if(address == null){
            response.sendRedirect("checkout.jsp?error=Seleziona un indirizzo valido");
        }
        boolean result = true;// new OrderDaoImpl().setOrderAddresses();
        if (!result){
            response.sendRedirect("checkout.jsp?error=Errore in fase di inserimento, riprova.");
            return;
        }
        response.sendRedirect("add_address.jsp");

    }
}