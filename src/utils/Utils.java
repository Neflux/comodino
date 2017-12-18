package utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.SecureRandom;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Properties;

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
            if(imgDataBase64.isEmpty()){
                imgDataBase64 = "/ImageNotFound.png";
            }
            else {
                imgDataBase64 = "data:image/gif;base64," + imgDataBase64;
            }
            blob.free();
            return imgDataBase64;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "/ImageNotFound.png";
    }
    public static String getNDecPrice(float p,int n){
        return String.format("%."+n+"f",p);
    }

    public static boolean isNullOrEmpty(String s) {
        return s == null || s.isEmpty();
    }

    public static String sendVerificationEmail(String firstname, String lastname, String email) {

        // TODO: tokenGenerator da staticizzare e globalizzare all'avvio del server
        String easy = RandomString.digits + "ACEFGHJKLMNPQRUVWXYabcdefhijkprstuvwx";
        RandomString tokenGenerator = new RandomString(23, new SecureRandom(), easy);

        String verificationToken = tokenGenerator.nextString();

        final String google_username = "abbdevs@gmail.com";
        final String google_password = "&el0nMuschi3tt0%";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(google_username, google_password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("noreply@comodino.it"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
                    //InternetAddress.parse("abbdevs@gmail.com"));
            message.setSubject("Verifica il tuo account su Comodino.it");
            message.setText("Comodino.it\n\n" +

                            "Hey, " + firstname + ", grazie per esserti registrato su Comodino!\n"+
                            "Clicca il seguente link per attivare il tuo account:\n\n" +

                            "http://localhost:8080/emailConfirm?token="+verificationToken+"\n\n" +

                            "Lo Staff di Comodino.it\n" +
                            "http://localhost:8080/");

            Transport.send(message);

            System.out.println("[INFO] Email di conferma inviata con successo a '"+email+"'");
            System.out.println("[INFO] Token di verifica '"+verificationToken+"'");

        } catch (MessagingException e) {
            //throw new RuntimeException(e);
            return null;
        }

        return verificationToken;
    }
}
