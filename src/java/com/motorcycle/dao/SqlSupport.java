package com.motorcycle.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

abstract class SqlSupport {
    protected void bind(PreparedStatement statement, Object... values) throws SQLException {
        for (int i = 0; i < values.length; i++) {
            statement.setObject(i + 1, values[i]);
        }
    }
}
