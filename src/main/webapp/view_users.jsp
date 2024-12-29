<%@ page import="com.example.main.web_java.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        .users-container {
            max-width: 1200px;
            margin: 50px auto;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #343a40;
            text-align: center;
            font-size: 32px;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .info-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 20px;
        }

        .info-table th, .info-table td {
            padding: 15px 20px;
            text-align: left;
            font-size: 16px;
        }

        .info-table th {
            background-color: #343a40;
            color: white;
            font-weight: 600;
        }

        .info-table td {
            background-color: #f8f9fa;
            border: 1px solid #ddd;
        }

        .back-button {
            display: block;
            margin: 30px auto 0;
            text-align: center;
            padding: 12px 30px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .back-button:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>

<div class="users-container">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <h2 class="mt-4">Admin Profile</h2>

    <!-- Users Information Table -->
    <table class="info-table">
        <thead>
        <tr>
            <th>Attribute</th>
            <th>Data</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<User> userList = (List<User>) request.getAttribute("users");
            if (userList != null && !userList.isEmpty()) {
                for (User user : userList) {
        %>
        <tr>
            <td>Username</td>
            <td><%= user.getUsername() %></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><%= user.getEmail() %></td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <div class="password-container">
                    <input type="password" id="password_<%= user.getUsername() %>" value="<%= user.getPassword() %>" readonly />
                    <i class="fas fa-eye" onclick="togglePasswordVisibility('<%= user.getUsername() %>')"></i>
                </div>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>



</div>
<script>
    function togglePasswordVisibility(username) {
        var passwordField = document.getElementById('password_' + username);
        var icon = passwordField.nextElementSibling; // Get the icon next to the input field
        if (passwordField.type === "password") {
            passwordField.type = "text"; // Show password
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash"); // Change to eye-slash icon
        } else {
            passwordField.type = "password"; // Hide password
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye"); // Change back to eye icon
        }
    }
</script>

</body>
</html>
