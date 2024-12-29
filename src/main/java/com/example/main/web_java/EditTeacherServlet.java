package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/edit-teacher")
public class EditTeacherServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teacherId = request.getParameter("id");

        // Use the common database connection utility
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM teacher_form WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, Integer.parseInt(teacherId));
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

                        // Set teacher object as request attribute
                        request.setAttribute("teacher", teacher);
                        // Forward the request to edit_teacher.jsp
                        RequestDispatcher dispatcher = request.getRequestDispatcher("edit_teacher.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        response.getWriter().println("Teacher not found.");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching teacher: " + e.getMessage());
        }
    }
}
