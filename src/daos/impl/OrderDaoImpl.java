package daos.impl;

import daos.AddressDao;
import daos.OrderDao;
import daos.ProductDao;
import db.DBManager;
import main.*;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class OrderDaoImpl implements OrderDao {
    private Connection con;

    public OrderDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public ArrayList<Order> getAllOrders(User user) {

        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM orderprod INNER JOIN orderlist USING(OrderID) WHERE UserID = ? ORDER BY OrderID");
            stm.setInt(1, user.getUserID());
            ResultSet rs = stm.executeQuery();
            printRS(rs);
            System.out.println("");
            ArrayList<Order> orders = extractProductFromResultSet(rs);
            System.out.println("Size: " + (orders != null ? orders.size() : "orders is NULL"));
            return orders;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    private void printRS(ResultSet resultSet) throws SQLException {
        ResultSetMetaData rsmd = resultSet.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        while (resultSet.next()) {
            for (int i = 1; i <= columnsNumber; i++) {
                if (i > 1) System.out.print(",  ");
                String columnValue = resultSet.getString(i);
                System.out.print(columnValue + " " + rsmd.getColumnName(i));
            }
            System.out.println("");
        }
    }

    /**
     * La query del rs set deve essere per forza ordinata (ovvero prodotti con OrderID uguale sono tutti consecutivi)
     *
     * @param rs    ResultSet della query ORDINATA per OrderID
     * @return      Lista degli ordini
     */
    private ArrayList<Order> extractProductFromResultSet(ResultSet rs){
        ArrayList<Order> orderList = new ArrayList<>();

        try {
            Order order = new Order();
            ProdOrder ps;
            ProductDao pd;
            Product p;
            AddressDao ad;
            Address a;
            int i = 0;

            // mi assicuro che legga sempre dall'inizio
            rs.first();

            while (rs.next()){

                if (i == 0){
                    rs.previous(); // serve perche il primo elemento sennò viene saltato da rs.next()
                }

                // creo inserisco dati ordine generale
                order = new Order();
                i++;
                order.setOrderID(rs.getInt("OrderID"));
                order.setUserID(rs.getInt("UserID"));
                order.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("Date")));
                order.setPaymentStatus(rs.getInt("PaymentStatus"));
                System.out.println("[ INFO ] Data: " + order.getDate().toString());
                // creo prodotto con dati venditore
                pd = new ProductDaoImpl();
                p = pd.getProduct(rs.getInt("ProductID"),rs.getInt("ShopID"));
                System.out.println("[ INFO ] Prodotto : " + p.getProductName());

                // creo indirizzo spedizione
                ad = new AddressDaoImpl();
                a = ad.getAddress(rs.getInt("AddressID"));

                // creo l'ordine del prodotto particolare e lo aggiungo alla lista dell'ordine generale
                ps = new ProdOrder();
                ps.setProduct(p);
                ps.setQuantity(rs.getInt("Quantity"));
                ps.setFinalPrice(rs.getFloat("FinalPrice"));
                ps.setAddress(a);
                ps.setStatus(rs.getInt("Status"));

                // aggiungo l'ordine del prodotto al corrispettivo ordine generale
                order.getProductList().add(ps);

                // ciclo sugli elementi successivi dell'ordine (basta aggiungere gli progelem alla lista ordine)
                while (rs.next()){

                    // se trovo un elemento che non appartiene più all'ordine corrente
                    if (rs.getInt("OrderID") != order.getOrderID()){
                        // finalizzo l'ordine
                        System.out.println("[ INFO ] Ordine " + order.getOrderID() + " aggiunto");
                        orderList.add(order);
                        // torno all'elemento precedente (perchè poi nel while esterno ritorno avanti di uno e dichiaro un nuovo ordine)
                        rs.previous();
                        // esco dal while interno (ovvero non ho più prodotti relativi all'ordine corrente)
                        break;
                    }

                    // creo prodotto con dati venditore
                    pd = new ProductDaoImpl();
                    p = pd.getProduct(rs.getInt("ProductID"), rs.getInt("ShopID"));
                    System.out.println("[ INFO ] Prodotto : " + p.getProductName());

                    // creo indirizzo spedizione
                    ad = new AddressDaoImpl();
                    a = ad.getAddress(rs.getInt("AddressID"));

                    // creo l'ordine del prodotto particolare e lo aggiungo alla lista dell'ordine generale
                    ps = new ProdOrder();
                    ps.setProduct(p);
                    ps.setQuantity(rs.getInt("Quantity"));
                    ps.setFinalPrice(rs.getFloat("FinalPrice"));
                    ps.setAddress(a);
                    ps.setStatus(rs.getInt("Status"));

                    // aggiungo l'ordine del prodotto al corrispettivo ordine generale
                    order.getProductList().add(ps);
                }

            }
            if (i > 0){
                orderList.add(order);
                System.out.println("[ INFO ] Ordine " + order.getOrderID() + " aggiunto");
            }
            
            return orderList;
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
