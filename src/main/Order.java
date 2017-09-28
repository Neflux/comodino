package main;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

public class Order implements Serializable {
    private int orderID = 0;
    private int userID = 0;
    private Date date = null;
    private int paymentStatus = 0;
    private ArrayList<ProdOrder> productList = new ArrayList<>();

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(int paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public ArrayList<ProdOrder> getProductList() {
        return productList;
    }

    public void setProductList(ArrayList<ProdOrder> productList) {
        this.productList = productList;
    }

    public float getTotal() {
        float total = 0;
        for (ProdOrder po:this.productList) {
            float price = po.getProduct().getPrice();
            int quantity = po.getQuantity();
            System.out.println("ITEM: " + po.getProduct().getProductName() + " price: " + po.getProduct().getPrice() + " quantity: " + po.getQuantity());
            total += quantity*price;
        }
        return total;
    }
}

