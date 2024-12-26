<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP - Login Page</title>
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
        .login-container {
            background: rgba(255, 255, 255, 0.3);
            border-radius: 15px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            margin-top: 80px; /* Push down the form below the navbar */
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

        /* Links for Signup and Forgot Password */
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
<div class="d-flex justify-content-center align-items-center flex-column h-100">

    <!-- Navbar at the top -->
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>




    <!-- Login Container -->
    <div class="login-container">

        <h1>Login</h1>

        <!-- Login Form Start -->
        <form action="<%= request.getContextPath() %>/SignInServlet" method="post">
            <div class="form-group">
                <label for="username" class="text-white">User Name</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter your User Name" required>
            </div>

            <div class="form-group">
                <label for="password" class="text-white">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn btn-primary mt-3 mb-3">Login</button>
        </form>
        <!-- Login Form End -->

        <!-- Additional Links -->
        <div class="mt-3">
            <p>Don't have an account? <a href="<%= request.getContextPath() %>/signup.jsp">Signup here</a></p>
            <p><a href="<%= request.getContextPath() %>/forgot-password.jsp">Forgot your password?</a></p>
        </div>
    </div>
</div>

<!-- Link to local Bootstrap JS and dependencies -->
<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>