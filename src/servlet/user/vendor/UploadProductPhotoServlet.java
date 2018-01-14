package servlet.user.vendor;


import daos.ProductDao;
import daos.impl.ProductDaoImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

/**
 * Permette di aggiungere una foto al prodotto da parte del venditore.
 */
@MultipartConfig
@WebServlet(name = "UploadShopPhotoServlet", urlPatterns = {"/restricted/vendor/uploadproductphoto"})
public class UploadProductPhotoServlet extends HttpServlet {

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part productPhoto = request.getPart("productPhoto");
        int productID = Integer.parseInt(request.getParameter("productID"));
        if (productPhoto.getSize() > 0) {
            ProductDao productDao = new ProductDaoImpl();
            if (productDao.addProductPhoto(productID, productPhoto)) {
                response.sendRedirect(request.getHeader("referer")+ "?success=Foto caricata con successo");
            } else
                response.sendRedirect("index.jsp?error=Upload non riuscito");
        } else response.sendRedirect("index.jsp?warning=Nessuna foto selezionata");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
