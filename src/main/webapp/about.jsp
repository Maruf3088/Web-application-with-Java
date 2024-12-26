<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Page</title>
    <!-- Link to local Bootstrap CSS -->
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>
    <h1 class="my-4">About Page</h1>
    <p>This is a simple JSP application demonstrating navigation between pages using Bootstrap and JSP.</p>

    <!-- Link to navigate back to index.jsp -->
    <p class="mt-4"><a href="index.jsp" class="btn btn-secondary">Back to Home</a></p>
</div>

<!-- Link to local Bootstrap JS and dependencies -->
<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>
