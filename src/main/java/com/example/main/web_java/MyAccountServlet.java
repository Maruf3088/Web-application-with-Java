package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/my-account")
public class MyAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // List to store user objects
        List<User> userList = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            // SQL query to fetch user data
            String sql = "SELECT * FROM users"; // Adjust table name and columns as needed
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    // Create a new User object and set its properties
                    User user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setPassword(resultSet.getString("password"));
                    user.setEmail(resultSet.getString("email"));

                    // Add the user object to the list
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set the user list as an attribute and forward to JSP
        request.setAttribute("users", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view_users.jsp");
        dispatcher.forward(request, response);
    }
}
