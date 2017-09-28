package daos.impl;

import daos.OrderDao;

import daos.ProductDao;
import db.DBManager;
import main.Order;
import main.ProdOrder;
import main.Product;
import main.User;

import java.sql.*;
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
            PreparedStatement stm = con.prepareStatement("SELECT * FROM orderlist INNER JOIN ordertable USING(OrderID) WHERE UserID = ? ORDER BY OrderID");
            stm.setInt(1, user.getUserID());
            ResultSet rs = stm.executeQuery();
            printRS(rs);
            System.out.println("");
            return null;//extractProductFromResultSet(rs);

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
            while (rs.next()){
                Order order;
                ProdOrder ps;
                ProductDao pd;
                Product p;

                // creo inserisco dati ordine generale
                order = new Order();
                order.setOrderID(rs.getInt("OrderID"));
                order.setUserID(rs.getInt("UserID"));
                order.setDate(new Date(rs.getString("Date")));
                order.setPaymentStatus(rs.getInt("PaymentStatus"));

                // creo prodotto con dati venditore
                pd = new ProductDaoImpl();
                p = pd.getProduct(rs.getInt("productID"),rs.getInt("shopID"));

                // creo l'ordine del prodotto particolare e lo aggiungo alla lista dell'ordine generale
                ps = new ProdOrder();
                ps.setProduct(p);
                ps.setQuantity(rs.getInt("Quantity"));
                ps.setHandDelivery(rs.getInt("HandDelivery"));
                ps.setStatus(rs.getInt("Status"));

                // aggiungo l'ordine del prodotto al corrispettivo ordine generale
                order.getProductList().add(ps);

                // ciclo sugli elementi successivi dell'ordine (basta aggiungere gli progelem alla lista ordine)
                while (rs.next()){

                    // se trovo un elemento che non appartiene piÃ¹ all'ordine corrente
                    if (rs.getInt("OrderID") != order.getOrderID()){
                        // finalizzo l'ordine
                        orderList.add(order);
                        // torno all'elemento precedente (perchÃ¨ poi nel while esterno ritorno avanti di uno e dichiaro un nuovo ordine)
                        rs.previous();
                        // esco dal while interno (ovvero non ho piÃ¹ prodotti relativi all'ordine corrente)
                        break;
                    }

                    // creo prodotto con dati venditore
                    pd = new ProductDaoImpl();
                    p = pd.getProduct(rs.getInt("productID"), rs.getInt("shopID"));

                    // creo l'ordine del prodotto particolare e lo aggiungo alla lista dell'ordine generale
                    ps = new ProdOrder();
                    ps.setProduct(p);
                    ps.setQuantity(rs.getInt("Quantity"));
                    ps.setHandDelivery(rs.getInt("HandDelivery"));
                    ps.setStatus(rs.getInt("Status"));
                }
            }
            
            return orderList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
