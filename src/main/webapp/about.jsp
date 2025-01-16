<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Student Management System</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        /* Global Styles */

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        /* Navigation Bar */
        .navbar {
            background-color: #007bff;
        }


        /* Header Section */
        .header {
            text-align: center;
            padding: 30px 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 900px;
        }

        .header h1 {
            font-size: 2rem;
            color: #333;
        }

        .header p {
            font-size: 1rem;
            color: #666;
        }

        /* Content Section */
        .content {
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 900px;
        }

        .content h3 {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 10px;
        }

        .content p {
            font-size: 1rem;
            line-height: 1.6;
            color: #666;
        }

        .content ul {
            list-style-type: none;
            padding: 0;
        }

        .content ul li {
            font-size: 1rem;
            color: #333;
            margin-bottom: 10px;
        }

        /* Button Style */
        .btn-custom {
            display: inline-block;
            background-color: #28a745;
            color: white;
            font-size: 1rem;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-custom:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 20px;
            background-color: #007bff;
            color: white;
            margin-top: 30px;
        }
    </style>
</head>
<body class="container">
<!-- Navigation Bar -->
<nav class="">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
</nav>

<!-- Header Section -->
<div class="header">
    <h1>About Us</h1>
    <p>Learn more about the Student Management System and its features.</p>
</div>

<!-- Content Section -->
<div class="content">
    <h3>About This System</h3>
    <p>The Student Management System (SMS) is designed to simplify and manage student records efficiently. It helps academic institutions track and manage data effectively.</p>

    <h4>Key Features:</h4>
    <ul>
        <li>Student Enrollment & Management</li>
        <li>Course Registration & Tracking</li>
        <li>Real-time Grade Calculation</li>
        <li>Attendance Management</li>
        <li>Assignment & Exam Recording</li>
        <li>Report & Transcript Generation</li>
    </ul>

    <h4>How It Works:</h4>
    <p>The system offers an intuitive interface to manage personal details, grades, and attendance. Administrators and faculty can update and analyze student performance effortlessly.</p>

    <div class="text-center">
        <a href="index.jsp" class="btn-custom">Back to Home</a>
    </div>
</div>

<!-- Footer Section -->
<div class="footer">
    <p>&copy; 2024 Maruf Creations | All Rights Reserved</p>
</div>

<!-- Bootstrap JS -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
