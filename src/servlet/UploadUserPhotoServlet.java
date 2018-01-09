package servlet;


import daos.UserDao;
import daos.impl.UserDaoImpl;
import main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

@MultipartConfig
@WebServlet(name = "UploadUserPhotoServlet", urlPatterns = {"/restricted/uploaduserphoto"})
public class UploadUserPhotoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part userPhoto = request.getPart("userPhoto");
        if (userPhoto.getSize() > 0) {
            HttpSession session = request.getSession(false);
            User user = (User) session.getAttribute("user");
            UserDao userDao = new UserDaoImpl();
            if (userDao.addUserPhoto(user, userPhoto)) {
                user.setProfilePhoto(userDao.getUserPhoto(user));
                response.sendRedirect("/restricted/profile.jsp?success=Foto caricata con successo!");
            } else
                response.sendRedirect("/restricted/profile.jsp?error=Upload non riuscito");
        }
        else response.sendRedirect("/restricted/profile.jsp?warning=Nessuna foto selezionata");
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
