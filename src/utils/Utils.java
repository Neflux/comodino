package utils;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

public class Utils {
    /**
     * dato il blob nel db ritorna stringa da piazzare nel campo <img src="qui"> nell'html
     *
     * @param blob  blob dal database
     * @return      stringa già codificata come immagine o placeholder
     */
    public static String getStringfromBlob(Blob blob){
        try {
            String imgDataBase64 = new String(Base64.getEncoder().encode(blob.getBytes(1, (int) blob.length())));
            if(imgDataBase64.equals("")){
                imgDataBase64 = "http://via.placeholder.com/1000x1000";
            }
            else {
                imgDataBase64 = "data:image/gif;base64," + imgDataBase64;
            }
            blob.free();
            return imgDataBase64;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "http://via.placeholder.com/1000x1000";
    }
    public static String getNDecPrice(float p,int n){
        return String.format("%."+n+"f",p);
    }
}
