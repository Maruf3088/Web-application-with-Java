package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/update-teacher")
public class UpdateTeacherServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the request
        String teacherId = request.getParameter("id");
        String name = request.getParameter("name");
        String department = request.getParameter("department");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String gender = request.getParameter("gender");

        // Validate input data
        if (teacherId == null || teacherId.isEmpty() ||
                name == null || name.isEmpty() ||
                department == null || department.isEmpty() ||
                phone == null || phone.isEmpty() ||
                email == null || email.isEmpty() ||
                course == null || course.isEmpty() ||
                gender == null || gender.isEmpty()) {
            response.getWriter().println("All fields are required.");
            return;
        }

        // Use the common database connection utility
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "UPDATE teacher_form SET name = ?, department = ?, phone = ?, email = ?, course = ?, gender = ? WHERE id = ?";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // Set parameters
                statement.setString(1, name);
                statement.setString(2, department);
                statement.setString(3, phone);
                statement.setString(4, email);
                statement.setString(5, course);
                statement.setString(6, gender);
                statement.setInt(7, Integer.parseInt(teacherId));

                // Execute the update
                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("view-teacher");  // Assuming view-teacher is the correct page to show updated teacher details
                } else {
                    response.getWriter().println("No teacher found with the given ID.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error updating teacher: " + e.getMessage());
        }
    }
}
