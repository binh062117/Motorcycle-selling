package com.motorcycle.dao;

import com.motorcycle.model.Role;
import com.motorcycle.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserDao extends SqlSupport {
    public List<User> findAll() {
        ensureAvatarColumn();
        String sql = "SELECT u.*, r.name AS role_name FROM users u INNER JOIN roles r ON r.id = u.role_id ORDER BY u.id";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            List<User> users = new ArrayList<User>();
            while (rs.next()) {
                users.add(map(rs));
            }
            return users;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load users", ex);
        }
    }

    public Optional<User> findById(int id) {
        ensureAvatarColumn();
        String sql = "SELECT u.*, r.name AS role_name FROM users u INNER JOIN roles r ON r.id = u.role_id WHERE u.id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? Optional.of(map(rs)) : Optional.empty();
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load user", ex);
        }
    }

    public Optional<User> findByEmail(String email) {
        ensureAvatarColumn();
        String sql = "SELECT u.*, r.name AS role_name FROM users u INNER JOIN roles r ON r.id = u.role_id WHERE LOWER(u.email) = LOWER(?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? Optional.of(map(rs)) : Optional.empty();
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load user by email", ex);
        }
    }

    public Optional<User> findByResetToken(String token) {
        ensureAvatarColumn();
        String sql = "SELECT u.*, r.name AS role_name FROM users u INNER JOIN roles r ON r.id = u.role_id WHERE u.reset_token = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, token);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? Optional.of(map(rs)) : Optional.empty();
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load user by token", ex);
        }
    }

    public User insert(User user) {
        ensureAvatarColumn();
        String sql = "INSERT INTO users (first_name, last_name, email, phone, address, password_hash, role_id, is_active, reset_token, avatar_url) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            bind(statement, user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhone(), user.getAddress(),
                    user.getPasswordHash(), user.getRole().getId(), user.isActive(), user.getResetToken(), user.getAvatarUrl());
            statement.executeUpdate();
            try (ResultSet keys = statement.getGeneratedKeys()) {
                if (keys.next()) {
                    user.setId(keys.getInt(1));
                }
            }
            return user;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot insert user", ex);
        }
    }

    public User update(User user) {
        ensureAvatarColumn();
        String sql = "UPDATE users SET first_name=?, last_name=?, email=?, phone=?, address=?, password_hash=?, role_id=?, "
                + "is_active=?, reset_token=?, avatar_url=?, updated_at=SYSUTCDATETIME() WHERE id=?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            bind(statement, user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhone(), user.getAddress(),
                    user.getPasswordHash(), user.getRole().getId(), user.isActive(), user.getResetToken(), user.getAvatarUrl(), user.getId());
            statement.executeUpdate();
            return user;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update user", ex);
        }
    }

    public boolean updateRole(int userId, int roleId) {
        String sql = "UPDATE users SET role_id=?, updated_at=SYSUTCDATETIME() WHERE id=?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            bind(statement, roleId, userId);
            return statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update user role", ex);
        }
    }

    private User map(ResultSet rs) throws SQLException {
        Role role = new Role(rs.getInt("role_id"), rs.getString("role_name"));
        User user = new User(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"),
                rs.getString("email"), rs.getString("phone"), rs.getString("password_hash"), role);
        user.setAddress(rs.getString("address"));
        user.setActive(rs.getBoolean("is_active"));
        user.setResetToken(rs.getString("reset_token"));
        user.setAvatarUrl(rs.getString("avatar_url"));
        return user;
    }

    private void ensureAvatarColumn() {
        String sql = "IF COL_LENGTH('dbo.users', 'avatar_url') IS NULL "
                + "ALTER TABLE dbo.users ADD avatar_url NVARCHAR(500) NULL";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement()) {
            statement.execute(sql);
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot ensure users.avatar_url column", ex);
        }
    }
}
