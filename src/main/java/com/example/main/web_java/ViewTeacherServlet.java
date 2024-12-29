package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/view-teacher")
public class ViewTeacherServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Teacher> teacherList = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM teacher_form"; // Adjust table name and columns
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    Teacher teacher = new Teacher();
                    teacher.setId(resultSet.getInt("id"));
                    teacher.setName(resultSet.getString("name"));
                    teacher.setDepartment(resultSet.getString("department"));
                    teacher.setEmail(resultSet.getString("email"));
                    teacher.setCourse(resultSet.getString("course"));


                    teacherList.add(teacher); // Add teacher to list
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set the teacher list as an attribute and forward to JSP
        request.setAttribute("teachers", teacherList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view_teacher.jsp");
        dispatcher.forward(request, response);
    }
}
