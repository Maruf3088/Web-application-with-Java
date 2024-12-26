package com.example.main.web_java;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        // Add logic to check if the email exists and send a reset link
        // Example: Send email with a reset token link
        //boolean isEmailSent = PasswordResetService.sendResetLink(email);
        boolean isEmailSent=true;
        if (isEmailSent) {
            response.getWriter().println("Password reset link has been sent to your email.");
        } else {
            response.getWriter().println("Email address not found.");
        }
    }
}
