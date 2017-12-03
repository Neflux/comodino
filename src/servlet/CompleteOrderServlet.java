package servlet;

import daos.OrderDao;
import daos.ProductDao;
import daos.impl.OrderDaoImpl;
import daos.impl.PaymentDaoImpl;
import daos.impl.ProductDaoImpl;
import daos.impl.UserDaoImpl;
import javafx.util.Pair;
import main.Cart;
import main.Payment;
import main.Product;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CompleteOrderServlet", urlPatterns = "/restricted/completeorder")
public class CompleteOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("card-holder-name") == null ||
            request.getParameter("card-number") == null ||
            request.getParameter("expiry-month") == null ||
            request.getParameter("expiry-year") == null ||
            request.getParameter("cvv") == null){
            response.sendRedirect("/payment?error=Campi mancanti");
            return;
        }

        User user = (User) request.getSession(false).getAttribute("user");
        String cardHolderName = request.getParameter("card-holder-name");
        String cardNumber = request.getParameter("card-number");
        String expiryMonth = request.getParameter("expiry-month");
        String expityYear = request.getParameter("expiry-year");
        int cvv = Integer.parseInt(request.getParameter("cvv"));

        if(cvv < 100 || cvv > 999){
            response.sendRedirect("/payment.jps?error=Cvv non valido (devono essere 3 cifre)");
            return;
        }


        // PRIMA:

        // Controllo disponibilità merce negli store

        Cart cart = new UserDaoImpl().getCart(user);
        ProductDao pd = new ProductDaoImpl();
        System.out.println("[INFO] CompleteOrder: Controllo disponibilità");
        for (Pair<Product, Integer> item: cart){
            boolean result = pd.checkAvailability(item.getKey().getProductID(), item.getKey().getShopID(), item.getValue());
            if(!result) {
                System.out.println("[ERROR] CompleteOrder: Non sono soddisfatte le disponibilità");
                response.sendRedirect("/cart.jsp?error=Richiesti troppi pezzi. Riduci le quantità");
                return;
            }
        }
        System.out.println("[INFO] CompleteOrder: Controllo Superato");

        // Creazione pagamento

        // TODO controllo sulla data della carta di credito che sia maggiore della data attuale
        System.out.println("[INFO] CompleteOrder: Creazione pagamento");
        Payment payment = new PaymentDaoImpl().createPayment(user, cardHolderName, cardNumber, expiryMonth+"_"+expityYear, cvv);

        // DOPO:

        // Aggiornamento quantità merce negli store

        System.out.println("[INFO] CompleteOrder: Diminuzione disponibilità");
        for (Pair<Product, Integer> item: cart){
            boolean result = pd.reduceAvailability(item.getKey().getProductID(), item.getKey().getShopID(), item.getValue());
            if(!result) {
                System.out.println("[ERROR] CompleteOrder: Impossibile diminuire il prodotto: " + item.getKey().getProductID() + " (" + item.getKey().getProductName() + ")");
                response.sendRedirect("/cart.jsp?error=Errore riduzione quantità");
                return;
            }
        }
        System.out.println("[INFO] CompleteOrder: Disponibilità negozi aggiornata");

        // Creazione dell'ordine dal carrello alle tabelle nel db (prodotti + pagamento)


        // Rimozione tutta la merce dell'utente dal suo carrello

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
