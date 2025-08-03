<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Change Password</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f2f4f6;
        }

        .container {
            margin-top: 60px;
            max-width: 500px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #0d6efd;
            margin-bottom: 20px;
        }

        .back-link {
            display: inline-block;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card p-4">
            <h2 class="text-center">Change Password</h2>

            <form action="ChangeDoctorPassword" method="post">
                <div class="mb-3">
                    <label for="oldPassword" class="form-label">Old Password:</label>
                    <input type="password" class="form-control" id="oldPassword" name="oldPassword" required />
                </div>

                <div class="mb-3">
                    <label for="newPassword" class="form-label">New Password:</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" required />
                </div>

                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm New Password:</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required />
                </div>

                <button type="submit" class="btn btn-primary w-100">Change Password</button>
            </form>

            <a href="doctorDashboard" class="btn btn-link back-link">Back to Dashboard</a>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
