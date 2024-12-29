<%@ page import="com.example.main.web_java.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teachers and Courses</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #343a40;
            text-align: center;
            font-size: 36px;
            margin-bottom: 20px;
            font-weight: 700;
        }

        h3 {
            color: #6c757d;
            text-align: center;
            font-size: 22px;
            margin-bottom: 30px;
        }

        .teacher-button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
            transition: background-color 0.3s ease, transform 0.2s ease;
            display: inline-block;
        }

        .teacher-button:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        .teacher-list-table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
        }

        .teacher-list-table th, .teacher-list-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }

        .teacher-list-table th {
            background-color: #007bff;
            color: white;
            font-weight: 600;
        }

        .teacher-list-table tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .teacher-list-table tr:hover {
            background-color: #e9ecef;
        }

        .teacher-list-table td {
            vertical-align: middle;
        }

        .no-teachers-message {
            text-align: center;
            color: #dc3545;
            font-size: 18px;
        }
    </style>
</head>
<body>

<div class="container">
    <div>
        <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    </div>

    <h1>TER</h1>
    <h3>Click on a teacher's name to submit TER</h3>

    <table class="teacher-list-table">
        <thead>
        <tr>
            <th>Course Name</th>
            <th>Teacher Name</th>
        </tr>
        </thead>
        <tbody>
        <!-- Check if the list of teachers is not empty -->
        <%
            List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers");
            if (teachers != null && !teachers.isEmpty()) {
                for (Teacher teacher : teachers) {
        %>
        <tr>
            <td><%= teacher.getCourse() %></td>
            <td>
                <!-- Teacher name as a button, passing the course name as a parameter -->
                <form action="ter-submission" method="get">
                    <button type="submit" class="teacher-button" name="course" value="<%= teacher.getCourse() %>">
                        <%= teacher.getName() %>
                    </button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="2" class="no-teachers-message">No teachers found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
