<%@ page import="com.example.main.web_java.Result" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Results</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;

            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            margin-top: 50px;
            min-height: 90vh;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-top: 0;
            font-size: 28px;
            color: #333;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: 500;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-data {
            text-align: center;
            color: #ff0000;
            font-size: 18px;
        }

        .form-container {
            margin: 20px 0;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        button {
            border: none;
            background-color: #dc3545;
            color: white;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<div class="container">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <h2>Student Results</h2>

    <%
        List<Result> results = (List<Result>) request.getAttribute("results");

        if (results != null && !results.isEmpty()) {
    %>
    <table>
        <thead>
        <tr>
            <th>SL.</th>
            <th>Student ID</th>
            <th>Name</th>
            <th>CGPA</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Result result : results) { %>
        <tr>
            <td><%= result.getId() %></td>
            <td><%= result.getStudentId() %></td>
            <td><%= result.getStudentName() %></td>
            <td><%= result.getCgpa() %></td>
            <td>
                <!-- Delete Button -->
                <form action="<%= request.getContextPath() %>/delete-result" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="<%= result.getId() %>">
                    <button type="submit" onclick="return confirm('Are you sure you want to delete this result?')">Delete</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <%
    } else {
    %>
    <p class="no-data">No results available at the moment.</p>
    <%
        }
    %>
</div>
</body>
</html>
