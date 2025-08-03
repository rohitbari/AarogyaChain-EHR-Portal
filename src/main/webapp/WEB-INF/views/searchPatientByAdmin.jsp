<%@page import="com.rohit.model.HealthRecord"%>
<%@page import="java.util.List"%>
<%@page import="com.rohit.model.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Search Patient Records | AarogyaChain Admin</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f1f4f9;
      font-family: 'Segoe UI', sans-serif;
    }

    .search-container {
      max-width: 800px;
      margin: 60px auto;
      background-color: #ffffff;
      padding: 40px;
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    h2 {
      font-weight: 700;
      color: #2c3e50;
      text-align: center;
      margin-bottom: 30px;
    }

    .form-label {
      font-weight: 500;
      color: #34495e;
    }

    .btn-primary {
      width: 100%;
      padding: 10px;
    }

    .patient-info {
      background-color: #eaf4ff;
      padding: 20px;
      border-radius: 10px;
      margin-top: 30px;
    }

    .table-container {
      margin-top: 20px;
      overflow-x: auto;
    }

    .table th {
      background-color: #212529;
      color: white;
    }

    .dashboard-link {
      text-align: center;
      margin-top: 30px;
    }

    .dashboard-link a {
      font-weight: 600;
      color: #0d6efd;
      text-decoration: none;
    }

    .dashboard-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="search-container">
    <h2><i class="fas fa-notes-medical me-2"></i>Search Patient Health Records</h2>

    <!-- Search Form -->
    <form action="submitSearchPatientByAdmin" method="post" class="row g-3">
      <div class="col-md-12">
        <label for="aadhar" class="form-label">Patient Aadhar Number</label>
        <input type="text" name="p_aadhar" id="aadhar" class="form-control" placeholder="Enter 12-digit Aadhar Number" minlength="12" maxlength="12" required>
      </div>
      <div class="col-12">
        <button type="submit" class="btn btn-primary"><i class="fas fa-search me-1"></i>Search</button>
      </div>
    </form>

    <%
      Patient patient = (Patient) request.getAttribute("patient");
      List<HealthRecord> healthRecords = (List<HealthRecord>) request.getAttribute("healthRecords");
      if(patient != null){
    %>

    <!-- Patient Information -->
    <div class="patient-info mt-4">
      <h5 class="fw-bold mb-3">Patient Details</h5>
      <p><strong>Name:</strong> <%= patient.getP_name() %></p>
      <p><strong>Aadhar:</strong> <%= patient.getP_aadhar() %></p>
      <p><strong>DOB:</strong> <%= patient.getP_dob() %></p>
      <p><strong>Contact:</strong> <%= patient.getP_contact() %></p>
      <p><strong>Address:</strong> <%= patient.getP_address() %></p>
    </div>

    <!-- Health Records Table -->
    <div class="table-container">
      <table class="table table-bordered table-hover mt-4">
        <thead>
          <tr>
            <th>Diagnosis</th>
            <th>Date</th>
            <th>Prescription</th>
            <th>Notes</th>
            <th>Doctor Name</th>
          </tr>
        </thead>
        <tbody>
          <%
            for (HealthRecord record : healthRecords) {
          %>
          <tr>
            <td><%= record.getDiagnosis() %></td>
            <td><%= record.getHr_date() %></td>
            <td><%= record.getPrescription() %></td>
            <td><%= record.getNotes() %></td>
            <td><%= record.getDoctor().getD_name() %></td>
          </tr>
          <%
            }
          %>
        </tbody>
      </table>
    </div>
    <%
      }
    %>

    <!-- Back to Dashboard -->
    <div class="dashboard-link">
      <a href="adminDashboard"><i class="fas fa-arrow-left me-2"></i>Back to Admin Dashboard</a>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
