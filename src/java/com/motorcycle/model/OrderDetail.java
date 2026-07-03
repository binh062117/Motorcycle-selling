package com.motorcycle.model;

import java.math.BigDecimal;

public class OrderDetail extends BaseEntity {
    private Product product;
    private String color;
    private int quantity;
    private BigDecimal unitPrice;

    public BigDecimal getLineTotal() {
        if (unitPrice == null) {
            return BigDecimal.ZERO;
        }
        return unitPrice.multiply(BigDecimal.valueOf(quantity));
    }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; touch(); }
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; touch(); }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; touch(); }
    public BigDecimal getUnitPrice() { return unitPrice; }
    public void setUnitPrice(BigDecimal unitPrice) { this.unitPrice = unitPrice; touch(); }
}
