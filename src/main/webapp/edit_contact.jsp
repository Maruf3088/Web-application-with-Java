<%@ page import="com.example.main.web_java.Contact" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Contact</title>
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
    Contact contact = (Contact) request.getAttribute("contact");  // Casting the attribute to Contact
%>

<div class="container mt-5">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <h1 class="mb-4 text-center">Edit Contact</h1>
    <form action="update-contact" method="post" >
        <input type="hidden" name="id" value="<%= contact.getId() %>">


        <!-- Student ID Field -->
        <div class="mb-3">
            <label for="studentId" class="form-label">Student ID:</label>
            <input type="text" class="form-control" id="studentId" name="studentId" value="<%= contact.getStudentId() %>" required>
        </div>

        <!-- Name Field -->
        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= contact.getName() %>" required>
        </div>

        <!-- Department Field -->
        <div class="mb-3">
            <label for="department" class="form-label">Department:</label>
            <input type="text" class="form-control" id="department" name="department" value="<%= contact.getDepartment() %>" required>
        </div>



        <!-- Section Field -->
        <div class="mb-3">
            <label for="section" class="form-label">Section:</label>
            <input type="text" class="form-control" id="section" name="section" value="<%= contact.getSection() %>" required>
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
