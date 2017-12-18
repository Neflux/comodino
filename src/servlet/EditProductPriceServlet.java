package servlet;

import daos.ShopDao;
import daos.impl.ShopDaoImpl;
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

@WebServlet(name = "EditProductPriceServlet", urlPatterns = {"/restricted/vendor/editproductprice"})
public class EditProductPriceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String price = request.getParameter("Price");
        String discount = request.getParameter("Discount");
        System.out.println("Stampo productID: " + request.getParameter("productID"));
        int id = Integer.parseInt(request.getParameter("productID"));
        System.out.println("Parametri: "+ id + " " + price + " " + discount);
        HttpSession session = request.getSession(false);
        Shop shop = (Shop) session.getAttribute("shop");
        if (!price.isEmpty() || !discount.isEmpty()){
            float pr = Float.parseFloat(price);
            float ds = Float.parseFloat(discount);
            ShopDao shopDao = new ShopDaoImpl();
            ArrayList<Product> products = shopDao.obtainProducts(shop.getShopID());
            for (Product product:products) {
                if (product.getProductID() == id) {
                    if (!price.isEmpty())
                        product.setPrice(pr);
                    if(!discount.isEmpty())
                        product.setDiscount(ds);
                    shopDao.editShopProduct(product, shop.getShopID());
                }
            }

            response.sendRedirect("inventory.jsp?success=Prezzo aggiornato");
        }
        else
            response.sendRedirect("inventory.jsp?success=Nessuna modifica effettuata");

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
