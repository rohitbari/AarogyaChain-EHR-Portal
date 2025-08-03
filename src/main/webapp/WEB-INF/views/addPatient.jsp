<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Patient</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }
        .container {
            max-width: 600px;
            margin-top: 60px;
            background-color: #fff;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        h2 {
            margin-bottom: 30px;
            text-align: center;
            color: #0d47a1;
        }
        label {
            font-weight: 500;
            margin-bottom: 6px;
        }
        .form-control {
            margin-bottom: 20px;
        }
        .btn-primary {
            width: 100%;
        }
        .dashboard-link {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add New Patient</h2>
        <form action="AddPatient" method="post">
            <div class="mb-3">
                <label for="p_name">Full Name</label>
                <input type="text" class="form-control" id="p_name" name="p_name" placeholder="Enter patient's full name" required />
            </div>

            <div class="mb-3">
                <label for="p_contact">Contact Number</label>
                <input type="text" class="form-control" id="p_contact" name="p_contact" placeholder="10-digit mobile number" minlength="10" maxlength="10" required />
            </div>

            <div class="mb-3">
                <label for="p_aadhar">Aadhar Number</label>
                <input type="text" class="form-control" id="p_aadhar" name="p_aadhar" placeholder="Enter 12-digit Aadhar number" minlength="12" maxlength="12" required />
            </div>

            <div class="mb-3">
                <label for="p_dob">Date of Birth</label>
                <input type="date" class="form-control" id="p_dob" name="p_dob" required />
            </div>

            <div class="mb-3">
                <label for="p_address">Address</label>
                <input type="text" class="form-control" id="p_address" name="p_address" placeholder="Enter full address" required />
            </div>

            <button type="submit" class="btn btn-primary">Add Patient</button>
        </form>

        <a href="doctorDashboard" class="dashboard-link">	Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
