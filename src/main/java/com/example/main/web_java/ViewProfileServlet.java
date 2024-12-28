package com.example.main.web_java;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/view-profile")
public class ViewProfileServlet extends HttpServlet {

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
                        contact.setId(resultSet.getInt("id")); // Serial number
                        contact.setStudentId(resultSet.getString("studentId")); // Student ID
                        contact.setName(resultSet.getString("name")); // Name
                        contact.setDepartment(resultSet.getString("department")); // Department
                        contact.setSection(resultSet.getString("section")); // Section
                        contact.setSemester(resultSet.getString("semester")); // New field: Semester
                        contact.setFatherName(resultSet.getString("fatherName")); // New field: Father's name
                        contact.setMotherName(resultSet.getString("motherName")); // New field: Mother's name
                        contact.setAddress(resultSet.getString("address")); // New field: Address


                        // Pass the contact object to the JSP
                        request.setAttribute("contact", contact);
                        RequestDispatcher dispatcher = request.getRequestDispatcher("view_profile.jsp");
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
