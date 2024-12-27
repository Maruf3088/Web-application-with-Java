<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Student Management System</title>
    <!-- Link to local Bootstrap CSS -->
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f7fc;
            color: #333;
            font-family: 'Arial', sans-serif;
        }

        .header {
            background-color: #4a90e2;
            color: white;
            padding: 20px;

            text-align: center;
        }

        .section {
            margin-top: 30px;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-custom {
            margin-top: 20px;
            padding: 10px 20px;
            font-weight: bold;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            transition: transform 0.3s ease;
        }

        .btn-custom:hover {
            transform: translateY(-3px);
        }

        .feature-list {
            list-style-type: none;
            padding-left: 0;
        }

        .feature-list li {
            margin-bottom: 10px;
            font-size: 16px;
            line-height: 1.5;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #4a90e2;
            color: white;
            margin-top: 30px;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>

    <div class="header">
        <h1>Student Management System</h1>
        <p class="lead">Manage student information and academic performance with ease.</p>
    </div>

    <div class="section">
        <h3>About This System</h3>
        <p>
            The Student Management System (SMS) is a powerful tool designed to manage and track student records in a user-friendly interface. The system aims to streamline administrative tasks such as storing student data, calculating grades, and generating reports, making it a valuable tool for academic institutions.
        </p>

        <h4>Key Features:</h4>
        <ul class="feature-list">
            <li>Student Enrollment & Management</li>
            <li>Course Registration & Management</li>
            <li>Real-time Grade Calculation</li>
            <li>Attendance Tracking</li>
            <li>Assignment & Exam Results Recording</li>
            <li>Generate Transcripts & Reports</li>
            <li>Manage Multiple Students with Ease</li>
        </ul>

        <h4>How It Works:</h4>
        <p>
            The system allows administrators and faculty members to manage students' information, including personal details, courses, grades, and attendance. With a simple interface, users can easily input data, calculate grades, and generate results.
        </p>

        <div class="d-flex justify-content-center">
            <a href="index.jsp" class="btn btn-custom">Back to Home</a>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 Student Management System | All Rights Reserved</p>
    </div>
</div>

<!-- Link to local Bootstrap JS and dependencies -->
<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>
