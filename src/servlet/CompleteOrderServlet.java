package servlet;

import daos.OrderDao;
import daos.ProductDao;
import daos.impl.OrderDaoImpl;
import daos.impl.PaymentDaoImpl;
import daos.impl.ProductDaoImpl;
import main.Cart;
import main.CartItem;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CompleteOrderServlet", urlPatterns = "/restricted/completeorder")
public class CompleteOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        if(request.getParameter("card-holder-name").isEmpty() ||
            request.getParameter("card-number").isEmpty() ||
            request.getParameter("expiry-month").isEmpty() ||
            request.getParameter("expiry-year").isEmpty() ||
            request.getParameter("cvv").isEmpty()){
            response.sendRedirect("/payment.jsp?error=Campi mancanti");
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

        Cart cart = user.getCart(true);
        ProductDao pd = new ProductDaoImpl();
        System.out.println("[INFO] CompleteOrder: Controllo disponibilità");
        for (CartItem item: cart){
            boolean result = pd.checkAvailability(item.getProduct().getProductID(), item.getProduct().getShopID(), item.getQuantity());
            if(!result) {
                System.out.println("[ERROR] CompleteOrder: Non sono soddisfatte le disponibilità di: " + item.getProduct().getProductID() +" shop: " + item.getProduct().getShopID());
                response.sendRedirect("cart.jsp?error=Richiesti troppi pezzi. Riduci le quantità");
                return;
            }
        }
        System.out.println("[INFO] CompleteOrder: Controllo Superato");

        // Creazione pagamento

        // TODO controllo sulla data della carta di credito che sia maggiore della data attuale
        System.out.println("[INFO] CompleteOrder: Creazione pagamento");
        int paymentID = new PaymentDaoImpl().createPayment(user, cardHolderName, cardNumber, expiryMonth+"_"+expityYear, cvv);

        // DOPO:

        // Aggiornamento quantità merce negli store

        System.out.println("[INFO] CompleteOrder: Diminuzione disponibilità");
        for (CartItem item: cart){
            boolean result = pd.reduceAvailability(item.getProduct().getProductID(), item.getProduct().getShopID(), item.getQuantity());
            if(!result) {
                System.out.println("[ERROR] CompleteOrder: Impossibile diminuire il prodotto: " + item.getProduct().getProductID() + " (" + item.getProduct().getProductName() + ")");
                response.sendRedirect("cart.jsp?error=Errore riduzione quantità");
                return;
            }
        }
        System.out.println("[INFO] CompleteOrder: Disponibilità negozi aggiornata");

        // Creazione dell'ordine dal carrello alle tabelle nel db (prodotti + pagamento)

        OrderDao od = new OrderDaoImpl();
        int orderID = od.createOrder(user, paymentID);
        if (orderID == 0){
            response.sendRedirect("cart.jsp?error=Errore grave creazione ordine");
            return;
        }

        // Rimozione tutta la merce dell'utente dal suo carrello

        boolean result = od.cleanCart(user);

        if (!result){
            response.sendRedirect("cart.jsp?error=Il carrello non è stato liberato");
            return;
        }

        response.sendRedirect("ordercompleted.jsp?orderid=" + orderID);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
