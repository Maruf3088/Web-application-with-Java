package com.example.main.web_java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/submit-ter")
@MultipartConfig( // This annotation handles multipart form data
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class SubmitTerServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads"; // Modify if dealing with file uploads

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Retrieve form data related to the teacher and course
        String teacherName = request.getParameter("teacherName");
        String course = request.getParameter("course");
        String scoreString = request.getParameter("score");

        // Validate the input fields
        if (teacherName == null || teacherName.trim().isEmpty() ||
                course == null || course.trim().isEmpty() ||
                scoreString == null || scoreString.trim().isEmpty()) {
            response.getWriter().println("Please fill out all required fields.");
            return;
        }

        // Convert the score string to integer
        int score = 0;
        try {
            score = Integer.parseInt(scoreString);
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid score value. Please enter a valid integer.");
            return;
        }

        // Use the common database connection utility to save form data
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Insert the data into the database
            String sql = "INSERT INTO ter_form (teacherName, course, score) " +
                    "VALUES (?, ?, ?)";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, teacherName);  // Set teacherName
                statement.setString(2, course);       // Set course
                statement.setInt(3, score);           // Set score as an integer

                statement.executeUpdate();  // Execute the insert query
                response.sendRedirect("view-ter");  // Redirect to the view page
            }

        } catch (SQLException e) {
            response.getWriter().println("Failed to save data: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
