package com.motorcycle.model;

import java.math.BigDecimal;

public class Payment extends BaseEntity {
    private Order order;
    private BigDecimal amount;
    private String provider;
    private String transactionCode;
    private String status;

    public Order getOrder() { return order; }
    public void setOrder(Order order) { this.order = order; touch(); }
    public BigDecimal getAmount() { return amount; }
    public void setAmount(BigDecimal amount) { this.amount = amount; touch(); }
    public String getProvider() { return provider; }
    public void setProvider(String provider) { this.provider = provider; touch(); }
    public String getTransactionCode() { return transactionCode; }
    public void setTransactionCode(String transactionCode) { this.transactionCode = transactionCode; touch(); }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; touch(); }
}
