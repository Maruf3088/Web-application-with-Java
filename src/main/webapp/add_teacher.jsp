<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Teacher | Teacher Management System</title>
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
    <h1 class="h2 pt-4">Teacher Management System</h1>
    <h4 class="fw-bold">Add New Teacher</h4>
    <p class="text-muted">Please fill in the teacher's information to add them to the system.</p>
  </div>

  <!-- Add Teacher Form -->
  <form action="submit-teacher-form" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
    <div class="row">
      <!-- Left Column -->
      <div class="col-md-6">
        <!-- Name -->
        <div class="form-group mb-3">
          <label for="name">Full Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="name" name="name" placeholder="Enter teacher's full name" required>
          <div class="invalid-feedback">Please enter the teacher's name.</div>
        </div>

        <!-- Department -->
        <div class="form-group mb-3">
          <label for="department">Department <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="department" name="department" placeholder="Enter department name" required>
          <div class="invalid-feedback">Please enter the department.</div>
        </div>

        <!-- Phone Number -->
        <div class="form-group mb-3">
          <label for="phone">Phone Number <span class="text-danger">*</span></label>
          <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter phone number" required>
          <div class="invalid-feedback">Please enter the phone number.</div>
        </div>

      </div>

      <!-- Right Column -->
      <div class="col-md-6">
        <!-- Email -->
        <div class="form-group mb-3">
          <label for="email">Email <span class="text-danger">*</span></label>
          <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" required>
          <div class="invalid-feedback">Please enter a valid email address.</div>
        </div>

        <!-- Course -->
        <div class="form-group mb-3">
          <label for="course">Course <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="course" name="course" placeholder="Enter course name" required>
          <div class="invalid-feedback">Please enter the course name.</div>
        </div>

        <!-- Gender -->
        <div class="form-group mb-3">
          <label for="gender">Gender <span class="text-danger">*</span></label>
          <select class="form-control" id="gender" name="gender" required>
            <option value="" disabled selected>Select gender</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
          </select>
          <div class="invalid-feedback">Please select the gender.</div>
        </div>

      </div>

    </div>

    <!-- Submit Button -->
    <div class="text-center mt-4">
      <button type="submit" class="btn btn-primary">Add Teacher</button>
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
