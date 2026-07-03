package com.motorcycle.dao;

import com.motorcycle.model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class CategoryDao {
    public List<Category> findAll() {
        String sql = "SELECT id, name, description FROM categories ORDER BY name";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            List<Category> categories = new ArrayList<Category>();
            while (rs.next()) {
                categories.add(map(rs));
            }
            return categories;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load categories", ex);
        }
    }

    public Optional<Category> findById(int id) {
        String sql = "SELECT id, name, description FROM categories WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? Optional.of(map(rs)) : Optional.empty();
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load category", ex);
        }
    }

    private Category map(ResultSet rs) throws SQLException {
        return new Category(rs.getInt("id"), rs.getString("name"), rs.getString("description"));
    }
}
