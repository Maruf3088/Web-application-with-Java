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

@WebServlet("/submit-result")
@MultipartConfig( // This annotation handles multipart form data
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class SubmitResultFormServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads"; // Modify if dealing with file uploads

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Retrieve form data
        String studentId = request.getParameter("studentId");
        String studentName = request.getParameter("studentName");
        String cgpaString = request.getParameter("cgpa");

        // Validate the input fields
        if (studentId == null || studentId.trim().isEmpty() ||
                studentName == null || studentName.trim().isEmpty() ||
                cgpaString == null || cgpaString.trim().isEmpty()) {
            response.getWriter().println("Please fill out all required fields.");
            return;
        }

        // Convert the CGPA string to a float
        float cgpa = 0;
        try {
            cgpa = Float.parseFloat(cgpaString);
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid CGPA value. Please enter a valid number.");
            return;
        }

        // Use the common database connection utility to save form data
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Insert the data into the database
            String sql = "INSERT INTO result_form (studentId, studentName, cgpa) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentId);  // Set studentId
                statement.setString(2, studentName);  // Set studentName
                statement.setFloat(3, cgpa);         // Set cgpa
                statement.executeUpdate();           // Execute the update

                // Redirect to the view page
                response.sendRedirect("view-result");
            }
        } catch (SQLException e) {
            response.getWriter().println("Failed to save data: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
