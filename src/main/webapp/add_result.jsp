<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%
  // Define the list of courses with titles
  List<String[]> courses = Arrays.asList(
          new String[] {"CHEM2301", "Chemistry"},
          new String[] {"CSE2321", "Data Structure"},
          new String[] {"CSE2322", "Data Structure Lab"},
          new String[] {"CSE2323", "Digital Logic Design"},
          new String[] {"CSE2324", "Digital Logic Design Lab"},
          new String[] {"CSE2340", "Software Development 1"},
          new String[] {"MATH2307", "Mathematics-III"},
          new String[] {"STAT2311", "Statistics"},
          new String[] {"URED2302", "Principle of Quran and Hadith"}
  );
  request.setAttribute("courses", courses);

  // Get studentName and studentId from the request
  String studentName = (String) request.getAttribute("studentName");
  String studentId = (String) request.getAttribute("studentId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Student Result</title>
  <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f7fc;
      color: #333;
      font-family: 'Arial', sans-serif;
      padding-bottom: 50px;
    }
    .course-table th {
      background-color: #4a90e2;
      color: white;
      text-align: center;
      font-weight: bold;
    }
    .course-table tbody tr:nth-child(odd) {
      background-color: #e9f2ff;
    }
    .course-table tbody tr:nth-child(even) {
      background-color: #ffffff;
    }
    .course-table tbody tr:hover {
      background-color: #d0e6ff;
      transition: background-color 0.3s ease;
    }
    .course-table td, .course-table th {
      vertical-align: middle;
      padding: 15px;
    }
    .course-table input {
      width: 100px;
      text-align: center;
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 5px;
    }
    .result-container {
      margin-top: 20px;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .btn-custom {
      margin-top: 15px;
      padding: 10px 20px;
      font-weight: bold;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      transition: transform 0.2s;
    }
    .btn-custom:hover {
      transform: translateY(-3px);
    }
    .grade {
      font-weight: bold;
      color: #28a745;
    }
    .final-result {
      font-size: 1.2em;
      font-weight: bold;
      color: #333;
    }
    #total-grade {
      margin-top: 15px;
      font-weight: bold;
      font-size: 20px;
      color: #4a90e2;
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <%@ include file="/WEB-INF/includes/navbar.jsp" %>
  <h2 class="text-center text-primary fw-bold pt-4">Add Student Result</h2>

  <form action="submit-result" method="post">
    <div class="mb-3">
      <label for="studentName" class="form-label">Student Name</label>
      <input type="text" class="form-control" id="studentName" name="studentName"
             value="<%= studentName != null ? studentName : "" %>" required>
    </div>
    <div class="mb-3">
      <label for="studentId" class="form-label">Student ID</label>
      <input type="text" class="form-control" id="studentId" name="studentId"
             value="<%= studentId != null ? studentId : "" %>" required>
    </div>

    <table class="table table-bordered course-table">
      <thead>
      <tr>
        <th>Course Code</th>
        <th>Course Title</th>
        <th>Mid Result</th>
        <th>Final Result</th>
        <th>Attendance</th>
        <th>Assignment</th>
        <th>Grade</th>
      </tr>
      </thead>
      <tbody>
      <% for (String[] course : courses) { %>
      <tr>
        <td><%= course[0] %></td>
        <td><%= course[1] %></td>
        <td><input type="number" name="<%= course[0] %>Mid" class="form-control" required></td>
        <td><input type="number" name="<%= course[0] %>Final" class="form-control" required></td>
        <td><input type="number" name="<%= course[0] %>Attendance" class="form-control" required></td>
        <td><input type="number" name="<%= course[0] %>Assignment" class="form-control" required></td>
        <td><input type="text" name="<%= course[0] %>Grade" class="form-control grade" readonly></td>
      </tr>
      <% } %>
      </tbody>
    </table>

    <div class="result-container">
      <input type="text" id="total-grade" name="cgpa" class="form-control text-center" readonly placeholder="CGPA will appear here"><br>
    </div>

    <div class="d-flex justify-content-between">
      <button type="button" class="btn btn-primary btn-custom" id="calculateResultBtn">Calculate Grades</button>
      <button type="submit" class="btn btn-success btn-custom">Submit</button>
    </div>
  </form>
</div>

<script>
  // Existing JavaScript code remains unchanged
  document.getElementById('calculateResultBtn').addEventListener('click', function () {
    const rows = document.querySelectorAll('.course-table tbody tr');
    let totalGradePoints = 0;
    let totalCourses = rows.length;

    if (totalCourses === 0) {
      alert('No courses available to calculate CGPA.');
      return;
    }

    rows.forEach(row => {
      const mid = parseFloat(row.querySelector('[name$="Mid"]').value) || 0;
      const final = parseFloat(row.querySelector('[name$="Final"]').value) || 0;
      const attendance = parseFloat(row.querySelector('[name$="Attendance"]').value) || 0;
      const assignment = parseFloat(row.querySelector('[name$="Assignment"]').value) || 0;

      const totalMarks = mid + final + attendance + assignment;
      let gradePoint = 0;
      let gradeLetter = '';

      if (totalMarks >= 80) {
        gradePoint = 4.00;
        gradeLetter = 'A+';
      } else if (totalMarks >= 75) {
        gradePoint = 3.75;
        gradeLetter = 'A';
      } else if (totalMarks >= 70) {
        gradePoint = 3.50;
        gradeLetter = 'A-';
      } else if (totalMarks >= 65) {
        gradePoint = 3.25;
        gradeLetter = 'B+';
      } else if (totalMarks >= 60) {
        gradePoint = 3.00;
        gradeLetter = 'B';
      } else if (totalMarks >= 55) {
        gradePoint = 2.75;
        gradeLetter = 'B-';
      } else if (totalMarks >= 50) {
        gradePoint = 2.50;
        gradeLetter = 'C+';
      } else if (totalMarks >= 45) {
        gradePoint = 2.25;
        gradeLetter = 'C';
      } else if (totalMarks >= 40) {
        gradePoint = 2.00;
        gradeLetter = 'D';
      } else {
        gradePoint = 0.00;
        gradeLetter = 'F';
      }

      // Update the Grade column
      const gradeCell = row.querySelector('[name$="Grade"]');
      if (gradeCell) {
        gradeCell.value = gradeLetter;
      }

      totalGradePoints += gradePoint;
    });

    const cgpa = totalCourses > 0 ? (totalGradePoints / totalCourses).toFixed(2) : '0.00';
    const gradeElement = document.getElementById('total-grade');
    gradeElement.value = cgpa;  // Use 'value' instead of 'Value'
  });
</script>
</body>
</html>
