package com.example.main.web_java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/submit-teacher-form")
@MultipartConfig( // This annotation handles multipart form data
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class SubmitTeacherFormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String department = request.getParameter("department");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String gender = request.getParameter("gender");

        // Use the common database connection utility to save teacher data
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO teacher_form (name, department, phone, email, course, gender) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, department);
                statement.setString(3, phone);
                statement.setString(4, email);
                statement.setString(5, course);
                statement.setString(6, gender);

                statement.executeUpdate();
                response.sendRedirect("view-teacher");  // Redirect to a view page after success
            }
        } catch (SQLException e) {
            response.getWriter().println("Failed to save teacher data: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
