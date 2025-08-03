<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Change Password - Pharmacist</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome for icons (optional) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .container-box {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px 40px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
        }

        h2 {
            color: #0d47a1;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-primary {
            width: 100%;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #0d47a1;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container-box">
        <h2><i class="fas fa-key"></i> Change Password</h2>

        <form action="ChangePharmacistPassword" method="post">
            <div class="mb-3">
                <label class="form-label">Old Password:</label>
                <input type="password" class="form-control" name="oldPassword" required />
            </div>

            <div class="mb-3">
                <label class="form-label">New Password:</label>
                <input type="password" class="form-control" name="newPassword" required />
            </div>

            <div class="mb-3">
                <label class="form-label">Confirm New Password:</label>
                <input type="password" class="form-control" name="confirmPassword" required />
            </div>

            <button type="submit" class="btn btn-primary">Change Password</button>
        </form>

        <a class="back-link" href="pharmacistDashboard"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
