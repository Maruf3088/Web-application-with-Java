<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Student | Student Management System</title>
  <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

  <style>
    :root {
      --primary-bg: #f9f9f9;
      --primary-text: #333333;
      --secondary-text: #666666;
      --card-bg: #ffffff;
      --button-bg: #007bff;
      --button-hover-bg: #0056b3;
      --footer-bg: #f1f1f1;
      --footer-text: #333333;
    }

    body {
      background-color: var(--primary-bg);
      color: var(--primary-text);
      font-family: 'Poppins', sans-serif;
      line-height: 1.6;
    }

    a {
      color: var(--button-bg);
      transition: color 0.3s ease;
    }

    a:hover {
      color: var(--button-hover-bg);
    }

    .container {
      background-color: var(--card-bg);
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .container:hover {
      transform: translateY(-5px);
    }

    .header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 30px;
    }

    .header-left {
      flex: 1;
      padding-right: 20px;
    }

    .header-right {
      flex: 1;
    }

    .header h1 {
      font-size: 2.5rem;
      font-weight: 700;
      color: var(--primary-text);
      margin-bottom: 10px;
    }

    .header p {
      color: var(--secondary-text);
      font-size: 1.2rem;
    }

    .header img {
      max-width: 100%;
      border-radius: 15px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .header img:hover {
      transform: scale(1.05);
    }

    .form-control {
      background-color: var(--card-bg);
      border-color: #ccc;
      border-radius: 10px;
      padding: 12px;
      font-size: 16px;
      transition: all 0.3s ease;
    }

    .form-control:focus {
      border-color: var(--button-bg);
      box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
    }

    .btn-primary {
      background-color: var(--button-bg);
      border: none;
      border-radius: 30px;
      padding: 12px 24px;
      font-size: 16px;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .btn-primary:hover {
      background-color: var(--button-hover-bg);
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3);
    }

    footer {
      background-color: var(--footer-bg);
      color: var(--footer-text);
      padding: 20px;
      text-align: center;
      margin-top: 40px;
      border-radius: 15px;
      box-shadow: 0 -5px 15px rgba(0, 0, 0, 0.1);
    }

    footer a {
      color: var(--footer-text);
      text-decoration: none;
      font-weight: bold;
      transition: color 0.3s ease;
    }

    footer a:hover {
      color: var(--button-bg);
    }
  </style>
</head>
<body>
<div class="container"><%@ include file="/WEB-INF/includes/navbar.jsp" %></div>
<!-- Header Section -->
<div class="header container mt-4">
  <div class="header-left">
    <h1>Student Management System</h1>
    <p>Add New Students to the System Effortlessly</p>
  </div>
  <div class="header-right">
    <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Student Image" class="img-fluid rounded">
  </div>
</div>

<!-- Add Student Form -->
<div class="container mt-5 p-4 rounded shadow">
  <form action="submit-form" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
    <div class="row">
      <!-- Left Column -->
      <div class="col-md-6 col-12">
        <div class="form-group mb-3">
          <label for="studentId">Student ID <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="studentId" name="studentId" placeholder="Enter student ID" required>
          <div class="invalid-feedback">Please enter the student ID.</div>
        </div>
        <div class="form-group mb-3">
          <label for="name">Full Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="name" name="name" placeholder="Enter student's full name" required>
          <div class="invalid-feedback">Please enter the student's name.</div>
        </div>
        <div class="form-group mb-3">
          <label for="fatherName">Father's Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="fatherName" name="fatherName" placeholder="Enter father's name" required>
          <div class="invalid-feedback">Please enter the father's name.</div>
        </div>
        <div class="form-group mb-3">
          <label for="motherName">Mother's Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="motherName" name="motherName" placeholder="Enter mother's name" required>
          <div class="invalid-feedback">Please enter the mother's name.</div>
        </div>
      </div>
      <!-- Right Column -->
      <div class="col-md-6 col-12">
        <div class="form-group mb-3">
          <label for="address">Address <span class="text-danger">*</span></label>
          <textarea class="form-control" id="address" name="address" rows="1" placeholder="Enter address" required></textarea>
          <div class="invalid-feedback">Please enter the address.</div>
        </div>
        <div class="form-group mb-3">
          <label for="department">Department Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="department" name="department" placeholder="Enter department name" required>
          <div class="invalid-feedback">Please enter the department name.</div>
        </div>
        <div class="form-group mb-3">
          <label for="section">Section Name <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="section" name="section" placeholder="Enter section name" required>
          <div class="invalid-feedback">Please enter the section name.</div>
        </div>
        <div class="form-group mb-3">
          <label for="semester">Semester <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="semester" name="semester" placeholder="Enter semester" required>
          <div class="invalid-feedback">Please enter the semester.</div>
        </div>
      </div>
    </div>
    <div class="text-center mt-4">
      <button type="submit" class="btn btn-primary">Add Student</button>
    </div>
  </form>
</div>

<!-- Footer Section -->
<footer class="container">
  <p>© 2025 Student Management System. All rights reserved.</p>
  <p>
    Developed by <a href="https://github.com/yourusername" target="_blank">Maruf Islam</a>
  </p>
</footer>

<script>
  // JavaScript form validation
  document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form.needs-validation");

    form.addEventListener("submit", function (event) {
      // Reset validation state
      const inputs = form.querySelectorAll(".form-control");
      inputs.forEach(input => input.classList.remove("is-invalid"));

      // Check validity
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();

        // Find first invalid input and focus it
        const firstInvalidInput = form.querySelector(":invalid");
        if (firstInvalidInput) {
          firstInvalidInput.classList.add("is-invalid");
          firstInvalidInput.focus();
          firstInvalidInput.scrollIntoView({ behavior: "smooth", block: "center" });
        }
      }

      form.classList.add("was-validated");
    });
  });
</script>

<!-- Bootstrap JS -->
<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>
