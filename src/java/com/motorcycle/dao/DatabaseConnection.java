package com.motorcycle.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DatabaseConnection {
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String DEFAULT_URL = "jdbc:sqlserver://localhost;databaseName=MotorcycleSalesDB;encrypt=true;trustServerCertificate=true";
    private static final String DEFAULT_USER = "motorcycle_app";
    private static final String DEFAULT_PASSWORD = "Motorcycle@123";

    private DatabaseConnection() {
    }

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException ex) {
            throw new SQLException("SQL Server JDBC Driver not found", ex);
        }
        return DriverManager.getConnection(
                value("DB_URL", DEFAULT_URL),
                value("DB_USER", DEFAULT_USER),
                value("DB_PASSWORD", DEFAULT_PASSWORD)
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
