package servlet;

import daos.ShopDao;
import daos.impl.ShopDaoImpl;
import main.PhysicalShop;
import main.Shop;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "EditShopInfoServlet", urlPatterns = {"/restricted/editshopinfo"})
public class EditShopInfoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String shopName = request.getParameter("ShopName");
        String shopDescription = request.getParameter("ShopDescription");
        String shopWebsite = request.getParameter("ShopWebsite");
        String shopAddress = request.getParameter("ShopAddress");
        String shopCity = request.getParameter("ShopCity");
        String shopCAP = request.getParameter("ShopCAP");

        System.out.println("Parametri: " + shopName + " " + shopDescription + " " + shopWebsite + " " + shopAddress + " " + shopCity + " " + shopCAP);
        HttpSession session = request.getSession(false);
        Shop shop = (Shop) session.getAttribute("shop");
        boolean isPhysical = false;
        if (!shopName.isEmpty()){
            shop.setName(shopName);
        }
        if (!shopDescription.isEmpty()){
            shop.setDescription(shopDescription);
        }
        if (!shopWebsite.isEmpty()) {
            shop.setWebsite(shopWebsite);
        }
        if (shop instanceof PhysicalShop) {
            isPhysical = true;
            if (!shopAddress.isEmpty()) {
                ((PhysicalShop) shop).setAddress(shopAddress);
            }
            if (!shopCity.isEmpty()) {
                ((PhysicalShop) shop).setCity(shopCity);
            }
            if (!shopCAP.isEmpty()) {
                ((PhysicalShop) shop).setZip(shopCAP);
            }
        }
        ShopDao shopDao = new ShopDaoImpl();
        if (isPhysical) {
            if (shopDao.editPhysicalInfo((PhysicalShop) shop)) {
                System.out.println("[ " + shop.getName() + " ] Info modificate");
                response.sendRedirect("/restricted/shop_panel.jsp?success=Info aggiornate");
            } else {
                response.sendRedirect("/restricted/shop_panel.jsp?warning=Info non aggiornate");
            }
        }
        else {
            if (shopDao.editInfo(shop)) {
                System.out.println("[ " + shop.getName() + " ] Info modificate");
                response.sendRedirect("/restricted/shop_panel.jsp?success=Info aggiornate");
            } else {
                response.sendRedirect("/restricted/shop_panel.jsp?warning=Info non aggiornate");
            }
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
