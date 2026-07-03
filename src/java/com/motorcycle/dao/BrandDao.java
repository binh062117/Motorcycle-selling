package com.motorcycle.dao;

import com.motorcycle.model.Brand;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class BrandDao extends SqlSupport {
    public List<Brand> findAll() {
        String sql = "SELECT id, name, origin FROM brands ORDER BY name";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            List<Brand> brands = new ArrayList<Brand>();
            while (rs.next()) {
                brands.add(map(rs));
            }
            return brands;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load brands", ex);
        }
    }

    public Optional<Brand> findById(int id) {
        String sql = "SELECT id, name, origin FROM brands WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? Optional.of(map(rs)) : Optional.empty();
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load brand", ex);
        }
    }

    public Brand save(Brand brand) {
        boolean update = brand.getId() > 0;
        String sql = update
                ? "UPDATE brands SET name = ?, origin = ?, updated_at = SYSUTCDATETIME() WHERE id = ?"
                : "INSERT INTO brands (name, origin) VALUES (?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            if (update) {
                bind(statement, brand.getName(), brand.getOrigin(), brand.getId());
            } else {
                bind(statement, brand.getName(), brand.getOrigin());
            }
            statement.executeUpdate();
            if (!update) {
                try (ResultSet keys = statement.getGeneratedKeys()) {
                    if (keys.next()) {
                        brand.setId(keys.getInt(1));
                    }
                }
            }
            return brand;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot save brand", ex);
        }
    }

    public boolean delete(int id) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM brands WHERE id = ?")) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot delete brand", ex);
        }
    }

    private Brand map(ResultSet rs) throws SQLException {
        return new Brand(rs.getInt("id"), rs.getString("name"), rs.getString("origin"));
    }
}
