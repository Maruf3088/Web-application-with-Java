<%@ page import="com.example.main.web_java.Teacher" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Profile</title>
  <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    body {
      background-color: #f0f4f8;
      font-family: 'Nunito', sans-serif;
      margin: 0;
      padding: 0;
      color: #333;
    }

    .profile-container {
      max-width: 1200px;
      margin: 0px auto;
      background-color: #ffffff;
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .profile-container:hover {
      transform: translateY(-5px);
    }

    h2 {
      color: #4a90e2;
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

    .table {
      width: 100%;
      margin-top: 20px;
      border-collapse: separate;
      border-spacing: 0;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .table th, .table td {
      padding: 15px;
      text-align: left;
      border: none;
    }

    .table th {
      background-color: #4a90e2;
      color: white;
      font-size: 18px;
      font-weight: 600;
      text-transform: uppercase;
    }

    .table td {
      background-color: #ffffff;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    .table tr:nth-child(even) td {
      background-color: #f8f9fa;
    }

    .table tr:hover td {
      background-color: #e8f0fe;
    }

    .back-button {
      display: inline-block;
      margin-top: 30px;
      padding: 12px 30px;
      background-color: #4a90e2;
      color: white;
      text-decoration: none;
      border-radius: 25px;
      font-size: 16px;
      font-weight: 600;
      transition: all 0.3s ease;
      border: none;
      cursor: pointer;
    }

    .back-button:hover {
      background-color: #3a7bc8;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(74, 144, 226, 0.3);
    }

    .profile-details {
      margin-top: 20px;
      animation: fadeIn 1s ease;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>
<body>

<div class="profile-container">
  <div> <%@ include file="/WEB-INF/includes/navbar.jsp" %></div>
  <h2 class="mt-4">Teacher Profile</h2>
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
  <a href="javascript:window.history.back();" class="back-button">
    <i class="fas fa-arrow-left"></i> Back
  </a>

</div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const profileDetails = document.querySelector('.profile-details');
    profileDetails.style.opacity = '0';
    profileDetails.style.transform = 'translateY(20px)';
    setTimeout(() => {
      profileDetails.style.opacity = '1';
      profileDetails.style.transform = 'translateY(0)';
      profileDetails.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
    }, 100);
  });
</script>

</body>
</html>

