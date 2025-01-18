<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Teacher | Teacher Management System</title>
  <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-color: #4a90e2;
      --secondary-color: #50c878;
      --background-color: #f0f4f8;
      --text-color: #333;
      --card-bg: #ffffff;
      --input-bg: #f9f9f9;
      --input-border: #e0e0e0;
      --input-focus: #4a90e2;
    }

    body {
      background-color: var(--background-color);
      font-family: 'Nunito', sans-serif;
      color: var(--text-color);
    }

    .container {
      max-width: 1200px;
      background-color: var(--card-bg);
      border-radius: 20px;
      padding: 40px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .container:hover {
      transform: translateY(-5px);
    }

    .header {
      text-align: center;
      margin-bottom: 40px;
      animation: fadeInDown 1s ease;
    }

    .header h1 {
      color: var(--primary-color);
      font-weight: 700;
      font-size: 2.5rem;
      margin-bottom: 10px;
    }

    .header p {
      color: #777;
      font-size: 1.1rem;
    }

    .form-group label {
      font-weight: 600;
      color: var(--text-color);
      margin-bottom: 8px;
    }

    .form-control {
      background-color: var(--input-bg);
      border: 2px solid var(--input-border);
      border-radius: 10px;
      padding: 12px;
      font-size: 16px;
      transition: all 0.3s ease;
    }

    .form-control:focus {
      border-color: var(--input-focus);
      box-shadow: 0 0 0 0.2rem rgba(74, 144, 226, 0.25);
    }

    .btn-primary {
      background-color: var(--primary-color);
      border: none;
      border-radius: 10px;
      padding: 12px 24px;
      font-size: 18px;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .btn-primary:hover {
      background-color: #3a7bc8;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .invalid-feedback {
      font-size: 14px;
      color: #ff6b6b;
      margin-top: 5px;
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
        padding: 30px;
      }
    }
  </style>
</head>
<body>

<div class="container ">
  <%@ include file="/WEB-INF/includes/navbar.jsp" %>

  <div class="header mt-4">
    <h1>Teacher Management System</h1>
    <p>Add a New Teacher to the System</p>
  </div>

  <form action="submit-teacher-form" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
    <div class="row">
      <div class="col-md-6">
        <div class="form-group mb-3">
          <label for="name">Full Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="name" name="name" placeholder="Enter teacher's full name" required>
          <div class="invalid-feedback">Please enter the teacher's name.</div>
        </div>

        <div class="form-group mb-3">
          <label for="department">Department <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="department" name="department" placeholder="Enter department name" required>
          <div class="invalid-feedback">Please enter the department.</div>
        </div>

        <div class="form-group mb-3">
          <label for="phone">Phone Number <span class="text-danger">*</span></label>
          <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter phone number" required>
          <div class="invalid-feedback">Please enter a valid phone number.</div>
        </div>
      </div>

      <div class="col-md-6">
        <div class="form-group mb-3">
          <label for="email">Email <span class="text-danger">*</span></label>
          <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" required>
          <div class="invalid-feedback">Please enter a valid email address.</div>
        </div>

        <div class="form-group mb-3">
          <label for="course">Course <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="course" name="course" placeholder="Enter course name" required>
          <div class="invalid-feedback">Please enter the course name.</div>
        </div>

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

    <div class="text-center mt-4">
      <button type="submit" class="btn btn-primary">Add Teacher</button>
    </div>
  </form>
</div>

<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
<script>
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
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const formElements = document.querySelectorAll('.form-group');
    formElements.forEach((element, index) => {
      element.style.animation = `fadeInUp 0.5s ease forwards ${index * 0.1}s`;
    });
  });
</script>

</body>
</html>

