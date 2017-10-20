package servlet;

import daos.impl.UserDaoImpl;
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
        String ret = "";
        ArrayList<Pair<Product, Integer>> cart = new UserDaoImpl().getCart((User) request.getSession().getAttribute("user"));
        if (cart.size() == 0) {
            ret = "<li class=\"text-center\"><a>Carrello vuoto...</a></li>";
        } else {
            for (Pair<Product, Integer> cartItem : cart) {
                ret += "<li><a href=\"#\">" + cartItem.getKey().getProductName() +
                        " N: " + cartItem.getValue() + "</a></li>";
            }
            ret += "<li class=\"divider\"></li>\n" +
                    "                        <li class=\"text-center\"><a href=\"/cart.jsp\">Vedi carrello >></a></li>";
        }
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(ret);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
