package com.motorcycle.service;

import com.motorcycle.model.Order;
import com.motorcycle.model.OrderDetail;
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

public class MailService {
    private static final Logger LOG = Logger.getLogger(MailService.class.getName());

    public void sendRegistrationConfirmation(User user) {
        send(user.getEmail(), "Chao mung den voi Motorcycle Store",
                "<h2>Chao mung " + escape(user.getFullName()) + "</h2>"
                        + "<p>Tai khoan cua ban da duoc tao thanh cong.</p>");
    }

    public void sendResetPassword(User user, String token) {
        send(user.getEmail(), "Dat lai mat khau Motorcycle Store",
                "<h2>Dat lai mat khau</h2>"
                        + "<p>Ma token cua ban:</p>"
                        + "<p><strong>" + escape(token) + "</strong></p>");
    }

    public void sendOrderNotification(Order order) {
        String email = order.getCustomer() == null ? "(guest)" : order.getCustomer().getEmail();
        if (order.getCustomer() == null || email == null || email.trim().isEmpty()) {
            LOG.warning("Skip order email because customer email is empty for order " + order.getCode());
            return;
        }
        send(email, "Hoa don don hang " + order.getCode(), buildOrderHtml(order));
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
            message.setSubject(subject);
            message.setContent(htmlBody, "text/html; charset=UTF-8");
            Transport.send(message);
            LOG.info("Sent email to " + to);
        } catch (MessagingException ex) {
            LOG.warning("Cannot send email to " + to + ": " + ex.getMessage());
        }
    }

    private String buildOrderHtml(Order order) {
        NumberFormat vnd = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        StringBuilder rows = new StringBuilder();
        for (OrderDetail detail : order.getDetails()) {
            String name = detail.getProduct() == null ? "San pham" : detail.getProduct().getName();
            rows.append("<tr>")
                    .append("<td>").append(escape(name)).append("</td>")
                    .append("<td>").append(escape(detail.getColor())).append("</td>")
                    .append("<td>").append(detail.getQuantity()).append("</td>")
                    .append("<td>").append(vnd.format(detail.getUnitPrice())).append("</td>")
                    .append("<td>").append(vnd.format(detail.getLineTotal())).append("</td>")
                    .append("</tr>");
        }

        return "<h2>Hoa don Motorcycle Store</h2>"
                + "<p>Ma don hang: <strong>" + escape(order.getCode()) + "</strong></p>"
                + "<p>Showroom: " + escape(order.getShowroom()) + "</p>"
                + "<p>Lich hen: " + escape(String.valueOf(order.getAppointmentDate())) + " "
                + escape(order.getAppointmentTime()) + "</p>"
                + "<table border='1' cellpadding='8' cellspacing='0'>"
                + "<thead><tr><th>San pham</th><th>Mau</th><th>SL</th><th>Don gia</th><th>Thanh tien</th></tr></thead>"
                + "<tbody>" + rows + "</tbody></table>"
                + "<h3>Tong cong: " + vnd.format(order.getTotal()) + "</h3>";
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
