<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Admin Dashboard - AarogyaChain</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f8f9fa;
    }

    .sidebar {
      height: 100vh;
      width: 250px;
      position: fixed;
      top: 0;
      left: 0;
      background-color: #0d6efd;
      padding-top: 60px;
      color: white;
    }

    .sidebar h4 {
      text-align: center;
      margin-bottom: 30px;
      font-weight: 600;
    }

    .sidebar a {
      padding: 15px 20px;
      display: block;
      color: white;
      text-decoration: none;
      transition: 0.3s;
      font-size: 1.1rem;
    }

    .sidebar a:hover {
      background-color: #0b5ed7;
    }

    .main-content {
      margin-left: 250px;
      padding: 30px;
    }

    .dashboard-header {
      font-size: 2rem;
      margin-bottom: 30px;
      font-weight: bold;
      color: #0d6efd;
    }

    .card-dashboard {
      border: none;
      border-radius: 15px;
      box-shadow: 0 2px 12px rgba(0,0,0,0.1);
      transition: transform 0.2s;
    }

    .card-dashboard:hover {
      transform: scale(1.02);
    }

    .logout-btn {
      position: absolute;
      bottom: 20px;
      width: 100%;
    }

    .logout-btn a {
      display: block;
      text-align: center;
      padding: 15px;
      color: #ffc107;
      text-decoration: none;
      font-weight: bold;
    }

    .logout-btn a:hover {
      background-color: #ffc107;
      color: #0d6efd;
    }
  </style>
</head>
<body>

  <!-- Sidebar -->
  <div class="sidebar">
    <h4>Admin Panel</h4>
    <a href="addDoctor"><i class="bi bi-person-plus"></i> Add Doctor</a>
    <a href="addPharmacist"><i class="bi bi-capsule"></i> Add Pharmacist</a>
    <a href="viewAllDoctors"><i class="bi bi-person-badge"></i> View Doctors</a>
    <a href="viewAllPharmacists"><i class="bi bi-bandaid"></i> View Pharmacists</a>
    <a href="viewAllPatientsByAdmin"><i class="bi bi-people"></i> View Patients</a>
    <a href="searchPatientByAdmin"><i class="bi bi-search"></i> Search Patient</a>
    <div class="logout-btn">
      <a href="adminLogin"><i class="bi bi-box-arrow-left"></i> Logout</a>
    </div>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <div class="dashboard-header">Welcome to Admin Dashboard</div>

    <div class="row g-4">
      <div class="col-md-4">
        <div class="card card-dashboard p-4 text-center">
          <i class="bi bi-person-plus fs-1 text-primary"></i>
          <h5 class="mt-3">Add Doctor</h5>
          <p>Register new doctors in the system.</p>
          <a href="addDoctor" class="btn btn-outline-primary btn-sm">Add</a>
        </div>
      </div>

      <div class="col-md-4">
        <div class="card card-dashboard p-4 text-center">
          <i class="bi bi-capsule fs-1 text-success"></i>
          <h5 class="mt-3">Add Pharmacist</h5>
          <p>Add authorized pharmacists to the network.</p>
          <a href="addPharmacist" class="btn btn-outline-success btn-sm">Add</a>
        </div>
      </div>

      <div class="col-md-4">
        <div class="card card-dashboard p-4 text-center">
          <i class="bi bi-person-badge fs-1 text-info"></i>
          <h5 class="mt-3">View Doctors</h5>
          <p>Manage and view the list of registered doctors.</p>
          <a href="viewAllDoctors" class="btn btn-outline-info btn-sm">View</a>
        </div>
      </div>

      <div class="col-md-4">
        <div class="card card-dashboard p-4 text-center">
          <i class="bi bi-bandaid fs-1 text-warning"></i>
          <h5 class="mt-3">View Pharmacists</h5>
          <p>Access information of registered pharmacists.</p>
          <a href="viewAllPharmacists" class="btn btn-outline-warning btn-sm">View</a>
        </div>
      </div>

      <div class="col-md-4">
        <div class="card card-dashboard p-4 text-center">
          <i class="bi bi-people fs-1 text-secondary"></i>
          <h5 class="mt-3">View Patients</h5>
          <p>View records of all system-registered patients.</p>
          <a href="viewAllPatientsByAdmin" class="btn btn-outline-secondary btn-sm">View</a>
        </div>
      </div>

      <div class="col-md-4">
        <div class="card card-dashboard p-4 text-center">
          <i class="bi bi-search fs-1 text-dark"></i>
          <h5 class="mt-3">Search Patient</h5>
          <p>Quickly find a specific patient by ID or name.</p>
          <a href="searchPatientByAdmin" class="btn btn-outline-dark btn-sm">Search</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
