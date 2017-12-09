package servlet;

import daos.OrderDao;
import daos.ProductDao;
import daos.impl.OrderDaoImpl;
import daos.impl.PaymentDaoImpl;
import daos.impl.ProductDaoImpl;
import main.Cart;
import main.CartItem;
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

        String shopName, shopDescription, shopWebsite,
                shopAddress,shopState,shopOpeningHours,shopZIP,shopCity;

        if(
            Utils.isNullOrEmpty(shopName = request.getParameter("shop-name")) ||
            Utils.isNullOrEmpty(shopDescription = request.getParameter("shop-description")) ||
            Utils.isNullOrEmpty(shopName = request.getParameter("shop-website"))
            ){
            response.sendRedirect("createshop.jsp?error=Campi non compilati nella Sezione Negozio"+request.getParameter("shop-website"));
            return;
        }

        if(
            !Utils.isNullOrEmpty(shopAddress = request.getParameter("shop-address")) &
            !Utils.isNullOrEmpty(shopCity = request.getParameter("shop-city")) &
            !Utils.isNullOrEmpty(shopState = request.getParameter("shop-state")) &
            !Utils.isNullOrEmpty(shopZIP = request.getParameter("shop-ZIP")) &
            !Utils.isNullOrEmpty(shopOpeningHours = request.getParameter("shop-openingHours"))
                ){
            response.sendRedirect("createshop.jsp?error=Tutto ok");
        }
        else if (!Utils.isNullOrEmpty(shopAddress) ||
                !Utils.isNullOrEmpty(shopCity) ||
                !Utils.isNullOrEmpty(shopState) ||
                !Utils.isNullOrEmpty(shopZIP) ||
                !Utils.isNullOrEmpty(shopOpeningHours)){
            response.sendRedirect("createshop.jsp?error=Campi non compilati nella sezione Negozio Fisico");
            return;
        }

        User user = (User) request.getSession(false).getAttribute("user");
        if(user.hasShop()){
            response.sendRedirect("/restricted/shop_panel.jsp");
        }
        response.sendRedirect("fuckingworking.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
