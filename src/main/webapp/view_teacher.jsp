<%@ page import="com.example.main.web_java.Teacher" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        .no-data {
            text-align: center;
            font-size: 1.2rem;
            color: #888;
        }
        .action-button {
            padding: 5px 15px;
            font-size: 0.9rem;
            border-radius: 5px;
            border: none;
            transition: background-color 0.3s;
        }
        .action-button:hover {
            opacity: 0.8;
        }
        .btn-warning {
            background-color: #ffc107;
            color: #333;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
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
                <td>
                    <div class="d-flex justify-content-start">
                        <!-- Edit Button (Yellow) -->
                        <form action="edit-teacher" method="get" class="me-2">
                            <input type="hidden" name="id" value="<%= teacher.getId() %>">
                            <button type="submit" class="btn btn-warning text-dark action-button">Edit</button>
                        </form>

                        <!-- Delete Button (Red) -->
                        <form action="delete-teacher" method="post" onsubmit="return confirm('Are you sure you want to delete this teacher?')" class="me-2">
                            <input type="hidden" name="id" value="<%= teacher.getId() %>">
                            <button type="submit" class="btn btn-danger action-button">Delete</button>
                        </form>

                        <!-- Profile Button (Blue) -->
                        <form action="view-teacher-profile" method="get">
                            <input type="hidden" name="id" value="<%= teacher.getId() %>">
                            <button type="submit" class="btn btn-primary action-button">Profile</button>
                        </form>
                    </div>
                </td>

            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6" class="no-data">No teacher data found.</td>
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
