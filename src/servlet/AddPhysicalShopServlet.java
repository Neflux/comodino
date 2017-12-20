package servlet;


import daos.ShopDao;
import daos.impl.ShopDaoImpl;
import main.Shop;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddPhysicalShopServlet", urlPatterns = {"/restricted/vendor/addphysicalshop"})
public class AddPhysicalShopServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Address = request.getParameter("ShopAddress");
        String City = request.getParameter("ShopCity");
        String ZIP = request.getParameter("ShopCAP");
        String State = request.getParameter("ShopCountry");
        String Hours = request.getParameter("ShopHours");
        System.out.println("Parametri:" + Address + " " + City + " " + ZIP);
        HttpSession session = request.getSession(false);
        Shop shop = (Shop) session.getAttribute("shop");
        ShopDao shopDao = new ShopDaoImpl();
        if(shopDao.addPhysicalShop(shop.getShopID(), Address, City, ZIP, State, Hours)) {
            response.sendRedirect("/restricted/vendor/shop_panel.jsp?success=Negozio fisico creato con successo");
        }
        else {
            response.sendRedirect("/restricted/profile.jsp?warning=Creazione negozio fisico non riuscita");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
