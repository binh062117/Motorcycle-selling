package com.motorcycle.service;

import com.motorcycle.dao.OrderDao;
import com.motorcycle.model.CartItem;
import com.motorcycle.model.Order;
import com.motorcycle.model.OrderDetail;
import com.motorcycle.model.User;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

public class OrderService {
    private final MailService mailService = new MailService();
    private final OrderDao orderDao = new OrderDao();

    public Order createOrder(User customer, List<CartItem> cartItems, String showroom, String appointmentDate, String appointmentTime, String paymentMethod) {
        if (cartItems == null || cartItems.isEmpty()) {
            throw new IllegalArgumentException("Giỏ hàng đang trống.");
        }
        Order order = new Order();
        order.setCustomer(customer);
        order.setCode("DUC-" + System.currentTimeMillis());
        order.setShowroom(showroom);
        if (appointmentDate != null && !appointmentDate.isEmpty()) {
            order.setAppointmentDate(LocalDate.parse(appointmentDate));
        }
        order.setAppointmentTime(appointmentTime);
        order.setPaymentMethod(paymentMethod);

        BigDecimal total = BigDecimal.ZERO;
        for (CartItem cartItem : cartItems) {
            OrderDetail detail = new OrderDetail();
            detail.setProduct(cartItem.getProduct());
            detail.setColor(cartItem.getColor());
            detail.setQuantity(cartItem.getQuantity());
            detail.setUnitPrice(cartItem.getProduct().getPrice());
            order.getDetails().add(detail);
            total = total.add(detail.getLineTotal());
        }
        order.setTotal(total);
        orderDao.insert(order);
        mailService.sendOrderNotification(order);
        return order;
    }

    public List<Order> findOrdersFor(User user) {
        return orderDao.findByUser(user);
    }

    public boolean updateStatus(int orderId, String status) {
        return orderDao.updateStatus(orderId, status);
    }
}
