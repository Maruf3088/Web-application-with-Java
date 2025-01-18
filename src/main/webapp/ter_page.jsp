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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f5f7fa;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #334e68;
            text-align: center;
            font-size: 30px;
            margin-bottom: 10px;
            font-weight: 600;
        }

        h3 {
            color: #7b8794;
            text-align: center;
            font-size: 20px;
            margin-bottom: 30px;
            font-weight: 500;
        }

        .teacher-list-table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .teacher-list-table thead {
            background-color: #007bff;
        }

        .teacher-list-table th {
            color: #fff;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            padding: 15px;
            font-size: 14px;
        }

        .teacher-list-table tbody tr {
            background-color: #fff;
            border-bottom: 1px solid #f0f4f8;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .teacher-list-table tbody tr:hover {
            background-color: #f7fbff;
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .teacher-list-table td {
            padding: 15px;
            font-size: 16px;
            color: #4a4a4a;
        }

        .teacher-list-table tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .teacher-button {
            padding: 8px 16px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 20px;
            font-size: 14px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .teacher-button:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(40, 167, 69, 0.4);
        }

        .no-teachers-message {
            text-align: center;
            color: #dc3545;
            font-size: 16px;
            font-weight: 500;
        }

        .search-box {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
        }

        .search-box input {
            width: 100%;
            max-width: 500px;
            padding: 12px 20px;
            border: 1px solid #ced4da;
            border-radius: 25px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .search-box input:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            border-color: #007bff;
        }

        @media screen and (max-width: 768px) {
            .teacher-list-table {
                font-size: 14px;
            }

            .teacher-list-table th, .teacher-list-table td {
                padding: 10px;
            }

            .search-box input {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div>
        <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    </div>

    <h2 class="mt-4"><strong>Submit Your TER</strong></h2>
    <h3><strong>Click on a teacher's name below to proceed:</strong></h3>

    <div class="search-box">
        <input type="text" id="searchInput" class="form-control" placeholder="Search for teachers or courses...">
    </div>

    <table class="teacher-list-table">
        <thead>
        <tr>
            <th>Course Name</th>
            <th>Teacher Name</th>
        </tr>
        </thead>
        <tbody>
        <%-- Check if the list of teachers is not empty --%>
        <%
            List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers");
            if (teachers != null && !teachers.isEmpty()) {
                for (Teacher teacher : teachers) {
        %>
        <tr>
            <td><%= teacher.getCourse() %></td>
            <td>
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

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('searchInput');
        const tableRows = document.querySelectorAll('.teacher-list-table tbody tr');

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
