package com.motorcycle.dao;

import com.motorcycle.model.Order;
import com.motorcycle.model.OrderDetail;
import com.motorcycle.model.Product;
import com.motorcycle.model.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class OrderDao extends SqlSupport {
    private final UserDao userDao = new UserDao();
    private final ProductDao productDao = new ProductDao();

    public Order insert(Order order) {
        String orderSql = "INSERT INTO orders (code, customer_id, showroom, appointment_date, appointment_time, payment_method, status, total) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String detailSql = "INSERT INTO order_details (order_id, product_id, color, quantity, unit_price) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection()) {
            connection.setAutoCommit(false);
            try {
                try (PreparedStatement orderStatement = connection.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                    Date appointmentDate = order.getAppointmentDate() == null ? null : Date.valueOf(order.getAppointmentDate());
                    bind(orderStatement, order.getCode(), order.getCustomer().getId(), order.getShowroom(), appointmentDate,
                            order.getAppointmentTime(), order.getPaymentMethod(), order.getStatus(), order.getTotal());
                    orderStatement.executeUpdate();
                    try (ResultSet keys = orderStatement.getGeneratedKeys()) {
                        if (keys.next()) {
                            order.setId(keys.getInt(1));
                        }
                    }
                }
                try (PreparedStatement detailStatement = connection.prepareStatement(detailSql)) {
                    for (OrderDetail detail : order.getDetails()) {
                        bind(detailStatement, order.getId(), detail.getProduct().getId(), detail.getColor(),
                                detail.getQuantity(), detail.getUnitPrice());
                        detailStatement.addBatch();
                    }
                    detailStatement.executeBatch();
                }
                connection.commit();
                return order;
            } catch (SQLException ex) {
                connection.rollback();
                throw ex;
            } finally {
                connection.setAutoCommit(true);
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot create order", ex);
        }
    }

    public List<Order> findByUser(User user) {
        String sql = "SELECT id FROM orders WHERE customer_id = ? ORDER BY created_at DESC";
        if (user != null && user.isAdmin()) {
            sql = "SELECT id FROM orders ORDER BY created_at DESC";
        }
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            if (user == null || !user.isAdmin()) {
                statement.setInt(1, user == null ? 0 : user.getId());
            }
            try (ResultSet rs = statement.executeQuery()) {
                List<Order> orders = new ArrayList<Order>();
                while (rs.next()) {
                    Optional<Order> order = findById(rs.getInt("id"));
                    if (order.isPresent()) {
                        orders.add(order.get());
                    }
                }
                return orders;
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load orders", ex);
        }
    }

    public Optional<Order> findById(int id) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                if (!rs.next()) {
                    return Optional.empty();
                }
                Order order = mapOrder(rs);
                order.getDetails().addAll(findDetails(connection, order.getId()));
                return Optional.of(order);
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load order", ex);
        }
    }

    public boolean updateStatus(int orderId, String status) {
        String sql = "UPDATE orders SET status=?, updated_at=SYSUTCDATETIME() WHERE id=?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            bind(statement, status, orderId);
            return statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update order status", ex);
        }
    }

    private List<OrderDetail> findDetails(Connection connection, int orderId) throws SQLException {
        String sql = "SELECT * FROM order_details WHERE order_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderId);
            try (ResultSet rs = statement.executeQuery()) {
                List<OrderDetail> details = new ArrayList<OrderDetail>();
                while (rs.next()) {
                    OrderDetail detail = new OrderDetail();
                    detail.setId(rs.getInt("id"));
                    Product product = productDao.findById(rs.getInt("product_id")).orElse(null);
                    detail.setProduct(product);
                    detail.setColor(rs.getString("color"));
                    detail.setQuantity(rs.getInt("quantity"));
                    detail.setUnitPrice(rs.getBigDecimal("unit_price"));
                    details.add(detail);
                }
                return details;
            }
        }
    }

    private Order mapOrder(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setId(rs.getInt("id"));
        order.setCode(rs.getString("code"));
        Optional<User> customer = userDao.findById(rs.getInt("customer_id"));
        if (customer.isPresent()) {
            order.setCustomer(customer.get());
        }
        order.setShowroom(rs.getString("showroom"));
        Date date = rs.getDate("appointment_date");
        if (date != null) {
            order.setAppointmentDate(date.toLocalDate());
        }
        order.setAppointmentTime(rs.getString("appointment_time"));
        order.setPaymentMethod(rs.getString("payment_method"));
        order.setStatus(rs.getString("status"));
        order.setTotal(rs.getBigDecimal("total"));
        return order;
    }
}
