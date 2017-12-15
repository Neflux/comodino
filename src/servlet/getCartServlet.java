package servlet;

import main.Cart;
import main.CartItem;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "getCartServlet", urlPatterns = {"/getcart"})
public class getCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ret = "", size = "";

        if (request.getSession(false).getAttribute("user") == null){
            Cookie[] cookies = request.getCookies();
            Cookie prodCookie = null;
            for (Cookie c: cookies){
                if (c.getName().equals("cartproducts")){
                    prodCookie = c;
                }
            }
            if (prodCookie == null){
                ret = "<li class=\"text-center\"><a>Carrello vuoto...</a></li>";
                size = "<span class=\"badge\">\n" +
                        "                            <i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i> 0\n" +
                        "                        </span>\n" +
                        "                        &nbsp;&nbsp;Carrello <span class=\"caret\"></span>";

            }
            else {
                String[] cartproducts = prodCookie.getValue().split("\\|");
                //System.out.println("LENGHT: " +cartproducts.length);
                size = "<span class=\"badge\">\n" +
                        "                            <i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i> " + cartproducts.length + "\n" +
                        "                        </span>\n" +
                        "                        &nbsp;&nbsp;Carrello <span class=\"caret\"></span>";

                for (String cartItem : cartproducts) {
                    String[] pieces = cartItem.split("_");
                    ret += "<li><a href=\"/product.jsp?product=" + pieces[0] + "&shop=" + pieces[2] + "\"> <b>" + pieces[1].replace("-"," ") +
                            "</b> - " + pieces [3] + "&nbsp;pz</a></li>";
                }
                ret += "<li class=\"divider\"></li>\n" +
                        "                        <li class=\"text-center\"><a href=\"#\">Loggati per continuare <i class=\"fa fa-angle-double-right\" aria-hidden=\"true\"></i>\n</a></li>";
            }
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            if (request.getParameter("type").equals("drop"))
                response.getWriter().write(size);
            else
                response.getWriter().write(ret);
            return;
        }







        Cart cart;
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
            for (CartItem cartItem : cart) {
                ret += "<li><a href=\"/product.jsp?product="+cartItem.getProduct().getProductID()+"&shop="+cartItem.getProduct().getShopID()+"\"> <b>" + cartItem.getProduct().getProductName() +
                        "</b> - " + cartItem.getQuantity() + "&nbsp;pz</a></li>";
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
