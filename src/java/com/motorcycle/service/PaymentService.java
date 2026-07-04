package com.motorcycle.service;

import com.motorcycle.dao.OrderDao;
import com.motorcycle.dao.PaymentDao;
import com.motorcycle.model.Order;
import com.motorcycle.model.Payment;
import com.motorcycle.model.User;
import com.motorcycle.websocket.AdminRealtimeHub;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TimeZone;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class PaymentService {
    private final OrderDao orderDao = new OrderDao();
    private final PaymentDao paymentDao = new PaymentDao();
    private final MailService mailService = new MailService();

    public String createVnPayUrl(Order order, String returnUrl, String ipAddress) {
        VnPayConfig config = VnPayConfig.fromEnvironment();
        if (!config.isConfigured()) {
            throw new IllegalStateException("Chưa cấu hình VNPAY_TMN_CODE hoặc VNPAY_HASH_SECRET.");
        }
        try {
            java.util.TreeMap<String, String> params = new java.util.TreeMap<String, String>();
            params.put("vnp_Version", "2.1.0");
            params.put("vnp_Command", "pay");
            params.put("vnp_TmnCode", config.tmnCode);
            params.put("vnp_Amount", order.getTotal().multiply(BigDecimal.valueOf(100)).setScale(0).toPlainString());
            params.put("vnp_CurrCode", "VND");
            params.put("vnp_TxnRef", String.valueOf(order.getId()));
            params.put("vnp_OrderInfo", "Thanh toan don hang " + order.getCode());
            params.put("vnp_OrderType", "other");
            params.put("vnp_Locale", "vn");
            params.put("vnp_ReturnUrl", returnUrl);
            params.put("vnp_IpAddr", ipAddress == null || ipAddress.isEmpty() ? "127.0.0.1" : ipAddress);
            params.put("vnp_CreateDate", timestamp(0));
            params.put("vnp_ExpireDate", timestamp(15));

            String hashData = buildQuery(params, true);
            String query = buildQuery(params, false);
            String secureHash = hmacSha512(config.hashSecret, hashData);
            return config.payUrl + "?" + query + "&vnp_SecureHash=" + secureHash;
        } catch (Exception ex) {
            throw new IllegalStateException("Không tạo được URL thanh toán VNPay.", ex);
        }
    }

    public boolean verifyVnPayCallback(Map<String, String[]> parameterMap) {
        VnPayConfig config = VnPayConfig.fromEnvironment();
        String providedHash = first(parameterMap, "vnp_SecureHash");
        if (!config.isConfigured() || providedHash == null || providedHash.isEmpty()) {
            return false;
        }
        java.util.TreeMap<String, String> params = new java.util.TreeMap<String, String>();
        for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
            String key = entry.getKey();
            if (key != null && key.startsWith("vnp_") && !"vnp_SecureHash".equals(key) && !"vnp_SecureHashType".equals(key)) {
                params.put(key, first(parameterMap, key));
            }
        }
        try {
            return providedHash.equalsIgnoreCase(hmacSha512(config.hashSecret, buildQuery(params, true)));
        } catch (Exception ex) {
            return false;
        }
    }

    public Payment recordVnPayCallback(Map<String, String[]> parameterMap) {
        int orderId = parseInt(first(parameterMap, "vnp_TxnRef"));
        String responseCode = first(parameterMap, "vnp_ResponseCode");
        String transactionNo = first(parameterMap, "vnp_TransactionNo");
        String status = "00".equals(responseCode) ? "SUCCESS" : "FAILED";
        return recordCallback(orderId, "VNPay", transactionNo, status);
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
            User admin = new User();
            admin.setRole(new com.motorcycle.model.Role(1, "Admin"));
            AdminRealtimeHub.orderStatusUpdated(order.get(), orderDao.findByUser(admin));
            mailService.sendPaymentSuccessInvoice(order.get(), payment);
        }
        return payment;
    }

    private String buildQuery(Map<String, String> params, boolean encodeValuesOnly) throws UnsupportedEncodingException {
        List<String> fields = new ArrayList<String>(params.keySet());
        Collections.sort(fields);
        StringBuilder builder = new StringBuilder();
        for (String field : fields) {
            String value = params.get(field);
            if (value == null || value.isEmpty()) {
                continue;
            }
            if (builder.length() > 0) {
                builder.append('&');
            }
            builder.append(URLEncoder.encode(field, StandardCharsets.UTF_8.name()));
            builder.append('=');
            builder.append(URLEncoder.encode(value, StandardCharsets.UTF_8.name()));
        }
        return builder.toString();
    }

    private String hmacSha512(String key, String data) throws NoSuchAlgorithmException, InvalidKeyException {
        Mac hmac = Mac.getInstance("HmacSHA512");
        hmac.init(new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512"));
        byte[] bytes = hmac.doFinal(data.getBytes(StandardCharsets.UTF_8));
        StringBuilder hash = new StringBuilder();
        for (byte b : bytes) {
            hash.append(String.format("%02x", b & 0xff));
        }
        return hash.toString();
    }

    private String timestamp(int plusMinutes) {
        java.util.Calendar calendar = java.util.Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
        calendar.add(java.util.Calendar.MINUTE, plusMinutes);
        return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date(calendar.getTimeInMillis()));
    }

    private String first(Map<String, String[]> parameterMap, String key) {
        String[] values = parameterMap.get(key);
        return values == null || values.length == 0 ? "" : values[0];
    }

    private int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ex) {
            return 0;
        }
    }

    private static class VnPayConfig {
        private final String payUrl;
        private final String tmnCode;
        private final String hashSecret;

        private VnPayConfig(String payUrl, String tmnCode, String hashSecret) {
            this.payUrl = payUrl;
            this.tmnCode = tmnCode;
            this.hashSecret = hashSecret;
        }

        private boolean isConfigured() {
            return !tmnCode.isEmpty() && !hashSecret.isEmpty();
        }

        private static VnPayConfig fromEnvironment() {
            return new VnPayConfig(
                    value("VNPAY_PAY_URL", "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html"),
                    value("VNPAY_TMN_CODE", ""),
                    value("VNPAY_HASH_SECRET", "")
            );
        }

        private static String value(String key, String fallback) {
            String system = System.getProperty(key);
            if (system != null && !system.trim().isEmpty()) {
                return system.trim();
            }
            String env = System.getenv(key);
            return env == null || env.trim().isEmpty() ? fallback : env.trim();
        }
    }
}
