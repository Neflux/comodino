package main;

import java.util.ArrayList;

/*
CARTITEM MAP:
"product" -> prodotto
"quantity" -> quantità in carrello
"address" -> null o addressID o 0 (ritiro in negozio)
 */
public class Cart extends ArrayList<CartItem> {
    public float getTotal() {
        float total = 0;
        for (CartItem item:this) {
            float price = item.getProduct().getActualPrice();
            int quantity = item.getQuantity();
            total += quantity*price;
        }
        return total;
    }
}
