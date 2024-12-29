package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/ter-submission")
public class TerSubmissionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teacherId = request.getParameter("course");

        // Validate if the teacherId parameter is provided
        if (teacherId == null || teacherId.isEmpty()) {
            response.getWriter().println("Missing course parameter.");
            return;
        }

        // Use the common database connection utility
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM teacher_form WHERE course = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // Assuming 'course' is a string, use setString
                statement.setString(1, teacherId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        // Create Teacher object and set the properties
                        Teacher teacher = new Teacher();
                        teacher.setId(resultSet.getInt("id")); // Teacher ID
                        teacher.setName(resultSet.getString("name")); // Teacher name
                        teacher.setDepartment(resultSet.getString("department")); // Department
                        teacher.setPhone(resultSet.getString("phone")); // Phone
                        teacher.setEmail(resultSet.getString("email")); // Email
                        teacher.setCourse(resultSet.getString("course")); // Course
                        teacher.setGender(resultSet.getString("gender")); // Gender

                        // Set teacher object as request attribute (changed to "teacher" instead of "teachers")
                        request.setAttribute("teacher", teacher);
                        // Forward the request to ter_submission.jsp
                        RequestDispatcher dispatcher = request.getRequestDispatcher("ter_submission.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        // Teacher not found, you can also forward to an error page
                        response.getWriter().println("Teacher not found.");
                    }
                }
            }
        } catch (SQLException e) {
            log("Error fetching teacher from database", e); // Log the error
            response.getWriter().println("Sorry, an error occurred while fetching teacher data.");
        }
    }
}
