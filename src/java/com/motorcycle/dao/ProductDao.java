package com.motorcycle.dao;

import com.motorcycle.model.Brand;
import com.motorcycle.model.Category;
import com.motorcycle.model.Product;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductDao extends SqlSupport {
    public List<Product> search(String keyword, String brand, String category, String priceFilter) {
        StringBuilder sql = new StringBuilder("SELECT p.*, b.name AS brand_name, b.origin AS brand_origin, "
                + "c.name AS category_name, c.description AS category_description "
                + "FROM products p INNER JOIN brands b ON b.id = p.brand_id "
                + "INNER JOIN categories c ON c.id = p.category_id WHERE p.is_active = 1");
        List<Object> params = new ArrayList<Object>();
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND (p.name LIKE ? OR p.sku LIKE ? OR p.description LIKE ?)");
            String term = "%" + keyword.trim() + "%";
            params.add(term);
            params.add(term);
            params.add(term);
        }
        if (brand != null && !brand.trim().isEmpty()) {
            sql.append(" AND b.name = ?");
            params.add(brand.trim());
        }
        if (category != null && !category.trim().isEmpty()) {
            sql.append(" AND c.name = ?");
            params.add(category.trim());
        }
        appendPrice(sql, params, priceFilter);
        sql.append(" ORDER BY p.price DESC");

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql.toString())) {
            bind(statement, params.toArray());
            try (ResultSet rs = statement.executeQuery()) {
                List<Product> products = new ArrayList<Product>();
                while (rs.next()) {
                    products.add(map(rs));
                }
                return products;
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot search products", ex);
        }
    }

    public Optional<Product> findById(int id) {
        String sql = "SELECT p.*, b.name AS brand_name, b.origin AS brand_origin, "
                + "c.name AS category_name, c.description AS category_description "
                + "FROM products p INNER JOIN brands b ON b.id = p.brand_id "
                + "INNER JOIN categories c ON c.id = p.category_id WHERE p.id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? Optional.of(map(rs)) : Optional.empty();
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load product", ex);
        }
    }

    public Product save(Product product) {
        boolean update = product.getId() > 0;
        String sql = update
                ? "UPDATE products SET name=?, sku=?, brand_id=?, category_id=?, price=?, stock=?, displacement=?, horsepower=?, weight=?, image_url=?, description=?, is_active=?, updated_at=SYSUTCDATETIME() WHERE id=?"
                : "INSERT INTO products (name, sku, brand_id, category_id, product_type, price, stock, displacement, horsepower, weight, image_url, description, is_active) VALUES (?, ?, ?, ?, N'MOTORCYCLE', ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            int brandId = product.getBrand() == null ? 1 : product.getBrand().getId();
            int categoryId = product.getCategory() == null ? 1 : product.getCategory().getId();
            if (update) {
                bind(statement, product.getName(), product.getSku(), brandId, categoryId, product.getPrice(),
                        product.getStock(), product.getDisplacement(), product.getHorsepower(), product.getWeight(),
                        product.getImageUrl(), product.getDescription(), product.isActive(), product.getId());
            } else {
                bind(statement, product.getName(), product.getSku(), brandId, categoryId, product.getPrice(),
                        product.getStock(), product.getDisplacement(), product.getHorsepower(), product.getWeight(),
                        product.getImageUrl(), product.getDescription(), product.isActive());
            }
            statement.executeUpdate();
            if (!update) {
                try (ResultSet keys = statement.getGeneratedKeys()) {
                    if (keys.next()) {
                        product.setId(keys.getInt(1));
                    }
                }
            }
            return product;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot save product", ex);
        }
    }

    public boolean delete(int id) {
        String sql = "UPDATE products SET is_active = 0, updated_at = SYSUTCDATETIME() WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot delete product", ex);
        }
    }

    private void appendPrice(StringBuilder sql, List<Object> params, String priceFilter) {
        if ("under_300".equals(priceFilter)) {
            sql.append(" AND p.price < ?");
            params.add(new BigDecimal("300000000"));
        } else if ("300_500".equals(priceFilter)) {
            sql.append(" AND p.price >= ? AND p.price <= ?");
            params.add(new BigDecimal("300000000"));
            params.add(new BigDecimal("500000000"));
        } else if ("over_500".equals(priceFilter)) {
            sql.append(" AND p.price > ?");
            params.add(new BigDecimal("500000000"));
        }
    }

    private Product map(ResultSet rs) throws SQLException {
        Brand brand = new Brand(rs.getInt("brand_id"), rs.getString("brand_name"), rs.getString("brand_origin"));
        Category category = new Category(rs.getInt("category_id"), rs.getString("category_name"), rs.getString("category_description"));
        Product product = new Product(rs.getInt("id"), rs.getString("name"), rs.getString("sku"), brand, category,
                rs.getBigDecimal("price"), rs.getInt("stock"));
        product.setDisplacement(rs.getString("displacement"));
        product.setHorsepower(rs.getString("horsepower"));
        product.setWeight(rs.getString("weight"));
        product.setImageUrl(rs.getString("image_url"));
        product.setDescription(rs.getString("description"));
        product.setActive(rs.getBoolean("is_active"));
        return product;
    }
}
