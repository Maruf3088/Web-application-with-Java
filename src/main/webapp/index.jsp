<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Student | Student Management System</title>
  <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .container {
      width: 90%;
      max-width: 1200px;
      background-color: #fff;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body class="bg-opacity-10 bg-light">

<div class="container mt-5 p-4 bg-white border rounded shadow">
  <%@ include file="/WEB-INF/includes/navbar.jsp" %>

  <!-- Header Section -->
  <div class="text-center mt-3 mb-4">
    <h1 class="h2 fw-bold">Student Management System </h1>
    <h1 class="h4 fw-bold">Add New Student</h1>
    <p class="text-muted">Fill in the student's information below to add them to the system.</p>
  </div>

  <!-- Add Student Form -->
  <form action="submit-form" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
    <div class="row">
      <!-- Left Column -->
      <div class="col-md-6">
        <!-- Student ID -->
        <div class="form-group mb-3">
          <label for="studentId" class="form-label">Student ID <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="studentId" name="studentId" placeholder="Enter student ID" required>
          <div class="invalid-feedback">Please enter the student ID.</div>
        </div>

        <!-- Student Name -->
        <div class="form-group mb-3">
          <label for="name" class="form-label">Full Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="name" name="name" placeholder="Enter student's full name" required>
          <div class="invalid-feedback">Please enter the student's name.</div>
        </div>
      </div>

      <!-- Right Column -->
      <div class="col-md-6">
        <!-- Department -->
        <div class="form-group mb-3">
          <label for="department" class="form-label">Department Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="department" name="department" placeholder="Enter department name" required>
          <div class="invalid-feedback">Please enter the department name.</div>
        </div>

        <!-- Section -->
        <div class="form-group mb-3">
          <label for="section" class="form-label">Section Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="section" name="section" placeholder="Enter section name" required>
          <div class="invalid-feedback">Please enter the section name.</div>
        </div>
      </div>
    </div>

    <!-- Submit Button -->
    <div class="text-center mt-4">
      <button type="submit" class="btn btn-primary px-5">Add Student</button>
    </div>
  </form>
</div>

<!-- Bootstrap JS -->
<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
<script>
  // Bootstrap form validation
  (function () {
    'use strict';
    var forms = document.querySelectorAll('.needs-validation');
    Array.prototype.slice.call(forms).forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  })();
</script>
</body>
</html>
