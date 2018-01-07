package servlet;

import daos.ReviewDao;
import daos.ShopDao;
import daos.impl.NotificationDaoImpl;
import daos.impl.ReviewDaoImpl;
import daos.impl.ShopDaoImpl;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "OpenShopReviewServlet", urlPatterns = {"/restricted/openshopreview"})
public class OpenShopReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("[INFO] OpenReview Servlet: Entered");
        if(request.getParameter("title") == null || request.getParameter("description") == null || request.getParameter("rating") == null || request.getParameter("shopID") == null ){
            response.sendRedirect("/index.jsp?error=Parametri Mancanti");
            return;
        }
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        System.out.println(description);
        int rating = 0;
        try {
            rating = Integer.parseInt(request.getParameter("rating"));
        }
        catch (Exception ignored){}

        int shopID = Integer.parseInt(request.getParameter("shopID"));
        int userID = ((User)request.getSession(false).getAttribute("user")).getUserID();

        System.out.println("\tDispute ProductID: " + shopID + " UserID: " + userID +
                "\n\tTitle: " + title +
                "\n\tDescription: " + description +
                "\n\tRating: " + rating
        );

        ReviewDao reviewDao = new ReviewDaoImpl();
        boolean result;
        int newReviewID = reviewDao.createShopReview(title, description, rating, shopID, userID);
        if (newReviewID != 0){
            result = new NotificationDaoImpl().createShopReviewNotification(userID, shopID, title, rating);
            ShopDao pd = new ShopDaoImpl();
            result = result && pd.updateShopRating(shopID);
        }
        else{ // la creazione della recensione è fallita
            response.sendRedirect("/index.jsp?error=Errore Creazione Recensione");
            return;
        }
        if(!result){ // la creazione della notifica della disputa è fallita
            response.sendRedirect("/index.jsp?error=Errore Creazione Notifica Recensione");
            return;
        }
        System.out.println("[INFO] OpenReview Servlet: Shop review created.");
        response.sendRedirect("/shop.jsp?id=" + shopID + "&success=Recensione creata!");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
