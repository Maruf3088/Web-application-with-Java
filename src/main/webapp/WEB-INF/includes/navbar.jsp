<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
  .navbar-custom {
    background: linear-gradient(135deg, #00c6ff, #0072ff);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }

  .navbar-brand {
    font-family: 'Poppins', sans-serif;
    font-size: 1.5rem;
    color: #fff !important;
  }

  .nav-link {
    color: #f8f9fa !important;
    transition: color 0.3s ease;
  }

  .nav-link:hover {
    color: #ffdd59 !important;
    text-decoration: underline;
  }

  .navbar-toggler {
    border: 2px solid #fff;
  }

  .navbar-toggler-icon {
    background-image: url('data:image/svg+xml;charset=utf8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' viewBox=\'0 0 30 30\' fill=\'%23ffffff\'%3E%3Cpath stroke=\'rgba%280, 0, 0, 0.5%29\' stroke-width=\'2\' d=\'M4 7h22M4 15h22M4 23h22\'/%3E%3C/svg%3E');
  }
</style>

<nav class="navbar navbar-expand-lg navbar-custom">
  <div class="container-fluid ">
    <a class="navbar-brand fw-bold" href="<%= request.getContextPath() %>/index.jsp">Maruf Creations</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/about.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/view-contact">All Students</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/view-result">Result</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/add_teacher.jsp">Add Teacher</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/view-teacher">All Teacher</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/ter-page">TER</a>
        </li>
          <li class="nav-item">
              <a class="nav-link" href="<%= request.getContextPath() %>/view-ter">TER Result</a>
          </li>

        <%-- Check if the user is logged in --%>
        <%
          String username = (String) session.getAttribute("username");
          if (username == null) {
        %>
        <%-- Show Login and Sign Up buttons if the user is not logged in --%>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/signup.jsp">Sign Up</a>
        </li>
        <%
        } else {
        %>
        <%-- Show Sign Out button if the user is logged in --%>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/logout.jsp">Sign Out</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/my-account">Admin</a>
        </li>
        <%
          }
        %>
      </ul>
    </div>
  </div>
</nav>
