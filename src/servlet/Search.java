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

@WebServlet(name = "Search", urlPatterns = {"/search"})
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String searchQuery = request.getParameter("q");


        ArrayList al = null;
        ArrayList pid_list = new ArrayList();

        try{

            DBManager shopCrawler = new DBManager();
            List<Product> products = shopCrawler.getProducts(searchQuery,0,3);

            request.setAttribute("products", products);

            RequestDispatcher view = request.getRequestDispatcher("/search.jsp");
            view.forward(request, response);

            shopCrawler.shutdown();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
