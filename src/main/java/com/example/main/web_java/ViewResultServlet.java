package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/view-result")
public class ViewResultServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Result> resultList = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM result_form";  // Make sure this matches your DB structure
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    // Create a new Contact object and set values from the resultSet
                    Result result = new Result();
                    result.setId(resultSet.getInt("id"));
                    result.setStudentId(resultSet.getString("studentId"));  // Set student ID
                    result.setStudentName(resultSet.getString("studentName"));            // Set student name
                    result.setCgpa(resultSet.getFloat("cgpa"));             // Set CGPA value

                    // Add the contact to the list
                    resultList.add(result);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set the contact list as an attribute to be accessed in the JSP
        request.setAttribute("results", resultList);

        // Forward the request to the view_contact.jsp page for displaying the data
        RequestDispatcher dispatcher = request.getRequestDispatcher("view_result.jsp");
        dispatcher.forward(request, response);
    }
}
