package servlet;

import db.DBManager;
import main.ProductGroup;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "Search", urlPatterns = {"/search"})
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        //PrintWriter out = response.getWriter();

        if(request.getParameter("q") == null){      //quick check
            return;
        }

        try{
            Map<String, ProductGroup> products = DBManager.getProducts(request.getParameterMap());

            request.setAttribute("products", products);

            RequestDispatcher view = request.getRequestDispatcher("/search.jsp");
            view.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
