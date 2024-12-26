package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/edit-contact")
public class EditContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contactId = request.getParameter("id");

        // Use the common database connection utility
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM contact_form WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, Integer.parseInt(contactId));
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        Contact contact = new Contact();
                        contact.setId(resultSet.getInt("id"));
                        contact.setStudentId(resultSet.getString("studentId"));
                        contact.setName(resultSet.getString("name"));
                        contact.setDepartment(resultSet.getString("department"));
                        contact.setSection(resultSet.getString("section"));


                        request.setAttribute("contact", contact);
                        RequestDispatcher dispatcher = request.getRequestDispatcher("edit_contact.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        response.getWriter().println("Contact not found.");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching contact: " + e.getMessage());
        }
    }
}