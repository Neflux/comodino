package servlet;

import db.DBManager;
import main.Shop;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "getVendorServlet", urlPatterns = {"/getVendorServlet"})
public class getVendorsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("nome_prodotto") != null)
        {
            Connection con = DBManager.getCon();
            PreparedStatement stm = null;
            try {
                stm = con.prepareStatement("SELECT shop.*, shopproduct.Price, shopproduct.Discount, " +
                        "shopproduct.Quantity, round(shopproduct.Price * (1-shopproduct.Discount),2) as ActualPrice " +
                        "FROM product, shopproduct, shop " +
                        "WHERE product.name = ? AND shopproduct.Quantity > 0 " +
                        "AND product.ProductID = shopproduct.ProductID AND shopproduct.ShopID = shop.ShopID " +
                        "ORDER BY ActualPrice ASC, Rating DESC"
                );

                String ret = "";
                stm.setString(1, request.getParameter("nome_prodotto"));
                try (ResultSet rs = stm.executeQuery()){
                    System.out.println(stm.toString());
                    while(rs.next()) {
                        ret += "<div class=\"col-md-8 mod\"><a href=\"\">" + rs.getString("Name") + "</a></div>\n" +
                                "                                    <div class=\"col-md-4 mod text-left\">\n" +
                                "                                        <span class=\"white valign\">da " + rs.getFloat("ActualPrice") + " €</span>\n" +
                                "                                        <span class=\"float-right\"><i class=\"fa fa-angle-double-right white valign\" aria-hidden=\"true\"></i></span>\n" +
                                "                                    </div>";
                    }

                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(ret);
                } catch(Exception e){
                    e.printStackTrace();
                }
                finally {
                    stm.close();
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
