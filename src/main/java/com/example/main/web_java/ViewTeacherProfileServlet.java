package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/view-teacher-profile")
public class ViewTeacherProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teacherId = request.getParameter("id");

        // Validate input
        if (teacherId == null || teacherId.isEmpty()) {
            response.getWriter().println("Teacher ID is required.");
            return;
        }

        // Use the common database connection utility
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM teacher_form WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, Integer.parseInt(teacherId));
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        Teacher teacher = new Teacher();
                        teacher.setId(resultSet.getInt("id")); // Teacher ID
                        teacher.setName(resultSet.getString("name")); // Teacher Name
                        teacher.setDepartment(resultSet.getString("department")); // Department
                        teacher.setPhone(resultSet.getString("phone")); // Phone Number
                        teacher.setEmail(resultSet.getString("email")); // Email
                        teacher.setCourse(resultSet.getString("course")); // Course
                        teacher.setGender(resultSet.getString("gender")); // Gender

                        // Pass the teacher object to the JSP
                        request.setAttribute("teacher", teacher);
                        RequestDispatcher dispatcher = request.getRequestDispatcher("view_teacher_profile.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        response.getWriter().println("Teacher not found.");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching teacher profile: " + e.getMessage());
        }
    }
}
