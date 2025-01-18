<%@ page import="com.example.main.web_java.Teacher" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Data</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
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
            background-color: var(--background-color);
            font-family: 'Roboto', sans-serif;
            color: var(--text-color);
            transition: all 0.3s ease;
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
            margin-bottom: 30px;
            animation: fadeInDown 1s ease;
        }

        .header h2 {
            color: var(--primary-color);
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 10px;
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
            padding: 15px;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: var(--background-color);
        }

        .table-hover tbody tr:hover {
            background-color: var(--hover-color);
            transition: background-color 0.3s ease;
        }

        .btn {
            border: none;
            border-radius: 25px;
            padding: 8px 15px;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 2px;
        }

        .btn-warning {
            background-color: #ffa500;
            color: white;
        }

        .btn-danger {
            background-color: #ff6b6b;
            color: white;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .table {
                font-size: 14px;
            }

            .btn {
                padding: 6px 12px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>

<div class="container ">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <div class="header mt-4">
        <h2>Teacher Data</h2>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead>
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
                    <div class="btn-group" role="group">
                        <form action="edit-teacher" method="get" class="me-2">
                            <input type="hidden" name="id" value="<%= teacher.getId() %>">
                            <button type="submit" class="btn btn-warning">Edit</button>
                        </form>
                        <form action="delete-teacher" method="post" class="me-2" onsubmit="return confirm('Are you sure you want to delete this teacher?')">
                            <input type="hidden" name="id" value="<%= teacher.getId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                        <form action="view-teacher-profile" method="get">
                            <input type="hidden" name="id" value="<%= teacher.getId() %>">
                            <button type="submit" class="btn btn-primary">Profile</button>
                        </form>
                    </div>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6" class="text-center">No teacher data found.</td>
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
        const tableRows = document.querySelectorAll('tbody tr');
        tableRows.forEach((row, index) => {
            row.style.animation = `fadeInUp 0.5s ease forwards ${index * 0.1}s`;
        });
    });
</script>
</body>
</html>

