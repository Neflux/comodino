package servlet;

import daos.ProductDao;
import daos.impl.ProductDaoImpl;
import db.DBManager;
import main.Product;
import main.ProductGroup;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
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
            ProductDao productDao = new ProductDaoImpl();
            HashSet<String> vendors = new HashSet<>();
            HashSet<String> categories = new HashSet<>();
            HashSet<String> geozone = new HashSet<>();

            //Map
            Map<String, ProductGroup> products = productDao.getProducts(request.getParameterMap());
            request.setAttribute("products", products);
            for (ProductGroup i:products.values())
            {
                for (int j=0;j<i.getVendors().size();j++)
                    vendors.add(i.getVendors().get(j).getName());

                for (int j=0;j<i.getList().size();j++)
                    categories.add(i.getList().get(j).getCategoryName());

                for (int j=0;j<i.getGeo().size();j++)
                    geozone.add(i.getGeo().get(j));

            }


            //ArrayList
            request.setAttribute("categories", categories);
            request.setAttribute("vendors", vendors);
            request.setAttribute("geozone", geozone);

            //redirect
            RequestDispatcher view = request.getRequestDispatcher("/search.jsp");
            view.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
