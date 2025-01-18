<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Student Management System</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --background-color: #f8f9fa;
            --text-color: #333;
            --card-bg: #ffffff;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            animation: fadeIn 1.5s ease-in-out;
        }

        .container {
            max-width: 1200px;
            background-color: var(--card-bg);
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes zoomIn {
            0% {
                transform: scale(0.8);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        .header {
            text-align: center;
            padding: 30px 20px;
            background-color: var(--card-bg);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 900px;
        }

        .header h1 {
            font-size: 2.5rem;
            color: var(--primary-color);
        }

        .header p {
            font-size: 1.1rem;
            color: #666;
        }

        .content {
            margin: 20px auto;
            padding: 20px;
            background-color: var(--card-bg);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 900px;
        }

        .content h3 {
            font-size: 1.8rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .content p {
            font-size: 1.1rem;
            line-height: 1.6;
            color: #555;
        }

        ul {
            padding-left: 20px;
        }

        ul li {
            margin-bottom: 10px;
            color: #555;
        }

        .card {
            animation: zoomIn 1s ease;
            border: none;
            border-radius: 10px;
            background-color: var(--card-bg);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s, background-color 0.3s;
        }

        .card img {
            height: 200px;
            object-fit: cover;
        }

        .card:hover {
            transform: translateY(-10px);
            background-color: var(--primary-color);
            color: #ffffff;
        }

        .card-body {
            text-align: center;
            padding: 15px;
            color: var(--text-color);
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .btn-custom {
            display: inline-block;
            background-color: var(--primary-color);
            color: #ffffff;
            font-size: 1rem;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-custom:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #f1f1f1;
            color: #555;
            margin-top: 30px;
            border-top: 1px solid #ddd;
        }
    </style>
</head>

<body>
<div class="container">
    <!-- Navigation Bar -->
    <nav>
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

        <h4>Gallery:</h4>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3R1ZGVudHxlbnwwfHwwfHx8MA%3D%3D" alt="Student Image 1" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">Empowering Students</h5>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.unsplash.com/photo-1492538368677-f6e0afe31dcc?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHN0dWRlbnR8ZW58MHx8MHx8fDA%3D" alt="Student Image 2" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">Fostering Learning</h5>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://images.unsplash.com/photo-1460518451285-97b6aa326961?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3R1ZGVudHMlMjBsZWFybmluZ3xlbnwwfHwwfHx8MA%3D%3D" alt="Student Image 3" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">Shaping the Future</h5>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="index.jsp" class="btn-custom">Back to Home</a>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <p>&copy; 2025 Student Management System | All Rights Reserved</p>
    </div>
</div>

<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>

</html>
