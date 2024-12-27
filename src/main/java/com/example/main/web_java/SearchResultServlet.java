package com.example.main.web_java;

import com.example.main.web_java.Result;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/search-Result")
public class SearchResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        Result result = null;
        System.out.println("Received studentId: " + studentId);

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            try {
                // Establish the connection with the correct credentials
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_cse_2340", "root", ""); // Replace with your actual credentials
            } catch (SQLException e) {
                System.out.println("Connection failed: " + e.getMessage());
            }


            // Prepare SQL query
            String sql = "SELECT * FROM result_form WHERE studentId = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, studentId);

            // Execute the query
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Populate Result object
                result = new Result();
                result.setStudentId(rs.getString("studentId"));
                result.setStudentName(rs.getString("studentName"));
                result.setCgpa(rs.getFloat("cgpa"));
                result.setCHEM2301Grade(rs.getString("CHEM2301Grade"));
                result.setCSE2321Grade(rs.getString("CSE2321Grade"));
                result.setCSE2322Grade(rs.getString("CSE2322Grade"));
                result.setCSE2323Grade(rs.getString("CSE2323Grade"));
                result.setCSE2324Grade(rs.getString("CSE2324Grade"));
                result.setCSE2340Grade(rs.getString("CSE2340Grade"));
                result.setMATH2307Grade(rs.getString("MATH2307Grade"));
                result.setSTAT2311Grade(rs.getString("STAT2311Grade"));
                result.setURED2302Grade(rs.getString("URED2302Grade"));

            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Replace with proper logging
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Replace with proper logging
            }
        }

        // Forward to JSP or show error message
        if (result != null) {
            request.setAttribute("result", result);
            RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
            dispatcher.forward(request, response);
        } else {
            response.getWriter().println("Student ID not found.");
        }
    }
}
