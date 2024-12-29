<%@ page import="java.util.List" %>
<%@ page import="com.example.main.web_java.Ter" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Information</title>
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
        .table th, .table td {
            text-align: center;
        }
        .table th {
            background-color: #f8f9fa;
            color: #495057;
            font-weight: bold;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }
        .delete-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 6px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .delete-btn:hover {
            background-color: #c0392b;
        }
        .table-container {
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            background-color: white;
        }
        .page-header {
            margin-bottom: 30px;
        }
    </style>
</head>
<body class="bg-light">

<div class="container my-4">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>

    <div class="table-container">
        <h1 class="text-center page-header ">Teacher Information</h1>

        <!-- Table to display teacher data -->
        <table class="table table-bordered table-striped table-hover">
            <thead>
            <tr>
                <th scope="col">Teacher Name</th>
                <th scope="col">Course</th>
                <th scope="col">Score</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <%-- Loop through the list of teachers --%>
            <%
                List<Ter> teacherList = (List<Ter>) request.getAttribute("teachers");
                for (Ter teacher : teacherList) {
            %>
            <tr>
                <td><%= teacher.getTeacherName() %></td>
                <td><%= teacher.getCourse() %></td>
                <td><%= teacher.getScore() %></td>
                <td>
                    <!-- Delete button that links to delete servlet with teacher id -->
                    <form action="<%= request.getContextPath() %>/delete-ter" method="post" onsubmit="return confirm('Are you sure you want to delete this TER?');">
                        <input type="hidden" name="id" value="<%= teacher.getId() %>"> <!-- Assuming the Ter class has an 'id' property -->
                        <button type="submit" class="delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
