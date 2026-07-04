package com.motorcycle.dao;

import com.motorcycle.model.Notification;
import com.motorcycle.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class NotificationDao extends SqlSupport {
    private final UserDao userDao = new UserDao();

    public Notification insert(Notification notification) {
        ensureTable();
        String sql = "INSERT INTO notifications (user_id, title, message, is_read) VALUES (?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            bind(statement, notification.getUser().getId(), notification.getTitle(), notification.getMessage(), notification.isRead());
            statement.executeUpdate();
            try (ResultSet keys = statement.getGeneratedKeys()) {
                if (keys.next()) {
                    notification.setId(keys.getInt(1));
                }
            }
            return notification;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot insert notification", ex);
        }
    }

    public List<Notification> findRecentForUser(int userId) {
        ensureTable();
        String sql = "SELECT TOP 30 * FROM notifications WHERE user_id = ? ORDER BY created_at DESC, id DESC";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            try (ResultSet rs = statement.executeQuery()) {
                List<Notification> notifications = new ArrayList<Notification>();
                while (rs.next()) {
                    notifications.add(map(rs));
                }
                return notifications;
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load notifications", ex);
        }
    }

    public int countUnreadForUser(int userId) {
        ensureTable();
        String sql = "SELECT COUNT(*) FROM notifications WHERE user_id = ? AND is_read = 0";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? rs.getInt(1) : 0;
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot count unread notifications", ex);
        }
    }

    public void markAllRead(int userId) {
        ensureTable();
        String sql = "UPDATE notifications SET is_read = 1, updated_at = SYSUTCDATETIME() WHERE user_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot mark notifications as read", ex);
        }
    }

    private Notification map(ResultSet rs) throws SQLException {
        Notification notification = new Notification();
        notification.setId(rs.getInt("id"));
        notification.setUser(userDao.findById(rs.getInt("user_id")).orElse(null));
        notification.setTitle(rs.getString("title"));
        notification.setMessage(rs.getString("message"));
        notification.setRead(rs.getBoolean("is_read"));
        Timestamp createdAt = rs.getTimestamp("created_at");
        Timestamp updatedAt = rs.getTimestamp("updated_at");
        if (createdAt != null) {
            notification.setCreatedAt(createdAt.toLocalDateTime());
        }
        if (updatedAt != null) {
            notification.setUpdatedAt(updatedAt.toLocalDateTime());
        }
        return notification;
    }

    private void ensureTable() {
        String sql = "IF OBJECT_ID(N'dbo.notifications', N'U') IS NULL "
                + "BEGIN "
                + "CREATE TABLE dbo.notifications ("
                + "id INT IDENTITY(1,1) NOT NULL CONSTRAINT pk_notifications PRIMARY KEY,"
                + "user_id INT NOT NULL,"
                + "title NVARCHAR(160) NOT NULL,"
                + "message NVARCHAR(1000) NOT NULL,"
                + "is_read BIT NOT NULL CONSTRAINT df_notifications_is_read DEFAULT 0,"
                + "created_at DATETIME2 NOT NULL CONSTRAINT df_notifications_created_at DEFAULT SYSUTCDATETIME(),"
                + "updated_at DATETIME2 NOT NULL CONSTRAINT df_notifications_updated_at DEFAULT SYSUTCDATETIME(),"
                + "CONSTRAINT fk_notifications_users FOREIGN KEY (user_id) REFERENCES dbo.users(id)"
                + "); "
                + "END; "
                + "IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'ix_notifications_user' AND object_id = OBJECT_ID(N'dbo.notifications')) "
                + "CREATE INDEX ix_notifications_user ON dbo.notifications(user_id)";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement()) {
            statement.execute(sql);
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot ensure notifications table", ex);
        }
    }
}
