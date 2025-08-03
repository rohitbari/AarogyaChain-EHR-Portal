<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Add Pharmacist - AarogyaChain</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f0f2f5;
      font-family: 'Segoe UI', sans-serif;
    }

    .form-container {
      max-width: 600px;
      margin: 60px auto;
      padding: 30px;
      background-color: white;
      border-radius: 12px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }

    .form-container h2 {
      text-align: center;
      margin-bottom: 25px;
      font-weight: 700;
      color: #2c3e50;
    }

    .form-control {
      margin-bottom: 15px;
    }

    .btn-primary {
      width: 100%;
    }

    .dashboard-link {
      text-align: center;
      margin-top: 20px;
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

  <div class="container form-container">
    <h2><i class="fas fa-user-nurse me-2"></i>Add Pharmacist</h2>
    <form action="AddPharmacist" method="post">
      <label for="ph_name">Full Name:</label>
      <input type="text" class="form-control" id="ph_name" name="ph_name" placeholder="Enter full name of the pharmacist" required />

      <label for="ph_contact">Mobile Number:</label>
      <input type="text" class="form-control" id="ph_contact" name="ph_contact" minlength="10" maxlength="10" placeholder="Enter 10-digit contact number" required />

      <label for="ph_email">Email Address:</label>
      <input type="email" class="form-control" id="ph_email" name="ph_email" placeholder="Enter email address (e.g., example@mail.com)" required />

      <label for="ph_password">Create Password:</label>
      <input type="password" class="form-control" id="ph_password" name="ph_password" placeholder="Set a strong password" required />

      <button type="submit" class="btn btn-primary mt-2">Add Pharmacist</button>
    </form>

    <div class="dashboard-link mt-3">
      <a href="adminDashboard"><i class="fas fa-arrow-left me-1"></i>Back to Dashboard</a>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
