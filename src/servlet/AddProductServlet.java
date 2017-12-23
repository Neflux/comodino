package servlet;

import daos.ProductDao;
import daos.ShopDao;
import daos.impl.ProductDaoImpl;
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

@WebServlet(name = "AddProductServlet", urlPatterns = {"/restricted/vendor/addproduct"})
public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        HttpSession session = request.getSession(false);
        Shop shop = (Shop) session.getAttribute("shop");
        ArrayList<Product> shopProducts = shop.getProducts();
        boolean found = false;
        Product tmp = new Product();
        for (Product product : shopProducts) {
            if (product.getProductName().equals(productName)) {
                found = true;
            }
        }
        if (found)
            response.sendRedirect("inventory.jsp?warning=Esiste gia' un prodotto con questo nome. Modifica la quantita'");
        else {
            ProductDao productDao = new ProductDaoImpl();
            int productID = productDao.checkProductStatus(shop.getShopID(), productName);
            if (productID > 0) {
                productDao.restoreProduct(shop.getShopID(), productID);
                response.sendRedirect("inventory.jsp?success=Prodotto gia' presente in passato. Reinserito in inventario.");
            }
            else {
                response.sendRedirect("inventory.jsp?warning=WIP");
            }
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
