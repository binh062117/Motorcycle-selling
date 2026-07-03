package com.motorcycle.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class CartItem implements Serializable {
    private Product product;
    private String color;
    private int quantity;

    public CartItem() {
    }

    public CartItem(Product product, String color, int quantity) {
        this.product = product;
        this.color = color;
        this.quantity = quantity;
    }

    public BigDecimal getLineTotal() {
        if (product == null || product.getPrice() == null) {
            return BigDecimal.ZERO;
        }
        return product.getPrice().multiply(BigDecimal.valueOf(quantity));
    }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
