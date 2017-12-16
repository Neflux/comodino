package servlet;

import daos.ShopDao;
import daos.UserDao;
import daos.impl.ShopDaoImpl;
import daos.impl.UserDaoImpl;
import main.Product;
import main.Shop;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "EditProductQuantityServlet", urlPatterns = {"/restricted/editproductquantity"})
public class EditProductQuantityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String quantity = request.getParameter("Quantity");
        String ID = request.getParameter("productID");
        System.out.println("ID PRODOTTO DA EDITARE: " + ID);
        int id = Integer.parseInt(ID);
        System.out.println("Parametri: "+ id + " " + quantity);
        HttpSession session = request.getSession(false);
        Shop shop = (Shop) session.getAttribute("shop");
        if (!quantity.isEmpty()){
            int qty = Integer.parseInt(quantity);
            ShopDao shopDao = new ShopDaoImpl();
            ArrayList<Product> products = shopDao.obtainProducts(shop.getShopID());
            for (Product product:products) {
                if (product.getProductID() == id) {
                    product.setQuantity(qty);
                    shopDao.editShopProduct(product, shop.getShopID());
                }
            }
            response.sendRedirect("/restricted/vendor/inventory.jsp?success=Quantita' aggiornata");
        }
        else
            response.sendRedirect("/restricted/vendor/inventory.jsp?success=Nessuna modifica effettuata");

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
