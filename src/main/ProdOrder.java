package main;

public class ProdOrder{
    private Product product;
    private int quantity = 0;
    private float finalPrice = 0;
    private int addressID = 0;
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

    public float getFinalPrice() {
        return finalPrice;
    }

    public void setFinalPrice(float finalPrice) {
        this.finalPrice = finalPrice;
    }

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int handDelivery) {
        this.addressID = handDelivery;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
