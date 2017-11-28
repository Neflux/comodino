package servlet;

import javafx.util.Pair;
import main.Product;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getCartServlet", urlPatterns = {"/getcart"})
public class getCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ret = "", size;
        ArrayList<Pair<Product, Integer>> cart;
        if (request.getParameter("type").equals("drop"))
            cart = ((User) request.getSession(false).getAttribute("user")).getCart(); // con update del carrello
        else
            cart = ((User) request.getSession(false).getAttribute("user")).getCart(false); // senza update del carrello

        size = "<span class=\"badge\">\n" +
                "                            <i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i> " + cart.size() + "\n" +
                "                        </span>\n" +
                "                        &nbsp;&nbsp;Carrello <span class=\"caret\"></span>";

        if (cart.size() == 0) {
            ret = "<li class=\"text-center\"><a>Carrello vuoto...</a></li>";
        } else {
            for (Pair<Product, Integer> cartItem : cart) {
                ret += "<li><a href=\"/product.jsp?product="+cartItem.getKey().getProductID()+"&shop="+cartItem.getKey().getShopID()+"\"> <b>" + cartItem.getKey().getProductName() +
                        "</b> - " + cartItem.getValue() + "&nbsp;pz</a></li>";
            }
            ret += "<li class=\"divider\"></li>\n" +
                    "                        <li class=\"text-center\"><a href=\"/restricted/cart.jsp\">Vedi carrello <i class=\"fa fa-angle-double-right\" aria-hidden=\"true\"></i>\n</a></li>";
        }

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        if (request.getParameter("type").equals("drop"))
            response.getWriter().write(size);
        else
            response.getWriter().write(ret);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
