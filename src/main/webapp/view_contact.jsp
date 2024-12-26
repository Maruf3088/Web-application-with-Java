<%@ page import="com.example.main.web_java.Contact" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Data</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .button {
            padding: 5px 10px;
            margin: 5px;
            cursor: pointer;
        }
        .edit-button {
            background-color: #4CAF50;
            color: white;
        }
        .delete-button {
            background-color: #f44336;
            color: white;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .add-result-button {
            background-color: #2196F3;
            color: white;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <h2 class="text-center">Student Data</h2>
    <table class="table table-striped table-hover">
        <thead class="thead-light">
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
                <!-- Edit Button -->
                <form action="edit-contact" method="get" style="display:inline;">
                    <input type="hidden" name="id" value="<%= contact.getId() %>">
                    <button type="submit" class="btn btn-success btn-sm">Edit</button>
                </form>
                <!-- Delete Button -->
                <form action="delete-contact" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= contact.getId() %>">
                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this student?')">Delete</button>
                </form>
                <!-- Add Result Button -->
                <form action="add_result.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="studentId" value="<%= contact.getStudentId() %>">
                    <button type="submit" class="btn add-result-button btn-sm">Add Result</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="text-center">No student data found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
