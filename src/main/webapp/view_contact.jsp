<%@ page import="com.example.main.web_java.Contact" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Data</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #007bff;
            --secondary-color: #28a745;
            --background-color: #f4f6f9;
            --text-color: #333;
            --card-bg: #ffffff;
            --hover-color: #0056b3;
            --button-radius: 25px;
        }

        body {
            background-color: var(--background-color);
            color: var(--text-color);
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            background-color: var(--card-bg);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h2 {
            color: var(--primary-color);
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 15px;
        }

        .table {
            color: var(--text-color);
            border-radius: 10px;
            overflow: hidden;
        }

        .table th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            padding: 15px;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        .table-hover tbody tr:hover {
            background-color: var(--hover-color);
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn {
            border: none;
            border-radius: var(--button-radius);
            padding: 10px 20px;
            font-size: 14px;
            font-weight: 600;
            margin: 2px;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-warning {
            background-color: #ffa500;
            color: white;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-success {
            background-color: var(--secondary-color);
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .btn-group {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .btn-group form {
            display: inline-block;
        }

        .no-data {
            text-align: center;
            font-size: 1.2rem;
            padding: 20px;
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

            .header h2 {
                font-size: 2rem;
            }
        }

        .search-box {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
        }

        .search-box input {
            width: 900px;
            border-radius: var(--button-radius);
            border: 1px solid var(--primary-color);
            padding: 10px 15px;
            font-size: 14px;
        }

        .search-box input:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
        }
    </style>
</head>
<body>

<div class="container">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <div class="header mt-4">
        <h2>Student Data</h2>
    </div>

    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search by Student ID...">
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>SL.</th>
                <th>Student ID</th>
                <th>Name</th>
                <th>Section</th>
                <th>Department</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Contact> contacts = (List<Contact>) request.getAttribute("contacts");
                if (contacts != null && !contacts.isEmpty()) {
                    for (Contact contact : contacts) {
            %>
            <tr>
                <td><%=contact.getId()%></td>
                <td><%= contact.getStudentId() %></td>
                <td><%= contact.getName() %></td>
                <td><%= contact.getSection() %></td>
                <td><%= contact.getDepartment() %></td>
                <td>
                    <div class="btn-group" role="group">
                        <form action="edit-contact" method="get" class="me-2">
                            <input type="hidden" name="id" value="<%= contact.getId() %>">
                            <button type="submit" class="btn btn-warning">Edit</button>
                        </form>
                        <form action="delete-contact" method="post" class="me-2">
                            <input type="hidden" name="id" value="<%= contact.getId() %>">
                            <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this student?')">Delete</button>
                        </form>
                        <form action="add_result" method="post" class="me-2">
                            <input type="hidden" name="studentName" value="<%= contact.getName() %>">
                            <input type="hidden" name="studentId" value="<%= contact.getStudentId() %>">
                            <button type="submit" class="btn btn-success">Add Result</button>
                        </form>
                        <form action="view-profile" method="get">
                            <input type="hidden" name="id" value="<%= contact.getId() %>">
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
                <td colspan="6" class="no-data">No student data found.</td>
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
    document.addEventListener('DOMContentLoaded', function () {
        const searchInput = document.getElementById('searchInput');
        const tableRows = document.querySelectorAll('tbody tr');

        searchInput.addEventListener('input', function () {
            const searchTerm = this.value.toLowerCase();

            tableRows.forEach(row => {
                const studentId = row.children[1]?.textContent.toLowerCase();

                if (studentId.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    });
</script>

</body>
</html>
