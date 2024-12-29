<%@ page import="com.example.main.web_java.Teacher" %>
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
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }

    h2 {
      color: #343a40;
      text-align: center;
      font-size: 32px;
      margin-bottom: 10px;
      font-weight: 600;
    }

    h3 {
      color: #6c757d;
      text-align: center;
      font-size: 20px;
      margin-bottom: 30px;
    }

    .table {
      width: 100%;
      margin-top: 20px;
      border-collapse: collapse;
    }

    .table th, .table td {
      padding: 15px;
      text-align: left;
      border: 1px solid #ddd;
    }

    .table th {
      background-color: #343a40;
      color: white;
      font-size: 16px;
      font-weight: 500;
    }

    .table td {
      background-color: #ffffff;
      font-size: 14px;
    }

    .table tr:nth-child(even) td {
      background-color: #f8f9fa;
    }

    .table tr:hover {
      background-color: #f1f1f1;
    }

    .back-button {
      display: block;
      margin-top: 30px;
      text-align: center;
      padding: 12px 30px;
      background-color: #28a745;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    .back-button:hover {
      background-color: #218838;
    }

    .profile-details {
      margin-top: 20px;
    }
  </style>
</head>
<body>

<div class="profile-container">
  <div> <%@ include file="/WEB-INF/includes/navbar.jsp" %></div>
  <h2>Teacher Profile</h2>
  <h3>View your profile details below</h3>

  <!-- Check if the teacher object exists -->
  <%
    Teacher teacher = (Teacher) request.getAttribute("teacher");
    if (teacher != null) {
  %>
  <div class="profile-details">
    <!-- Profile Information Table -->
    <table class="table">
      <thead>
      <tr>
        <th colspan="2" class="text-center">Teacher Information</th>
      </tr>
      </thead>
      <tbody>

      <tr>
        <th>Name:</th>
        <td><%= teacher.getName() %></td>
      </tr>
      <tr>
        <th>Department:</th>
        <td><%= teacher.getDepartment() %></td>
      </tr>
      <tr>
        <th>Phone:</th>
        <td><%= teacher.getPhone() %></td>
      </tr>
      <tr>
        <th>Email:</th>
        <td><%= teacher.getEmail() %></td>
      </tr>
      <tr>
        <th>Course:</th>
        <td><%= teacher.getCourse() %></td>
      </tr>
      <tr>
        <th>Gender:</th>
        <td><%= teacher.getGender() %></td>
      </tr>
      </tbody>
    </table>
  </div>
  <%
  } else {
  %>
  <p>No profile information found.</p>
  <%
    }
  %>

  <!-- Back Button -->
  <a href="index.jsp" class="back-button">Back to Home</a>
</div>

</body>
</html>
