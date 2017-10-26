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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Search", urlPatterns = {"/search"})
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        //PrintWriter out = response.getWriter();

        //Quick check
        if(request.getParameter("q") == null){
            return;
        }

        try{

            //Map
            request.setAttribute("products", DBManager.getProducts(request.getParameterMap()));

            //ArrayList
            request.setAttribute("categories", DBManager.getCategories(request.getParameterMap()));
            request.setAttribute("vendors", DBManager.getVendors(request.getParameterMap()));
            request.setAttribute("geozone", DBManager.getGeoZone(request.getParameterMap()));

            //redirect
            RequestDispatcher view = request.getRequestDispatcher("/search.jsp");
            view.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
