package servlet;


import daos.ShopDao;
import daos.impl.ShopDaoImpl;
import main.Shop;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.file.Paths;
import java.sql.Blob;

@MultipartConfig
@WebServlet(name = "UploadShopPhotoServlet", urlPatterns = {"/restricted/vendor/uploadshopphoto"})
public class UploadShopPhotoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part shopPhoto = request.getPart("shopPhoto");
        HttpSession session = request.getSession(false);
        Shop shop = (Shop) session.getAttribute("shop");
        ShopDao shopDao = new ShopDaoImpl();
        if(shopDao.addShopPhoto(shop.getShopID(), shopPhoto)) {
            response.sendRedirect("shop_panel.jsp?success=Foto caricata con successo");
        }
        else
            response.sendRedirect("shop_panel.jsp?warning=Upload non riuscito");

    }



    private static String readUrl(String urlString) throws Exception {
        BufferedReader reader = null;
        try {
            URL url = new URL(urlString);
            reader = new BufferedReader(new InputStreamReader(url.openStream()));
            StringBuffer buffer = new StringBuffer();
            int read;
            char[] chars = new char[1024];
            while ((read = reader.read(chars)) != -1)
                buffer.append(chars, 0, read);

            return buffer.toString();
        } finally {
            if (reader != null)
                reader.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}