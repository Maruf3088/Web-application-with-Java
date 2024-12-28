<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Student | Student Management System</title>
  <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f7fc;
      font-family: 'Arial', sans-serif;
    }
    .container {
      width: 90%;
      max-width: 1200px;
      background-color: #fff;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .header {
      text-align: center;
      margin-bottom: 40px;
    }

    .header h1 {
      font-weight: 700;
      color: #333;
    }

    .header p {
      color: #555;
    }

    .form-group label {
      font-weight: 600;
      color: #333;
    }

    .form-control {
      border-radius: 8px;
      padding: 12px;
      font-size: 16px;
    }

    .form-control:focus {
      border-color: #007bff;
      box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
    }

    .btn-primary {
      background-color: #28a745;
      border: none;
      border-radius: 30px;
      padding: 12px 24px;
      font-size: 16px;
      font-weight: 600;
      transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
      background-color: #218838;
    }

    .btn-primary:focus {
      box-shadow: 0 0 10px rgba(0, 123, 255, 0.3);
    }

    .invalid-feedback {
      font-size: 14px;
    }

    .form-row {
      margin-bottom: 20px;
    }

    .row {
      display: flex;
      justify-content: space-between;
      gap: 20px;
    }

    .col-md-6 {
      flex: 1;
    }

    /* Media Queries for Mobile */
    @media (max-width: 768px) {
      .container {
        padding: 15px;
      }
      .row {
        flex-direction: column;
      }
      .col-md-6 {
        width: 100%;
      }
    }
  </style>
</head>
<body>

<div class="container mt-5 p-4 bg-white rounded shadow">
  <%@ include file="/WEB-INF/includes/navbar.jsp" %>

  <!-- Header Section -->
  <div class="header">
    <h1 class="h2 pt-4">Student Management System</h1>
    <h4 class="fw-bold">Add New Student</h4>
    <p class="text-muted">Please fill in the student's information to add them to the system.</p>
  </div>

  <!-- Add Student Form -->
  <form action="submit-form" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
    <div class="row">
      <!-- Left Column -->
      <div class="col-md-6">
        <!-- Student ID -->
        <div class="form-group mb-3">
          <label for="studentId">Student ID <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="studentId" name="studentId" placeholder="Enter student ID" required>
          <div class="invalid-feedback">Please enter the student ID.</div>
        </div>

        <!-- Full Name -->
        <div class="form-group mb-3">
          <label for="name">Full Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="name" name="name" placeholder="Enter student's full name" required>
          <div class="invalid-feedback">Please enter the student's name.</div>
        </div>

        <!-- Father's Name -->
        <div class="form-group mb-3">
          <label for="fatherName">Father's Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="fatherName" name="fatherName" placeholder="Enter father's name" required>
          <div class="invalid-feedback">Please enter the father's name.</div>
        </div>
        <!--Mother's Name -->
        <div class="form-group mb-3">
          <label for="motherName">Father's Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="motherName" name="motherName" placeholder="Enter mother's name" required>
          <div class="invalid-feedback">Please enter the mother's name.</div>
        </div>


      </div>

      <!-- Right Column -->
      <div class="col-md-6">
        <!-- Address -->
        <div class="form-group mb-3">
          <label for="address">Address <span class="text-danger">*</span></label>
          <textarea class="form-control" id="address" name="address"  rows="1" placeholder="Enter address" required></textarea>
          <div class="invalid-feedback">Please enter the address.</div>
        </div>
        <!-- Department -->
        <div class="form-group mb-3">
          <label for="department">Department Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="department" name="department" placeholder="Enter department name" required>
          <div class="invalid-feedback">Please enter the department name.</div>
        </div>

        <!-- Section -->
        <div class="form-group mb-3">
          <label for="section">Section Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="section" name="section" placeholder="Enter section name" required>
          <div class="invalid-feedback">Please enter the section name.</div>
        </div>

        <!-- Semester -->
        <div class="form-group mb-3">
          <label for="semester">Semester <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="semester" name="semester" placeholder="Enter semester" required>
          <div class="invalid-feedback">Please enter the semester.</div>
        </div>


    </div>

    <!-- Submit Button -->
    <div class="text-center mt-4">
      <button type="submit" class="btn btn-primary">Add Student</button>
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
