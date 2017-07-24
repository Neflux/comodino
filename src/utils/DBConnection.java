package utils;

import java.sql.*;

public class DBConnection {
    private Connection conn = null;

    private Connection getConnection(){
        try {
            PropertiesReader pr = new PropertiesReader();
            String database = pr.get("database");
            String user = pr.get("user");
            String password = pr.get("password");
            String timezone_fix = "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            this.conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/" + database + timezone_fix + "&user=" + user +"&password=" + password);
            System.out.println("Connected with success!");
        } catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }

    public ResultSet select(String query)  {
        ResultSet rs = null;
        try{
            Statement stmt = this.conn.createStatement();
            rs = stmt.executeQuery(query);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return rs;
    }

    public static void main(String [] args) {
        /*
        try {

            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            System.out.println("YEAH");
        } catch (Exception e) {
            e.printStackTrace();
        }
        */
        DBConnection dbc = new DBConnection();
        try {
            Connection conn = dbc.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs=stmt.executeQuery("select * from shop");
            while(rs.next())
                System.out.println(rs.getInt(1)+"  "+rs.getString(2));
            conn.close();
            System.out.println("YEAH");
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}