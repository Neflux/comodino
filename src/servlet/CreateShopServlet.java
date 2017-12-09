package servlet;

import daos.impl.ShopDaoImpl;
import main.User;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateShopServlet", urlPatterns = "/restricted/createshop")
public class CreateShopServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession(false).getAttribute("user");
        if(user.hasShop()){
            response.sendRedirect("shop_panel.jsp");
        }

        String shopName, shopDescription, shopWebsite,
                shopAddress,shopState,shopOpeningHours,shopZIP,shopCity;

        if(
            Utils.isNullOrEmpty(shopName = request.getParameter("shop-name")) ||
            Utils.isNullOrEmpty(shopDescription = request.getParameter("shop-description")) ||
            Utils.isNullOrEmpty(shopWebsite = request.getParameter("shop-website"))
            ){
            response.sendRedirect("createshop.jsp?error=Campi non compilati nella Sezione Negozio");
            return;
        }

        if ( // tutti i campi del negozio fisico sono riempiti (creo negozio fisico)
            !Utils.isNullOrEmpty(shopAddress = request.getParameter("shop-address")) &
            !Utils.isNullOrEmpty(shopCity = request.getParameter("shop-city")) &
            !Utils.isNullOrEmpty(shopState = request.getParameter("shop-state")) &
            !Utils.isNullOrEmpty(shopZIP = request.getParameter("shop-ZIP")) &
            !Utils.isNullOrEmpty(shopOpeningHours = request.getParameter("shop-openingHours"))
                ){
            boolean result = new ShopDaoImpl().createNewPhysicalShop(
                    user.getUserID(),shopName,shopDescription,
                    shopWebsite,shopAddress,shopCity,shopState,shopZIP,shopOpeningHours);
            if(result)
                response.sendRedirect("shop_panel.jsp");
            else
                response.sendRedirect("createshop.jsp?error=Errore creazione negozio fisico");
            return;
        }
        else if (!Utils.isNullOrEmpty(shopAddress) ||
                !Utils.isNullOrEmpty(shopCity) ||
                !Utils.isNullOrEmpty(shopState) ||
                !Utils.isNullOrEmpty(shopZIP) ||
                !Utils.isNullOrEmpty(shopOpeningHours)){
            response.sendRedirect("createshop.jsp?error=Campi non compilati nella sezione negozio fisico");
            return;
        }
        int result = new ShopDaoImpl().createNewShop(user.getUserID(),shopName, shopDescription,shopWebsite);

        if(result != 0)
            response.sendRedirect("shop_panel.jsp");
        else
            response.sendRedirect("createshop.jsp?error=Errore creazione negozio online");
    }
}
