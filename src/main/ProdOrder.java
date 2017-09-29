package main;

public class ProdOrder{
    private Product product;
    private int quantity = 0;
    private int handDelivery = 0;
    private int status = 0;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getHandDelivery() {
        return handDelivery;
    }

    public void setHandDelivery(int handDelivery) {
        this.handDelivery = handDelivery;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
