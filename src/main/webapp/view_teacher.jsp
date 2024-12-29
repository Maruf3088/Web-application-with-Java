<%@ page import="com.example.main.web_java.Teacher" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher Data</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            width: 90%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .table-container {
            margin-top: 30px;
        }
        .table {
            font-size: 1rem;
            border-radius: 8px;
            overflow: hidden;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .table-striped tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }
        .thead-light th {
            background-color: #f8f9fa;
            color: #333;
        }
        .actions button {
            margin: 2px;
        }
        .actions .btn {
            padding: 8px 12px;
            font-size: 0.9rem;
        }
        .edit-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            transition: background-color 0.3s;
        }
        .edit-button:hover {
            background-color: #45a049;
        }
        .delete-button {
            background-color: #f44336;
            color: white;
            border: none;
            transition: background-color 0.3s;
        }
        .delete-button:hover {
            background-color: #d32f2f;
        }
        .add-result-button {
            background-color: #2196F3;
            color: white;
            border: none;
            transition: background-color 0.3s;
        }
        .add-result-button:hover {
            background-color: #1976d2;
        }
        .no-data {
            text-align: center;
            font-size: 1.2rem;
            color: #888;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <h2 class="text-center fw-bold pt-4">Teacher Data</h2>

    <div class="table-container">
        <table class="table table-striped table-hover">
            <thead class="thead-light">
            <tr>
                <th>SL.</th>
                <th>Name</th>
                <th>Department</th>
                <th>Email</th>
                <th>Course</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers");
                if (teachers != null && !teachers.isEmpty()) {
                    for (Teacher teacher : teachers) {
            %>
            <tr>
                <td><%= teacher.getId() %></td>
                <td><%= teacher.getName() %></td>
                <td><%= teacher.getDepartment() %></td>
                <td><%= teacher.getEmail() %></td>
                <td><%= teacher.getCourse() %></td>
                <td class="actions">
                    <!-- Edit Button -->
                    <form action="edit-teacher" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="<%= teacher.getId() %>">
                        <button type="submit" class="btn edit-button btn-sm">Edit</button>
                    </form>
                    <!-- Delete Button -->
                    <form action="delete-teacher" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= teacher.getId() %>">
                        <button type="submit" class="btn delete-button btn-sm" onclick="return confirm('Are you sure you want to delete this teacher?')">Delete</button>
                    </form>
                    <!-- Profile Button -->
                    <form action="view-teacher-profile" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="<%= teacher.getId() %>">
                        <button type="submit" class="btn btn-primary btn-sm">Profile</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="8" class="no-data">No teacher data found.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
