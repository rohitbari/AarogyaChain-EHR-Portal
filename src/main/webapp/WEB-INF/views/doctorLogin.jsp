<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Doctor Login</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #d7e5f4, #f2f9ff);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 430px;
        }

        .login-card h2 {
            font-weight: 600;
            margin-bottom: 10px;
            color: #1b4d70;
        }

        .login-card p {
            color: #6c757d;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 500;
            color: #34495e;
        }

        .form-control {
            border-radius: 10px;
        }

        .btn-primary {
            background-color: #1b4d70;
            border: none;
            border-radius: 10px;
        }

        .btn-primary:hover {
            background-color: #163c56;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #1b4d70;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-card">
    <div class="text-center">
        <h2>Doctor Login</h2>
        <p>Welcome back! Please login to continue.</p>
    </div>

    <form action="DoctorLogin" method="POST">
        <div class="mb-3">
            <label for="d_email" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="d_email" name="d_email" placeholder="Enter your email" required />
        </div>

        <div class="mb-3">
            <label for="d_password" class="form-label">Password</label>
            <input type="password" class="form-control" id="d_password" name="d_password" placeholder="Enter your password" required />
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Login</button>
        </div>

        <a href="index" class="back-link">Back to Home</a>
    </form>
</div>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
