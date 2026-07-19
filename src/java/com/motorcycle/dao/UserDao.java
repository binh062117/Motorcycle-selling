package com.motorcycle.dao;

import com.motorcycle.model.Role;
import com.motorcycle.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserDao extends SqlSupport {
    public List<User> findAll() {
        ensureUserColumns();
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
        ensureUserColumns();
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
        ensureUserColumns();
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
        ensureUserColumns();
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

    public Optional<User> findByRememberToken(int userId, String tokenHash) {
        ensureUserColumns();
        String sql = "SELECT u.*, r.name AS role_name FROM users u INNER JOIN roles r ON r.id = u.role_id "
                + "WHERE u.id = ? AND u.remember_token_hash = ? AND u.remember_expires_at > SYSUTCDATETIME() AND u.is_active = 1";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            bind(statement, userId, tokenHash);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? Optional.of(map(rs)) : Optional.empty();
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load user by remember token", ex);
        }
    }

    public User insert(User user) {
        ensureUserColumns();
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
            if (isUniqueEmailViolation(ex)) {
                throw new IllegalArgumentException("Email \u0111\u00e3 t\u1ed3n t\u1ea1i trong h\u1ec7 th\u1ed1ng.", ex);
            }
            throw new IllegalStateException("Cannot insert user", ex);
        }
    }

    public User update(User user) {
        ensureUserColumns();
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

    public void updateRememberToken(int userId, String tokenHash, LocalDateTime expiresAt) {
        ensureUserColumns();
        String sql = "UPDATE users SET remember_token_hash=?, remember_expires_at=?, updated_at=SYSUTCDATETIME() WHERE id=?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            bind(statement, tokenHash, expiresAt == null ? null : Timestamp.valueOf(expiresAt), userId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update remember token", ex);
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
        user.setRememberTokenHash(rs.getString("remember_token_hash"));
        Timestamp rememberExpiresAt = rs.getTimestamp("remember_expires_at");
        user.setRememberExpiresAt(rememberExpiresAt == null ? null : rememberExpiresAt.toLocalDateTime());
        return user;
    }

    private void ensureUserColumns() {
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement()) {
            ensureColumn(statement, "address", "NVARCHAR(255) NULL");
            ensureColumn(statement, "reset_token", "NVARCHAR(120) NULL");
            ensureColumn(statement, "avatar_url", "NVARCHAR(500) NULL");
            ensureColumn(statement, "remember_token_hash", "NVARCHAR(128) NULL");
            ensureColumn(statement, "remember_expires_at", "DATETIME2 NULL");
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot ensure users optional columns", ex);
        }
    }

    private void ensureColumn(Statement statement, String columnName, String definition) throws SQLException {
        statement.execute("IF COL_LENGTH('dbo.users', '" + columnName + "') IS NULL "
                + "ALTER TABLE dbo.users ADD " + columnName + " " + definition);
    }

    private boolean isUniqueEmailViolation(SQLException ex) {
        for (Throwable current = ex; current != null; current = current.getCause()) {
            if (current instanceof SQLException) {
                SQLException sqlEx = (SQLException) current;
                if (sqlEx.getErrorCode() == 2601 || sqlEx.getErrorCode() == 2627) {
                    return true;
                }
                if ("23000".equals(sqlEx.getSQLState())) {
                    return true;
                }
            }
        }
        return false;
    }
}
