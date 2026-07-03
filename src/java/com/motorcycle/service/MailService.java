package com.motorcycle.service;

import com.motorcycle.model.Order;
import com.motorcycle.model.OrderDetail;
import com.motorcycle.model.Payment;
import com.motorcycle.model.User;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.Properties;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class MailService {
    private static final Logger LOG = Logger.getLogger(MailService.class.getName());

    public void sendRegistrationConfirmation(User user) {
        send(user.getEmail(), "Chào mừng đến với MotoSales",
                simpleEmail("Chào mừng " + escape(user.getFullName()),
                        "Tài khoản của bạn đã được tạo thành công. Bạn có thể đăng nhập và đặt lịch mua xe ngay bây giờ."));
    }

    public void sendResetPassword(User user, String token) {
        send(user.getEmail(), "Đặt lại mật khẩu MotoSales",
                simpleEmail("Đặt lại mật khẩu",
                        "Mã đặt lại mật khẩu của bạn: <strong>" + escape(token) + "</strong>"));
    }

    public void sendOrderNotification(Order order) {
        String email = order.getCustomer() == null ? "(guest)" : order.getCustomer().getEmail();
        if (order.getCustomer() == null || email == null || email.trim().isEmpty()) {
            LOG.warning("Skip order email because customer email is empty for order " + order.getCode());
            return;
        }
        send(email, "Xác nhận đơn hàng " + order.getCode(), buildOrderConfirmationHtml(order));
    }

    public void sendPaymentSuccessInvoice(Order order, Payment payment) {
        String email = order.getCustomer() == null ? "(guest)" : order.getCustomer().getEmail();
        if (order.getCustomer() == null || email == null || email.trim().isEmpty()) {
            LOG.warning("Skip payment email because customer email is empty for order " + order.getCode());
            return;
        }
        send(email, "Hóa đơn thanh toán thành công " + order.getCode(), buildPaymentSuccessHtml(order, payment));
    }

    private void send(String to, String subject, String htmlBody) {
        MailConfig config = MailConfig.fromEnvironment();
        if (!config.enabled()) {
            LOG.info("Mail is not configured. Skip email to " + to);
            return;
        }

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", config.host);
        props.put("mail.smtp.port", String.valueOf(config.port));

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(config.username, config.password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(config.from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
            message.setContent(htmlBody, "text/html; charset=UTF-8");
            Transport.send(message);
            LOG.info("Sent email to " + to);
        } catch (Exception ex) {
            LOG.warning("Cannot send email to " + to + ": " + ex.getMessage());
        }
    }

    private String buildOrderConfirmationHtml(Order order) {
        return buildOrderEmail(order, null, "ĐƠN HÀNG ĐÃ ĐƯỢC GHI NHẬN",
                "Cảm ơn quý khách đã đặt lịch mua xe tại MotoSales.",
                "Chúng tôi đã ghi nhận yêu cầu và sẽ liên hệ xác nhận lịch hẹn trong thời gian sớm nhất.");
    }

    private String buildPaymentSuccessHtml(Order order, Payment payment) {
        return buildOrderEmail(order, payment, "THANH TOÁN THÀNH CÔNG",
                "Hóa đơn của quý khách đã được thanh toán thành công.",
                "Vui lòng giữ email này để đối chiếu khi đến showroom nhận xe hoặc làm thủ tục bàn giao.");
    }

    private String buildOrderEmail(Order order, Payment payment, String title, String lead, String note) {
        NumberFormat vnd = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        StringBuilder rows = new StringBuilder();
        for (OrderDetail detail : order.getDetails()) {
            String name = detail.getProduct() == null ? "Sản phẩm" : detail.getProduct().getName();
            rows.append("<tr>")
                    .append("<td style='padding:12px;border-bottom:1px solid #dddddd;color:#222222;font-weight:bold;line-height:20px;'>")
                    .append(escape(name))
                    .append("<br><span style='color:#666666;font-size:12px;font-weight:normal;'>Màu: ")
                    .append(escape(detail.getColor())).append("</span></td>")
                    .append("<td style='padding:12px;border-bottom:1px solid #dddddd;color:#222222;text-align:center;'>")
                    .append(detail.getQuantity()).append("</td>")
                    .append("<td style='padding:12px;border-bottom:1px solid #dddddd;color:#222222;text-align:right;white-space:nowrap;'>")
                    .append(vnd.format(detail.getUnitPrice())).append("</td>")
                    .append("<td style='padding:12px;border-bottom:1px solid #dddddd;color:#cf1020;text-align:right;font-weight:bold;white-space:nowrap;'>")
                    .append(vnd.format(detail.getLineTotal())).append("</td>")
                    .append("</tr>");
        }

        String paymentBlock = "";
        if (payment != null) {
            paymentBlock = infoRow("Mã giao dịch", escape(payment.getTransactionCode()))
                    + infoRow("Cổng thanh toán", escape(payment.getProvider()))
                    + infoRow("Trạng thái thanh toán", "SUCCESS");
        }

        return "<!doctype html><html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'></head>"
                + "<body style='margin:0;padding:0;background-color:#f3f4f6;font-family:Arial,Helvetica,sans-serif;color:#222222;'>"
                + "<table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='background-color:#f3f4f6;padding:24px 0;'>"
                + "<tr><td align='center'>"
                + "<table role='presentation' width='640' cellpadding='0' cellspacing='0' style='width:640px;max-width:640px;background-color:#ffffff;border-collapse:collapse;border:1px solid #dddddd;'>"
                + "<tr><td style='background-color:#cf1020;padding:24px 28px;color:#ffffff;'>"
                + "<div style='font-size:13px;letter-spacing:3px;font-weight:bold;'>MOTOSALES</div>"
                + "<div style='font-size:28px;line-height:34px;font-weight:bold;margin-top:8px;'>" + escape(title) + "</div>"
                + "</td></tr>"
                + "<tr><td style='padding:28px;'>"
                + "<p style='margin:0 0 10px 0;color:#222222;font-size:16px;font-weight:bold;'>Xin chào " + escape(order.getCustomer().getFullName()) + ",</p>"
                + "<p style='margin:0 0 22px 0;color:#444444;font-size:14px;line-height:22px;'>" + escape(lead) + "</p>"
                + "<table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='border-collapse:collapse;background-color:#fafafa;border:1px solid #dddddd;margin-bottom:22px;'>"
                + infoRow("Mã đơn hàng", "#" + escape(order.getCode()))
                + infoRow("Showroom", escape(order.getShowroom()))
                + infoRow("Lịch hẹn", escape(String.valueOf(order.getAppointmentDate())) + " " + escape(order.getAppointmentTime()))
                + infoRow("Phương thức", escape(order.getPaymentMethod()))
                + infoRow("Trạng thái đơn", escape(order.getStatus()))
                + paymentBlock
                + "</table>"
                + "<table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='border-collapse:collapse;border:1px solid #dddddd;'>"
                + "<thead><tr style='background-color:#111820;color:#ffffff;font-size:12px;text-transform:uppercase;'>"
                + "<th style='padding:12px;text-align:left;'>Sản phẩm</th>"
                + "<th style='padding:12px;text-align:center;'>SL</th>"
                + "<th style='padding:12px;text-align:right;'>Đơn giá</th>"
                + "<th style='padding:12px;text-align:right;'>Thành tiền</th>"
                + "</tr></thead><tbody>" + rows + "</tbody></table>"
                + "<table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='border-collapse:collapse;margin-top:20px;'>"
                + "<tr><td align='right' style='color:#666666;font-size:13px;text-transform:uppercase;padding-bottom:4px;'>Tổng thanh toán</td></tr>"
                + "<tr><td align='right' style='color:#cf1020;font-size:28px;line-height:34px;font-weight:bold;'>" + vnd.format(order.getTotal()) + "</td></tr>"
                + "</table>"
                + "<div style='margin-top:24px;padding:16px;background-color:#fff5f5;border-left:4px solid #cf1020;color:#444444;line-height:22px;font-size:14px;'>"
                + escape(note)
                + "</div>"
                + "<p style='margin:24px 0 0;color:#777777;font-size:12px;line-height:18px;'>Email này được gửi từ hệ thống MotoSales. Nếu thông tin chưa đúng, vui lòng liên hệ showroom để được hỗ trợ.</p>"
                + "</td></tr></table>"
                + "</td></tr></table></body></html>";
    }

    private String infoRow(String label, String value) {
        return "<tr>"
                + "<td width='42%' style='padding:10px 12px;border-bottom:1px solid #dddddd;color:#666666;font-size:13px;text-transform:uppercase;vertical-align:top;'>"
                + label + "</td>"
                + "<td width='58%' style='padding:10px 12px;border-bottom:1px solid #dddddd;color:#222222;font-size:14px;font-weight:bold;text-align:right;vertical-align:top;line-height:20px;'>"
                + value + "</td>"
                + "</tr>";
    }

    private String simpleEmail(String title, String body) {
        return "<!doctype html><html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'></head>"
                + "<body style='margin:0;padding:0;background-color:#f3f4f6;font-family:Arial,Helvetica,sans-serif;'>"
                + "<table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='background-color:#f3f4f6;padding:24px 0;'>"
                + "<tr><td align='center'><table role='presentation' width='600' cellpadding='0' cellspacing='0' style='width:600px;background-color:#ffffff;border:1px solid #dddddd;border-collapse:collapse;'>"
                + "<tr><td style='background-color:#cf1020;color:#ffffff;padding:22px 26px;font-size:24px;font-weight:bold;'>MotoSales</td></tr>"
                + "<tr><td style='padding:26px;color:#222222;'>"
                + "<h2 style='margin:0 0 12px 0;font-size:22px;line-height:28px;'>" + title + "</h2>"
                + "<p style='margin:0;color:#444444;font-size:14px;line-height:22px;'>" + body + "</p>"
                + "</td></tr></table></td></tr></table></body></html>";
    }

    private String escape(String value) {
        if (value == null) {
            return "";
        }
        return value.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;");
    }

    private static class MailConfig {
        private final String host;
        private final int port;
        private final String username;
        private final String password;
        private final String from;

        private MailConfig(String host, int port, String username, String password, String from) {
            this.host = host;
            this.port = port;
            this.username = username;
            this.password = password;
            this.from = from == null || from.trim().isEmpty() ? username : from;
        }

        private boolean enabled() {
            return username != null && !username.trim().isEmpty()
                    && password != null && !password.trim().isEmpty();
        }

        private static MailConfig fromEnvironment() {
            return new MailConfig(
                    value("MAIL_HOST", "smtp.gmail.com"),
                    Integer.parseInt(value("MAIL_PORT", "587")),
                    value("MAIL_USERNAME", ""),
                    value("MAIL_PASSWORD", ""),
                    value("MAIL_FROM", value("MAIL_USERNAME", ""))
            );
        }

        private static String value(String key, String fallback) {
            String property = System.getProperty(key);
            if (property != null && !property.trim().isEmpty()) {
                return property.trim();
            }
            String env = System.getenv(key);
            return env == null || env.trim().isEmpty() ? fallback : env.trim();
        }
    }
}
