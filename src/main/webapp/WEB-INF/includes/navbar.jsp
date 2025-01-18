<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
  /* Custom Navbar Styling */
  .navbar-custom {
    background: linear-gradient(135deg, #6a11cb, #2575fc); /* Gradient background */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 1rem 2rem;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
  }

  .navbar-custom:hover {
    background: linear-gradient(135deg, #5b0db8, #2061e4); /* Darker on hover */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
  }

  .navbar-brand {
    font-family: 'Poppins', sans-serif;
    font-size: 1rem;
    font-weight: 700;
    color: #fff !important;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: color 0.3s ease;
  }

  .navbar-brand:hover {
    color: #ffdd59 !important; /* Highlight on hover */
  }

  .nav-link {
    color: #f8f9fa !important; /* Default link color */
    font-size: 1rem;
    font-weight: 500;
    transition: all 0.3s ease; /* Smooth color and underline effect */
    position: relative;
  }

  .nav-link:hover {
    color: #ffdd59 !important; /* Yellow color on hover */
    text-decoration: none;
  }

  .nav-link::after {
    content: '';
    position: absolute;
    width: 0%;
    height: 2px;
    background: #ffdd59; /* Underline color */
    left: 0;
    bottom: -5px;
    transition: width 0.3s ease;
  }

  .nav-link:hover::after {
    width: 100%;
  }

  .navbar-toggler {
    border: 2px solid #fff;
    padding: 5px;
    border-radius: 50px;
    transition: transform 0.3s ease, background-color 0.3s ease;
  }

  .navbar-toggler:hover {
    background-color: #ffdd59;
    transform: scale(1.1);
  }

  .navbar-toggler-icon {
    background-image: url('data:image/svg+xml;charset=utf8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' viewBox=\'0 0 30 30\' fill=\'%23ffffff\'%3E%3Cpath stroke=\'rgba%280, 0, 0, 0.5%29\' stroke-width=\'2\' d=\'M4 7h22M4 15h22M4 23h22\'/%3E%3C/svg%3E');
  }

  /* Navbar hover animation */
  .nav-item:hover {
    transform: translateY(-3px);
    transition: all 0.3s ease;
  }

  /* Smooth animations */
  @keyframes fadeIn {
    from {
      opacity: 0;
      transform: translateY(-20px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  nav {
    animation: fadeIn 1s ease-out;
  }
</style>

<nav class="navbar navbar-expand-lg navbar-custom">
  <div class="container-fluid">
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
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/signup.jsp">Sign Up</a>
        </li>
        <% } else { %>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/logout.jsp">Sign Out</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%= request.getContextPath() %>/my-account">Admin</a>
        </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>
