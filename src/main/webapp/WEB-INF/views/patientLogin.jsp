<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Patient Login</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f2f4f7;
        }

        .container {
            max-width: 450px;
            margin-top: 80px;
        }

        .card {
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .form-label {
            font-weight: 500;
        }

        h2 {
            color: #0d6efd;
            text-align: center;
            margin-bottom: 25px;
        }

        .btn-primary {
            width: 100%;
        }

        .home-link {
            display: block;
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Patient Login</h2>
            <form action="PatientLogin" method="POST">
                <div class="mb-3">
                    <label class="form-label" for="p_aadhar">Aadhar No.:</label>
                    <input type="text" class="form-control" id="p_aadhar" name="p_aadhar"
                           placeholder="Enter 12-digit Aadhar No." minlength="12" maxlength="12" required />
                </div>

                <div class="mb-3">
                    <label class="form-label" for="p_dob">Date of Birth:</label>
                    <input type="date" class="form-control" id="p_dob" name="p_dob" required />
                </div>

                <button type="submit" class="btn btn-primary">Login</button>
            </form>

            <a href="index" class="home-link text-decoration-none text-secondary">Go to Home</a>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
