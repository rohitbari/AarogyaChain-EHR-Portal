<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Pharmacist Dashboard</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons (optional but enhances UI) -->
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
        <h4 class="text-center mb-4">Pharmacist Panel</h4>
        <a href="viewHealthRecordsByPharmacist"><i class="bi bi-clipboard2-pulse"></i> View Health Records</a>
        <a href="searchPatientByPharmacist"><i class="bi bi-search"></i> Search Patient</a>
        <a href="changePharmacistPassword"><i class="bi bi-key"></i> Change Password</a>
        <div class="logout-btn">
            <a href="pharmacistLogin"><i class="bi bi-box-arrow-left"></i> Logout</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard-header">Welcome to Pharmacist Dashboard</div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="card card-dashboard p-4 text-center">
                    <i class="bi bi-clipboard2-pulse fs-1 text-primary"></i>
                    <h5 class="mt-3">Health Records</h5>
                    <p>View all the health records assigned by doctors to patients.</p>
                    <a href="viewHealthRecordsByPharmacist" class="btn btn-outline-primary btn-sm">View</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card card-dashboard p-4 text-center">
                    <i class="bi bi-search fs-1 text-success"></i>
                    <h5 class="mt-3">Search Patient</h5>
                    <p>Search and retrieve patient information easily.</p>
                    <a href="searchPatientByPharmacist" class="btn btn-outline-success btn-sm">Search</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card card-dashboard p-4 text-center">
                    <i class="bi bi-key fs-1 text-warning"></i>
                    <h5 class="mt-3">Change Password</h5>
                    <p>Update your login credentials securely.</p>
                    <a href="changePharmacistPassword" class="btn btn-outline-warning btn-sm">Change</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
