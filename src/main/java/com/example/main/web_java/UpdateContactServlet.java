package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/update-contact")
public class UpdateContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the request
        String contactId = request.getParameter("id");
        String studentId = request.getParameter("studentId");
        String name = request.getParameter("name");
        String department = request.getParameter("department");
        String section = request.getParameter("section");
        String semester = request.getParameter("semester"); // New field
        String fatherName = request.getParameter("fatherName"); // New field
        String motherName = request.getParameter("motherName"); // New field
        String address = request.getParameter("address"); // New field

        // Validate input data
        if (contactId == null || contactId.isEmpty() ||
                studentId == null || studentId.isEmpty() ||
                name == null || name.isEmpty() ||
                department == null || department.isEmpty() ||
                section == null || section.isEmpty() ||
                semester == null || semester.isEmpty() ||
                fatherName == null || fatherName.isEmpty() ||
                motherName == null || motherName.isEmpty() ||
                address == null || address.isEmpty()) {
            response.getWriter().println("All fields are required.");
            return;
        }

        // Use the common database connection utility
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "UPDATE contact_form SET studentId = ?, name = ?, department = ?, section = ?, semester = ?, fatherName = ?, motherName = ?, address = ? WHERE id = ?";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // Set parameters
                statement.setString(1, studentId);
                statement.setString(2, name);
                statement.setString(3, department);
                statement.setString(4, section);
                statement.setString(5, semester);  // New field
                statement.setString(6, fatherName); // New field
                statement.setString(7, motherName); // New field
                statement.setString(8, address);    // New field
                statement.setInt(9, Integer.parseInt(contactId));

                // Execute the update
                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("view-contact");  // Assuming view-contact is the correct page to show updated contacts
                } else {
                    response.getWriter().println("No contact found with the given ID.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error updating contact: " + e.getMessage());
        }
    }
}
