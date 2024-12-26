package com.example.main.web_java;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DatabaseConnection {

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/db_cse_2340?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = ""; // Use your actual password if needed

    // This method returns a database connection
    public static Connection getConnection() throws SQLException {
        try {
            // Load MySQL driver (optional in modern JDBC)
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
    }
}
