package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/view-ter")
public class ViewTerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Ter> teacherList = new ArrayList<>();  // Use Ter instead of Teacher

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM ter_form";  // Adjust table name if necessary
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {

                // Loop through the result set and add teachers to the list
                while (resultSet.next()) {
                    Ter ter = new Ter();  // Create a new Ter object
                    ter.setId(resultSet.getInt("id"));
                    ter.setTeacherName(resultSet.getString("teacherName"));  // Set teacherName
                    ter.setCourse(resultSet.getString("course"));            // Set course
                    ter.setScore(resultSet.getInt("score"));                // Set score (if score is an integer)

                    teacherList.add(ter);  // Add Ter object to the list
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set the teacher list as an attribute and forward to JSP
        request.setAttribute("teachers", teacherList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view_ter.jsp");
        dispatcher.forward(request, response);
    }
}
