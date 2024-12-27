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

        // Manually retrieve grades for each course
        String CHEM2301Grade = request.getParameter("CHEM2301Grade");
        String CSE2321Grade = request.getParameter("CSE2321Grade");
        String CSE2322Grade = request.getParameter("CSE2322Grade");
        String CSE2323Grade = request.getParameter("CSE2323Grade");
        String CSE2324Grade = request.getParameter("CSE2324Grade");
        String CSE2340Grade = request.getParameter("CSE2340Grade");
        String MATH2307Grade = request.getParameter("MATH2307Grade");
        String STAT2311Grade = request.getParameter("STAT2311Grade");
        String URED2302Grade = request.getParameter("URED2302Grade");




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
            String sql = "INSERT INTO result_form (studentId, studentName, cgpa, CHEM2301Grade, CSE2321Grade, CSE2322Grade, CSE2323Grade, CSE2324Grade, CSE2340Grade, MATH2307Grade, STAT2311Grade, URED2302Grade) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentId);      // Set studentId
                statement.setString(2, studentName);    // Set studentName
                statement.setFloat(3, cgpa);             // Set cgpa
                statement.setString(4, CHEM2301Grade);       // Set CHEM_2301
                statement.setString(5, CSE2321Grade);        // Set CSE_2321
                statement.setString(6, CSE2322Grade);        // Set CSE_2322
                statement.setString(7, CSE2323Grade);        // Set CSE_2323
                statement.setString(8, CSE2324Grade);        // Set CSE_2324
                statement.setString(9, CSE2340Grade);        // Set CSE_2340
                statement.setString(10, MATH2307Grade);      // Set MATH_2307
                statement.setString(11, STAT2311Grade);      // Set STAT_2311
                statement.setString(12, URED2302Grade);      // Set URED_2302


                statement.executeUpdate();  // Execute the insert query
                response.sendRedirect("view-result");
            }


        } catch (SQLException e) {
            response.getWriter().println("Failed to save data: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
