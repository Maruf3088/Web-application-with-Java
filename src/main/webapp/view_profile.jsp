<%@ page import="com.example.main.web_java.Contact" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        .profile-container {
            max-width: 1100px;
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

        h3 {
            color: #6c757d;
            text-align: center;
            font-size: 20px;
            margin-bottom: 30px;
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
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .info-table td {
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-top: none;
        }

        .info-table tr:last-child td:first-child {
            border-bottom-left-radius: 10px;
        }

        .info-table tr:last-child td:last-child {
            border-bottom-right-radius: 10px;
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

        .no-info-message {
            text-align: center;
            color: #dc3545;
            font-size: 18px;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<div class="profile-container">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <h2 class="mt-4">Student Profile</h2>
    <h3>View your profile details below</h3>

    <!-- Check if the contact object exists -->
    <%
        Contact contact = (Contact) request.getAttribute("contact");
        if (contact != null) {
    %>
    <!-- Profile Information Table -->
    <table class="info-table">
        <thead>
        <tr>
            <th colspan="2">Student Information</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Student ID</td>
            <td><%= contact.getStudentId() %></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><%= contact.getName() %></td>
        </tr>
        <tr>
            <td>Department</td>
            <td><%= contact.getDepartment() %></td>
        </tr>
        <tr>
            <td>Section</td>
            <td><%= contact.getSection() %></td>
        </tr>
        <tr>
            <td>Semester</td>
            <td><%= contact.getSemester() %></td>
        </tr>
        <tr>
            <td>Father's Name</td>
            <td><%= contact.getFatherName() %></td>
        </tr>
        <tr>
            <td>Mother's Name</td>
            <td><%= contact.getMotherName() %></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><%= contact.getAddress() %></td>
        </tr>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p class="no-info-message">No profile information found.</p>
    <%
        }
    %>

    <!-- Back Button -->
    <a href="javascript:window.history.back();" class="back-button">Back</a>

</div>

</body>
</html>
