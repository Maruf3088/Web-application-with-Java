package com.example.main.web_java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password); // Use proper password hashing in production

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                request.getSession().setAttribute("username", username);
                response.sendRedirect("index.jsp");
            } else {
                response.getWriter().println("Invalid credentials.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error.");
        }
    }
}
