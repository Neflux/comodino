package servlet;

import daos.ProductDao;
import daos.ReviewDao;
import daos.impl.NotificationDaoImpl;
import daos.impl.ProductDaoImpl;
import daos.impl.ReviewDaoImpl;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "OpenProductReviewServlet", urlPatterns = {"/restricted/openproductreview"})
public class OpenProductReviewServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[INFO] OpenReview Servlet: Entered");
        if(request.getParameter("title") == null || request.getParameter("description") == null || request.getParameter("rating") == null || request.getParameter("productID") == null ){
            response.sendRedirect("/index.jsp?error=Parametri Mancanti");
            return;
        }
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int rating = Integer.parseInt(request.getParameter("rating"));
        int productID = Integer.parseInt(request.getParameter("productID"));
        int userID = ((User)request.getSession(false).getAttribute("user")).getUserID();

        System.out.println("\tDispute ProductID: " + productID + " UserID: " + userID +
                "\n\tTitle: " + title +
                "\n\tDescription: " + description +
                "\n\tRating: " + rating
        );

        ReviewDao reviewDao = new ReviewDaoImpl();
        boolean result;
        int newReviewID = reviewDao.createProductReview(title, description, rating, productID, userID);
        if (newReviewID != 0){
            result = new NotificationDaoImpl().createProductReviewNotification(newReviewID, title, rating);
            ProductDao pd = new ProductDaoImpl();
            result = result ? pd.updateProductRating(productID) : false;
        }
        else{ // la creazione della recensione è fallita
            response.sendRedirect("/index.jsp?error=Errore Creazione Recensione");
            return;
        }
        if(!result){ // la creazione della notifica della disputa è fallita
            response.sendRedirect("/index.jsp?error=Errore Creazione Notifica Recensione");
            return;
        }
        System.out.println("[INFO] OpenReview Servlet: Product review created.");
        response.sendRedirect("orderhistory.jsp?success=Recensione creata!");
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp?error=Percorso invalido");
    }
}
