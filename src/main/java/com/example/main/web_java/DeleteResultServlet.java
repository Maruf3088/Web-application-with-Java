package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/delete-result")
public class DeleteResultServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contactId = request.getParameter("id");

        // Validate the contactId to ensure it's not null or empty
        if (contactId == null || contactId.isEmpty()) {
            response.getWriter().println("Error: contactId is missing or invalid.");
            return;
        }

        // Try to parse the contactId as an integer
        int id;
        try {
            id = Integer.parseInt(contactId);
        } catch (NumberFormatException e) {
            response.getWriter().println("Error: Invalid contactId format.");
            return;
        }

        // Use the common database connection utility
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM result_form WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, id);
                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("view-result");
                } else {
                    response.getWriter().println("Failed to delete the result. No matching record found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting result: " + e.getMessage());
        }
    }
}
