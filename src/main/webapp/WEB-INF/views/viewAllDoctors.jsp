<%@page import="com.rohit.model.Doctor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>View Doctors - AarogyaChain</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
    }

    .container {
      margin-top: 50px;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-weight: 600;
      color: #2c3e50;
    }

    table {
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }

    .dashboard-link {
      text-align: center;
      margin-top: 30px;
    }

    .dashboard-link a {
      text-decoration: none;
      color: #0d6efd;
      font-weight: 600;
    }

    .dashboard-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="container">
  <h2><i class="fas fa-user-md me-2"></i>View Doctors</h2>

  <table class="table table-striped table-bordered">
    <thead class="table-dark">
      <tr>
        <th>Doctor Name</th>
        <th>Email</th>
        <th>Contact</th>
        <th>Specialization</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <%
        List<Doctor> allDoctors = (List<Doctor>) request.getAttribute("allDoctors");
        for(Doctor d : allDoctors) {
      %>
        <tr>
          <td><%= d.getD_name() %></td>
          <td><%= d.getD_email() %></td>
          <td><%= d.getD_contact() %></td>
          <td><%= d.getD_specialization() %></td>
          <td>
            <a href="deleteDoctor?did=<%=d.getDid()%>" class="btn btn-danger btn-sm">
              <i class="fas fa-trash-alt"></i> Delete
            </a>
          </td>
        </tr>
      <%
        }
      %>
    </tbody>
  </table>

  <div class="dashboard-link">
    <a href="adminDashboard"><i class="fas fa-arrow-left me-1"></i>Back to Dashboard</a>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
