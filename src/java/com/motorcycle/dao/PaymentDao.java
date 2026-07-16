package com.motorcycle.dao;

import com.motorcycle.model.Payment;
import com.motorcycle.model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

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

    public Optional<Payment> findByTransaction(int orderId, String provider, String transactionCode) {
        String sql = "SELECT id, order_id, amount, provider, transaction_code, status "
                + "FROM payments WHERE order_id = ? AND provider = ? AND transaction_code = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            bind(statement, orderId, provider, transactionCode);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (!resultSet.next()) {
                    return Optional.empty();
                }
                Payment payment = new Payment();
                payment.setId(resultSet.getInt("id"));
                Order order = new Order();
                order.setId(resultSet.getInt("order_id"));
                payment.setOrder(order);
                payment.setAmount(resultSet.getBigDecimal("amount"));
                payment.setProvider(resultSet.getString("provider"));
                payment.setTransactionCode(resultSet.getString("transaction_code"));
                payment.setStatus(resultSet.getString("status"));
                return Optional.of(payment);
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot find payment", ex);
        }
    }
}
