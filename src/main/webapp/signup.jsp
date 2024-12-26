<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP - Signup Page</title>
    <!-- Link to local Bootstrap CSS -->
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Full-page background with gradient */
        body {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            background-size: cover;
            height: 100vh;
            margin: 0;
        }

        /* Navbar styling */
        .navbar {
            background-color: rgba(0, 114, 255, 0.9);
            padding: 15px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }

        /* Glass effect on the form container */
        .signup-container {
            background: rgba(255, 255, 255, 0.3);
            border-radius: 15px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        /* Center container */
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px); /* Full height minus navbar height */
            margin-top: 60px; /* Adjust for the fixed navbar */
        }

        /* Heading styles */
        h1 {
            color: white;
            text-align: center;
            margin-bottom: 30px;
        }

        /* Form input fields and button styles */
        .form-control {
            border-radius: 10px;
        }

        .btn-primary {
            background-color: #0072ff;
            border-color: #0072ff;
            border-radius: 10px;
            padding: 10px 20px;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #005bb5;
            border-color: #005bb5;
        }

        /* Links for Login */
        .mt-3 p {
            text-align: center;
            color: white;
        }

        .mt-3 a {
            color: #ffcc00;
            text-decoration: none;
        }

        .mt-3 a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<!-- Navbar at the top -->
<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<!-- Center Container -->
<div class="center-container">

    <!-- Signup Container -->
    <div class="signup-container">

        <h1>Signup</h1>

        <!-- Signup Form Start -->
        <form action="<%= request.getContextPath() %>/SignUpServlet" method="post">
            <div class="form-group">
                <label for="username" class="text-white">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
            </div>

            <div class="form-group">
                <label for="email" class="text-white">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="password" class="text-white">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <div class="form-group">
                <label for="confirmPassword" class="text-white">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
            </div>

            <button type="submit" class="btn btn-primary mt-3 mb-3">Signup</button>
        </form>
        <!-- Signup Form End -->

        <!-- Additional Links -->
        <div class="mt-3">
            <p>Already have an account? <a href="<%= request.getContextPath() %>/login.jsp">Login here</a></p>
        </div>
    </div>
</div>

<!-- Link to local Bootstrap JS and dependencies -->
<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>
