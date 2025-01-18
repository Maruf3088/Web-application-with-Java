<%@ page import="com.example.main.web_java.Result" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Results</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        :root {
            --primary-color: #6a5acd;
            --secondary-color: #20b2aa;
            --background-color: #f0f8ff;
            --text-color: #333;
            --card-bg: #ffffff;
            --hover-color: #e6e6fa;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            background-color: var(--card-bg);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        .header {
            text-align: center;

        }

        .header h2 {
            color: var(--primary-color);
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        .search-box {
            margin-bottom: 30px;
        }

        .search-box input[type="text"] {
            border-radius: 25px 0 0 25px;
            border: 2px solid var(--primary-color);
            padding: 12px 20px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .search-box input[type="text"]:focus {
            box-shadow: 0 0 10px rgba(106, 90, 205, 0.3);
        }

        .search-box button {
            border-radius: 0 25px 25px 0;
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .search-box button:hover {
            background-color: #5a4caf;
            transform: translateY(-2px);
        }

        .table {
            background-color: var(--card-bg);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            padding: 20px;
            font-size: 16px;
            letter-spacing: 1px;
        }

        .table td {
            padding: 15px;
            vertical-align: middle;
            font-size: 15px;
            border-top: 1px solid #ddd;
        }

        .table-hover tbody tr:hover {
            background-color: var(--hover-color);
            transition: background-color 0.3s ease;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        .table-responsive {
            border-radius: 15px;
            overflow: hidden;
        }

        .btn-group .btn {
            font-size: 14px;
            padding: 8px 12px;
            border-radius: 20px;
            margin: 0 5px;
            transition: all 0.3s ease;
        }

        .btn-group .btn:hover {
            transform: translateY(-2px);
        }

        .btn-danger {
            background-color: #e74c3c;
            border: none;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .btn-primary:hover {
            background-color: #5a4caf;
        }

        @media (max-width: 768px) {
            .table th,
            .table td {
                font-size: 14px;
                padding: 12px;
            }

            .btn-group .btn {
                font-size: 12px;
                padding: 6px 10px;
            }
        }
    </style>
</head>
<body>
<div class="container ">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <div class="header mt-4">
        <h2>Student Results</h2>
    </div>
    <div class="search-box">
        <form action="search-Result" method="post" class="d-flex">
            <input type="text" id="studentId" name="studentId" placeholder="Enter Student ID" required class="form-control">
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>
    <%
        List<Result> results = (List<Result>) request.getAttribute("results");
        if (results != null && !results.isEmpty()) {
    %>
    <button id="sortButton" class="btn btn-secondary mt-3" onclick="sortResults()">
        <i class="fas fa-sort-amount-down"></i> Sort by CGPA (Decreasing)
    </button>

    <div class="table-responsive mt-4">
        <table id="resultsTable" class="table table-striped table-hover">
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
                    <div class="btn-group">
                        <form action="<%= request.getContextPath() %>/delete-result" method="POST" onsubmit="return confirm('Are you sure you want to delete this result?')">
                            <input type="hidden" name="id" value="<%= result.getId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                        <form action="search-Result" method="post">
                            <input type="hidden" name="studentId" value="<%= result.getStudentId() %>">
                            <button type="submit" class="btn btn-primary">Marksheet</button>
                        </form>
                    </div>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <%
    } else {
    %>
    <p class="text-center mt-4">No results available at the moment.</p>
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
        sortedRows.forEach(row => table.appendChild(row));
    }
</script>
<script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
