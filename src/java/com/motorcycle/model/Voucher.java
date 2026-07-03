package com.motorcycle.model;

import java.math.BigDecimal;

public class Voucher extends BaseEntity {
    private String code;
    private BigDecimal discountPercent;
    private boolean active = true;

    public Voucher() {
    }

    public Voucher(int id, String code, BigDecimal discountPercent) {
        super(id);
        this.code = code;
        this.discountPercent = discountPercent;
    }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; touch(); }
    public BigDecimal getDiscountPercent() { return discountPercent; }
    public void setDiscountPercent(BigDecimal discountPercent) { this.discountPercent = discountPercent; touch(); }
    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; touch(); }
}
