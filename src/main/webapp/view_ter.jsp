<%@ page import="java.util.List" %>
<%@ page import="com.example.main.web_java.Ter" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Evaluation Results</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #ff5722;
            --background-color: #f9f9f9;
            --text-color: #444;
            --card-bg: #ffffff;
            --hover-color: #f1f1f1;
            --shadow: rgba(0, 0, 0, 0.1);
        }

        body {
            background-color: var(--background-color);
            font-family: 'Inter', sans-serif;
            color: var(--text-color);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0px auto;
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 15px var(--shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px var(--shadow);
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header h1 {
            font-weight: 700;
            color: var(--primary-color);
            font-size: 2.8rem;
            margin-bottom: 10px;
        }

        .search-box {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .search-box input {
            max-width: 500px;
            border: 2px solid var(--primary-color);
            background-color: white;
            border-radius: 50px;
            padding: 10px 20px;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }

        .search-box input:focus {
            border-color: var(--secondary-color);
            background-color: white;
        }

        .table {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 3px 10px var(--shadow);
        }

        .table thead th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            padding: 15px;
        }

        .table tbody tr {
            transition: background-color 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: var(--hover-color);
        }

        .table tbody tr:nth-child(odd) {
            background-color: #f7f7f7;
        }

        .table tbody td {
            padding: 12px 15px;
        }

        .delete-btn {
            background-color: var(--secondary-color);
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 25px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            background-color: #e64a19;
            box-shadow: 0 5px 15px rgba(255, 87, 34, 0.3);
            transform: translateY(-3px);
        }

        @media (max-width: 768px) {
            .header h1 {
                font-size: 2rem;
            }

            .search-box input {
                width: 100%;
                max-width: 100%;
            }

            .delete-btn {
                padding: 6px 12px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>

    <div class="header mt-4">
        <h1>Teacher Evaluation Results</h1>
    </div>

    <div class="search-box">
        <input type="text" id="searchInput" class="form-control" placeholder="Search for teachers or courses...">
    </div>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Teacher Name</th>
                <th>Course</th>
                <th>Score</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Ter> teacherList = (List<Ter>) request.getAttribute("teachers");
                for (Ter teacher : teacherList) {
            %>
            <tr>
                <td><%= teacher.getTeacherName() %></td>
                <td><%= teacher.getCourse() %></td>
                <td><%= teacher.getScore() %></td>
                <td>
                    <form action="<%= request.getContextPath() %>/delete-ter" method="post" onsubmit="return confirm('Are you sure you want to delete this evaluation?');">
                        <input type="hidden" name="id" value="<%= teacher.getId() %>">
                        <button type="submit" class="delete-btn">
                            <i class="fas fa-trash-alt"></i> Delete
                        </button>
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

<script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('searchInput');
        const tableRows = document.querySelectorAll('tbody tr');

        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            tableRows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchTerm) ? '' : 'none';
            });
        });
    });
</script>
</body>
</html>
