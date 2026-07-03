package com.motorcycle.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Order extends BaseEntity {
    private String code;
    private User customer;
    private String showroom;
    private LocalDate appointmentDate;
    private String appointmentTime;
    private String paymentMethod;
    private String status = "Chờ duyệt";
    private BigDecimal total = BigDecimal.ZERO;
    private final List<OrderDetail> details = new ArrayList<OrderDetail>();

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; touch(); }
    public User getCustomer() { return customer; }
    public void setCustomer(User customer) { this.customer = customer; touch(); }
    public String getShowroom() { return showroom; }
    public void setShowroom(String showroom) { this.showroom = showroom; touch(); }
    public LocalDate getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(LocalDate appointmentDate) { this.appointmentDate = appointmentDate; touch(); }
    public String getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(String appointmentTime) { this.appointmentTime = appointmentTime; touch(); }
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; touch(); }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; touch(); }
    public BigDecimal getTotal() { return total; }
    public void setTotal(BigDecimal total) { this.total = total; touch(); }
    public List<OrderDetail> getDetails() { return details; }
}
