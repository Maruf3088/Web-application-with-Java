<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Student Result</title>
    <!-- Link to Bootstrap CSS -->
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <!-- Optional: Link to custom styles if you have them -->
    <style>
        body {
            background-color: #f8f9fa;
            margin-top: 50px;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 18px;
            color: #333;
        }

        .form-control {
            border-radius: 5px;
            box-shadow: none;
            border: 1px solid #ddd;
            transition: border-color 0.3s ease-in-out;
        }

        .form-control:focus {
            border-color: #007bff;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            font-size: 16px;
            font-weight: 500;
            border-radius: 5px;
            width: 100%;
            padding: 12px;
            transition: background-color 0.3s ease-in-out;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<!-- Navbar (if you want to keep the navbar include) -->

<!-- Main Content -->
<div class="container">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>

    <div class="form-card mx-auto">
        <h1 class="form-title">Search Student Result</h1>

        <!-- Search Form -->
        <form action="search-Result" method="post">
            <div class="mb-4">
                <label for="studentId" class="form-label">Enter Student ID:</label>
                <input type="text" id="studentId" name="studentId" required class="form-control p-3">
            </div>

            <button type="submit" class="btn-custom">Search</button>
        </form>
    </div>
</div>

<!-- Optional: Link to Bootstrap JS (for functionality like tooltips, modals, etc.) -->
<script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>

</body>
</html>
