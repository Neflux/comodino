package servlet;

import db.DBManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import main.Product;

@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String searchQuery = request.getParameter("q");

/*
        ArrayList al = null;
        ArrayList pid_list = new ArrayList();
*/
        try{

            DBManager shopCrawler = new DBManager();
            List<Product> products = shopCrawler.getProducts(searchQuery);

            for(Product p: products){
                out.println(p.getProductName());
                System.out.println(p.getProductName());
            }
/*
            while (rs.next()) {
                al = new ArrayList();

                al.add(rs.getString(1));

                System.out.println("al :: " + al);
                pid_list.add(al);
            }
            request.setAttribute("piList", pid_list);
            RequestDispatcher view = request.getRequestDispatcher("/Search.jsp");
            view.forward(request, response);
*/

            shopCrawler.shutdown();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
