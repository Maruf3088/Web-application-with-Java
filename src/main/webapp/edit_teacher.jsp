<%@ page import="com.example.main.web_java.Teacher" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Teacher</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --background-color: #f8f9fa;
            --text-color: #333;
            --card-bg: #ffffff;
        }

        body {
            background-color: var(--background-color);
            font-family: 'Arial', sans-serif;
            color: var(--text-color);
        }

        .container {
            max-width: 1200px;
            background-color: var(--card-bg);
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            color: var(--primary-color);
            font-weight: 700;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-color);
        }

        .form-control {
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            border-radius: 8px;
            padding: 12px 24px;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #2980b9;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<%
    Teacher teacher = (Teacher) request.getAttribute("teacher");
%>

<div class="container mt-5">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <div class="header mt-4">
        <h1>Edit Teacher</h1>
    </div>
    <form action="update-teacher" method="post">
        <input type="hidden" name="id" value="<%= teacher.getId() %>">

        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= teacher.getName() %>" required>
        </div>

        <div class="mb-3">
            <label for="department" class="form-label">Department:</label>
            <input type="text" class="form-control" id="department" name="department" value="<%= teacher.getDepartment() %>" required>
        </div>

        <div class="mb-3">
            <label for="phone" class="form-label">Phone:</label>
            <input type="text" class="form-control" id="phone" name="phone" value="<%= teacher.getPhone() %>" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= teacher.getEmail() %>" required>
        </div>

        <div class="mb-3">
            <label for="course" class="form-label">Course:</label>
            <input type="text" class="form-control" id="course" name="course" value="<%= teacher.getCourse() %>" required>
        </div>

        <div class="mb-3">
            <label for="gender" class="form-label">Gender:</label>
            <select class="form-control" id="gender" name="gender" required>
                <option value="Male" <%= "Male".equals(teacher.getGender()) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= "Female".equals(teacher.getGender()) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= "Other".equals(teacher.getGender()) ? "selected" : "" %>>Other</option>
            </select>
        </div>

        <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-primary btn-lg">Update</button>
        </div>
    </form>
</div>

<script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
</body>
</html>