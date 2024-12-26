package com.example.main.web_java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/submit-form")
@MultipartConfig( // This annotation handles multipart form data
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class SubmitFormServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String studentId = request.getParameter("studentId");
        String name = request.getParameter("name");
        String department = request.getParameter("department");
        String section = request.getParameter("section");





        // Use the common database connection utility to save form data and file path
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO contact_form (studentId , name , department , section) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentId);
                statement.setString(2, name);
                statement.setString(3, department);
                statement.setString(4, section);
                statement.executeUpdate();
                response.sendRedirect("view-contact");
            }
        } catch (SQLException e) {
            response.getWriter().println("Failed to save data: " + e.getMessage());
            e.printStackTrace();
        }
    }
}