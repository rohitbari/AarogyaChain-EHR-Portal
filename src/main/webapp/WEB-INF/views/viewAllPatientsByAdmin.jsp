<%@page import="com.rohit.model.Patient"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>View Patients - AarogyaChain</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome Icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f5f7fa;
      font-family: 'Segoe UI', sans-serif;
    }

    .container {
      margin-top: 50px;
    }

    h2 {
      text-align: center;
      color: #2c3e50;
      font-weight: bold;
      margin-bottom: 30px;
    }

    table {
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
    }

    .dashboard-link {
      margin-top: 30px;
      text-align: center;
    }

    .dashboard-link a {
      text-decoration: none;
      font-weight: 600;
      color: #0d6efd;
    }

    .dashboard-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="container">
  <h2><i class="fas fa-user-injured me-2"></i>View All Patients</h2>

  <table class="table table-striped table-bordered">
    <thead class="table-dark">
      <tr>
        <th>Patient Name</th>
        <th>Aadhar No.</th>
        <th>DOB</th>
        <th>Contact</th>
        <th>Address</th>
      </tr>
    </thead>
    <tbody>
      <%
        List<Patient> allPatients = (List<Patient>) request.getAttribute("allPatients");
        for(Patient p: allPatients){
      %>
      <tr>
        <td><%=p.getP_name() %></td>
        <td><%=p.getP_aadhar() %></td>
        <td><%=p.getP_dob() %></td>
        <td><%=p.getP_contact() %></td>
        <td><%=p.getP_address() %></td>
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

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
