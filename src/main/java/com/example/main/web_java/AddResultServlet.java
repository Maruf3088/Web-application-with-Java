package com.example.main.web_java;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/add_result")
public class AddResultServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the studentId and studentName from the form
        String studentId = request.getParameter("studentId");
        String studentName = request.getParameter("studentName");

        System.out.println("Received studentId: " + studentId);
        System.out.println("Received studentName: " + studentName);

        // Pass the values as request attributes
        request.setAttribute("studentId", studentId);
        request.setAttribute("studentName", studentName);

        // Forward the request to add_result.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_result.jsp");
        dispatcher.forward(request, response);
    }
}
