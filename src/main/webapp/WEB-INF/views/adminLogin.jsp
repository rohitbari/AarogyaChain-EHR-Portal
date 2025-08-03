<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Login</title>

    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-box {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 40px;
            border-radius: 15px;
            width: 350px;
            color: white;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .form-control {
            background-color: rgba(255,255,255,0.2);
            color: white;
            border: none;
            border-radius: 5px;
        }

        .form-control::placeholder {
            color: #ddd;
        }

        .form-control:focus {
            box-shadow: none;
            background-color: rgba(255,255,255,0.3);
            color: white;
        }

        label {
            font-weight: 500;
            margin-top: 10px;
        }

        .btn-custom {
            background-color: #00b894;
            color: white;
            font-weight: bold;
            margin-top: 20px;
        }

        .btn-custom:hover {
            background-color: #019875;
        }

        .go-home {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #00cec9;
            text-decoration: none;
            font-size: 14px;
        }

        .go-home:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-box">
        <h2><i class="fas fa-user-shield"></i> Admin Login</h2>
        <form action="AdminLogin" method="POST">
            <label>Email:</label>
            <input type="email" class="form-control" placeholder="Email" name="email" required="required" />

            <label>Password:</label>
            <input type="password" class="form-control" placeholder="Password" name="password" required="required" />

            <button type="submit" class="btn btn-custom w-100">Login</button>
        </form>
        <a class="go-home" href="index"><i class="fas fa-home"></i> Go to Home</a>
    </div>

</body>
</html>
