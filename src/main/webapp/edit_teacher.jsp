<%@ page import="com.example.main.web_java.Teacher" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Teacher</title>
    <!-- Include Bootstrap CSS -->
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #343a40;
        }
        .form-label {
            color: #495057;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<%
    Teacher teacher = (Teacher) request.getAttribute("teacher");  // Casting the attribute to Teacher
%>

<div class="container mt-5">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <h1 class="mb-4 text-center">Edit Teacher</h1>
    <form action="update-teacher" method="post">
        <input type="hidden" name="id" value="<%= teacher.getId() %>">

        <!-- Name Field -->
        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= teacher.getName() %>" required>
        </div>

        <!-- Department Field -->
        <div class="mb-3">
            <label for="department" class="form-label">Department:</label>
            <input type="text" class="form-control" id="department" name="department" value="<%= teacher.getDepartment() %>" required>
        </div>

        <!-- Phone Field -->
        <div class="mb-3">
            <label for="phone" class="form-label">Phone:</label>
            <input type="text" class="form-control" id="phone" name="phone" value="<%= teacher.getPhone() %>" required>
        </div>

        <!-- Email Field -->
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= teacher.getEmail() %>" required>
        </div>

        <!-- Course Field -->
        <div class="mb-3">
            <label for="course" class="form-label">Course:</label>
            <input type="text" class="form-control" id="course" name="course" value="<%= teacher.getCourse() %>" required>
        </div>

        <!-- Gender Field -->
        <div class="mb-3">
            <label for="gender" class="form-label">Gender:</label>
            <select class="form-control" id="gender" name="gender" required>
                <option value="Male" <%= "Male".equals(teacher.getGender()) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= "Female".equals(teacher.getGender()) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= "Other".equals(teacher.getGender()) ? "selected" : "" %>>Other</option>
            </select>
        </div>

        <!-- Submit Button -->
        <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-primary btn-lg">Update</button>
        </div>
    </form>
</div>

<!-- Optional: Include Bootstrap JS (if needed) -->
<script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
