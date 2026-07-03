package com.motorcycle.dao;

import com.motorcycle.model.Payment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PaymentDao extends SqlSupport {
    public Payment insert(Payment payment) {
        String sql = "INSERT INTO payments (order_id, amount, provider, transaction_code, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            bind(statement, payment.getOrder().getId(), payment.getAmount(), payment.getProvider(),
                    payment.getTransactionCode(), payment.getStatus());
            statement.executeUpdate();
            return payment;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot save payment", ex);
        }
    }
}
