package com.example.main.web_java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password); // Use hashed passwords in production
            stmt.setString(3, email);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("login.jsp");
            } else {
                response.getWriter().println("Error occurred during registration.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error.");
        }
    }
}
