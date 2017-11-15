package servlet;

import daos.ShopDao;
import daos.impl.ShopDaoImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ShopViewer", urlPatterns = {"/shop"})
public class ShopViewer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Quick check
        if(request.getParameter("id") == null){
            System.out.println("nessun shop specificato");
            return;
        }

        try{
            ShopDao shopDao = new ShopDaoImpl();

            //in caso di bug prova a cambiare il nome dell'attributo
            request.setAttribute("products", shopDao.getProducts(request.getParameter("id")));
            request.setAttribute("shop", shopDao.getShop(Integer.parseInt(request.getParameter("id"))));

            //redirect
            RequestDispatcher view = request.getRequestDispatcher("/shop.jsp");
            view.forward(request, response);

        } catch (ClassCastException e) {
            System.out.println("id parse error");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
