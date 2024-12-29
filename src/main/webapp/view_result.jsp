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
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            width: 90%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar {
            margin-bottom: 20px;
        }

        h2 {
            text-align: center;
            font-size: 28px;
            color: #333;
            margin-top: 30px;
        }

        h3 {
            text-align: center;
            font-size: 20px;
            color: #555;
        }

        .search-box {
            margin: 20px 0;
            text-align: center;
        }

        .search-box input[type="text"] {
            padding: 12px;
            font-size: 16px;
            width: 60%;
            max-width: 400px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-right: 10px;
            transition: border-color 0.3s ease;
        }

        .search-box input[type="text"]:focus {
            border-color: #007bff;
        }

        .search-box button {
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .search-box button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
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
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-data {
            text-align: center;
            color: #ff0000;
            font-size: 18px;
            margin-top: 20px;
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
        .sort-button-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
        }

        .sort-button-container button {
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .sort-button-container button:hover {
            background-color: #0056b3;
        }
        /* Add styles to align and space out buttons */
        .action-buttons {
            display: flex;
            gap: 10px; /* Space between buttons */
            justify-content: center; /* Center buttons */
            align-items: center;
        }

        .action-buttons button {
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .delete-button {
            background-color: #dc3545;
            color: white;
        }

        .delete-button:hover {
            background-color: #c82333;
        }

        .marksheet-button {
            background-color: #007bff;
            color: white;
        }

        .marksheet-button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>

<div class="container">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>

    <div class="search-box">
        <h2>Student Results</h2>
        <h3>Search and view the results of students</h3>

        <form action="search-Result" method="post">
            <input type="text" id="studentId" name="studentId" placeholder="Enter Student ID" required>
            <button type="submit">Search</button>
        </form>

        <!-- Sort Button -->
        <div class="sort-button-container">
            <button id="sortButton" onclick="sortResults()">Sort by CGPA (Decreasing)</button>
        </div>
    </div>
    <%
        List<Result> results = (List<Result>) request.getAttribute("results");

        if (results != null && !results.isEmpty()) {
    %>

    <table id="resultsTable">
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
                <div class="action-buttons">
                    <!-- Delete Button -->
                    <form action="<%= request.getContextPath() %>/delete-result" method="POST" style="display:inline;">
                        <input type="hidden" name="id" value="<%= result.getId() %>">
                        <button type="submit" class="delete-button" onclick="return confirm('Are you sure you want to delete this result?')">Delete</button>
                    </form>

                    <!-- Marksheet Button -->
                    <form action="search-Result" method="post">
                        <input type="hidden" name="studentId" value="<%= result.getStudentId() %>">
                        <button type="submit" class="marksheet-button">Marksheet</button>
                    </form>
                </div>
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

<script>
    function sortResults() {
        const table = document.getElementById("resultsTable");
        const rows = Array.from(table.rows).slice(1); // Get all table rows except the header row
        const sortedRows = rows.sort((rowA, rowB) => {
            const cgpaA = parseFloat(rowA.cells[3].textContent);
            const cgpaB = parseFloat(rowB.cells[3].textContent);
            return cgpaB - cgpaA; // Sort in descending order
        });

        // Append sorted rows back to the table
        sortedRows.forEach(row => table.appendChild(row));
    }
</script>

</body>
</html>
