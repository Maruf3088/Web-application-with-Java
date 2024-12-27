<jsp:useBean id="result" scope="request" type="com.example.main.web_java.Result"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Result</title>
  <!-- Bootstrap CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Arial', sans-serif;
    }
    h1 {
      color: #343a40;
      margin-bottom: 30px;
    }
    .table-container {
      margin-top: 50px;
      background-color: #ffffff;
      border-radius: 15px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 30px;
    }
    /* Student Info Table */
    .student-info-table th, .student-info-table td {
      padding: 12px;
      text-align: left;
      font-size: 1rem;
      border: 2px solid #dee2e6;
    }
    .student-info-table th {
      background-color: #007bff;
      color: white;
    }
    .student-info-table td {
      color: #495057;
    }

    /* Course Results Table */
    .course-table th, .course-table td {
      padding: 15px;
      text-align: center;
      font-size: 1.1rem;
      border: 2px solid #dee2e6;
    }
    .course-table th {
      background-color: #28a745;
      color: white;
    }
    .course-table td {
      color: #495057;
    }
    .course-table td.course-name {
      font-weight: bold;
      color: #007bff;
    }
    .course-table td.grade {
      color: green;
      font-weight: bold;
    }
    .course-table-striped tbody tr:nth-of-type(odd) {
      background-color: #f2f2f2;
    }
    .course-name td{
      color: #007bff;
    }
    .total-row {
      background-color: #e9ecef;
      font-weight: bold;
      font-size: 1.2rem;
    }
    .result-header {
      text-align: center;
      font-size: 1.5rem;
      color: #007bff;
      margin-bottom: 30px;
    }
    /* CGPA Comment Section */
    .cgpa-table {
      margin-top: 30px;
      background-color: #ffffff;
      border-radius: 15px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 30px;
    }
    .cgpa-comment {
      font-size: 1.2rem;
      color: #007bff;
    }
  </style>
</head>
<body>

<div class="container table-container">
  <%@ include file="/WEB-INF/includes/navbar.jsp" %>
  <h1 class="text-center fw-bold pt-4">Marksheet</h1>

  <!-- Student Info Table -->
  <table class="table student-info-table">
    <tr>
      <th>Student ID</th>
      <td class="fw-bold">${result.studentId}</td>
      <th>Student Name</th>
      <td class="fw-bold">${result.studentName}</td>
    </tr>
  </table>

  <!-- Course Results Table -->
  <table class="table course-table course-table-striped">
    <thead>
    <tr>
      <th>Course</th>
      <th>Course Name</th>
      <th>Grade</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td class="course-name">CHEM2301</td>
      <td>Chemistry</td>
      <td class="grade">${result.CHEM2301Grade}</td>
    </tr>
    <tr>
      <td class="course-name">CSE2321</td>
      <td>Data Structure</td>
      <td class="grade">${result.CSE2321Grade}</td>
    </tr>
    <tr>
      <td class="course-name">CSE2322</td>
      <td>Data Structure Lab</td>

      <td class="grade">${result.CSE2322Grade}</td>
    </tr>
    <tr>
      <td class="course-name">CSE2323</td>
      <td>Digital Logic Design</td>

      <td class="grade">${result.CSE2323Grade}</td>
    </tr>
    <tr>
      <td class="course-name">CSE2324</td>
      <td>Digital Logic Design Lab</td>

      <td class="grade">${result.CSE2324Grade}</td>
    </tr>
    <tr>
      <td class="course-name">CSE2340</td>
      <td>Software Development 1</td>

      <td class="grade">${result.CSE2340Grade}</td>
    </tr>
    <tr>
      <td class="course-name">MATH2307</td>
      <td>Mathematics-III</td>

      <td class="grade">${result.MATH2307Grade}</td>
    </tr>
    <tr>
      <td class="course-name">STAT2311</td>
      <td>Statistics</td>

      <td class="grade">${result.STAT2311Grade}</td>
    </tr>
    <tr>
      <td class="course-name">URED2302</td>
      <td>Principle of Quran and Hadith</td>

      <td class="grade">${result.URED2302Grade}</td>
    </tr>
    <tr class="total-row">
      <td class="course-name">CGPA</td>
      <td></td>
      <td>${result.cgpa}</td>
    </tr>
    </tbody>
  </table>

  <!-- CGPA Comment Section -->
  <div class="container table-container">
    <h4 class="text-center">CGPA Evaluation</h4>
    <table class="table table-bordered">
      <thead>
      <tr>
        <th class="text-center">Your CGPA</th>
        <th class="text-center"><strong>${result.cgpa}</strong></th>

      </tr>
      </thead>
      <tbody>
      <tr>
        <th class="text-center">Evaluation</th>
        <th class="text-center">
          <%
            double cgpa = Double.parseDouble(String.valueOf(result.cgpa));
            String comment = "";
            if (cgpa >= 3.75) {
              comment = "Excellent";
            } else if (cgpa >= 3.5) {
              comment = "Good";
            } else if (cgpa >= 2.5) {
              comment = "Average";
            } else {
              comment = "Bad";
            }
          %>
          <strong><%= comment %></strong>
        </th>
      </tr>
      </tbody>
    </table>
  </div>

  <!-- Print Button -->
  <div class="text-center mt-4">
    <button class="btn btn-primary" onclick="window.print();">Print Marksheet</button>
  </div>
</div>

<!-- Bootstrap JS and Dependencies (Popper and Bootstrap Bundle) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
