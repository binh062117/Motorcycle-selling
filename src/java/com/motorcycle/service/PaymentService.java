package com.motorcycle.service;

import com.motorcycle.dao.OrderDao;
import com.motorcycle.dao.PaymentDao;
import com.motorcycle.model.Order;
import com.motorcycle.model.Payment;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Optional;

public class PaymentService {
    private final OrderDao orderDao = new OrderDao();
    private final PaymentDao paymentDao = new PaymentDao();

    public String createVnPaySandboxUrl(Order order, String returnUrl) {
        try {
            String amount = order.getTotal().multiply(BigDecimal.valueOf(100)).toPlainString();
            return "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html"
                    + "?vnp_Version=2.1.0"
                    + "&vnp_Command=pay"
                    + "&vnp_TmnCode=DEMO"
                    + "&vnp_Amount=" + URLEncoder.encode(amount, StandardCharsets.UTF_8.name())
                    + "&vnp_TxnRef=" + URLEncoder.encode(order.getCode(), StandardCharsets.UTF_8.name())
                    + "&vnp_OrderInfo=" + URLEncoder.encode("Dat xe " + order.getCode(), StandardCharsets.UTF_8.name())
                    + "&vnp_ReturnUrl=" + URLEncoder.encode(returnUrl, StandardCharsets.UTF_8.name());
        } catch (Exception ex) {
            throw new IllegalStateException("Không tạo được URL thanh toán.", ex);
        }
    }

    public Payment recordCallback(int orderId, String provider, String transactionCode, String status) {
        Optional<Order> order = orderDao.findById(orderId);
        if (!order.isPresent()) {
            throw new IllegalArgumentException("Không tìm thấy đơn hàng.");
        }
        Payment payment = new Payment();
        payment.setOrder(order.get());
        payment.setAmount(order.get().getTotal());
        payment.setProvider(provider);
        payment.setTransactionCode(transactionCode);
        payment.setStatus(status);
        paymentDao.insert(payment);
        if ("SUCCESS".equalsIgnoreCase(status)) {
            order.get().setStatus("Đã xác nhận");
            orderDao.updateStatus(order.get().getId(), order.get().getStatus());
        }
        return payment;
    }
}
