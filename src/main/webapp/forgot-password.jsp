<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP - Forgot Password</title>
    <!-- Link to local Bootstrap CSS -->
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <%@ include file="/WEB-INF/includes/navbar.jsp" %>

    <h1 class="mt-4 mb-4">Forgot Password</h1>

    <!-- Forgot Password Form Start -->
    <form action="<%= request.getContextPath() %>/ForgotPasswordServlet" method="post">
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your registered email" required>
        </div>

        <button type="submit" class="btn btn-primary">Send Reset Link</button>
    </form>
    <!-- Forgot Password Form End -->

</div>

<!-- Link to local Bootstrap JS and dependencies -->
<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>
