<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>AarogyaChain - Home</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(to right, #00c6ff, #0072ff);
      color: #fff;
    }

    .navbar {
      background: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(10px);
      box-shadow: 0 4px 20px rgba(0,0,0,0.2);
    }

    .navbar-brand {
      font-weight: 800;
      font-size: 1.7rem;
      color: #ffffff !important;
    }

    .nav-link {
      font-weight: 500;
      color: #fff !important;
      transition: 0.3s;
    }

    .nav-link:hover {
      color: #ffd369 !important;
    }

    .hero-section {
      height: 100vh;
      background: url('/AarogyaChain/images/EHR_frontPageimage.webp') center/cover no-repeat;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
    }

    .hero-overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.55);
      z-index: 1;
    }

    .hero-card {
      z-index: 2;
      text-align: center;
      padding: 40px;
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      color: white;
      max-width: 800px;
      margin: auto;
    }

    .hero-card h1 {
      font-size: 3rem;
      font-weight: 700;
      margin-bottom: 20px;
      animation: slideInDown 1s ease-out;
    }

    .hero-card p {
      font-size: 1.2rem;
      color: #e6e6e6;
    }

    .icon-row {
      margin-top: 25px;
      font-size: 2rem;
    }

    .icon-row i {
      margin: 0 15px;
      transition: transform 0.3s ease-in-out;
      cursor: pointer;
    }

    .icon-row i:hover {
      transform: scale(1.3);
      color: #ffd369;
    }

    @keyframes slideInDown {
      from {
        transform: translateY(-40px);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }

    @media screen and (max-width: 768px) {
      .hero-card h1 {
        font-size: 2rem;
      }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><i class="fas fa-notes-medical me-2"></i>AarogyaChain</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
        data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item"><a class="nav-link" href="adminLogin">Admin</a></li>
          <li class="nav-item"><a class="nav-link" href="doctorLogin">Doctor</a></li>
          <li class="nav-item"><a class="nav-link" href="patientLogin">Patient</a></li>
          <li class="nav-item"><a class="nav-link" href="pharmacistLogin">Pharmacist</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Hero Section -->
  <div class="hero-section">
    <div class="hero-overlay"></div>
    <div class="hero-card">
      <h1><i class="fas fa-file-medical-alt"></i> AarogyaChain</h1>
      <p>A decentralized, secure and transparent Electronic Health Record (EHR) system connecting patients, doctors, pharmacists and admins in real-time.</p>
      <div class="icon-row mt-4">
        <i class="fas fa-user-md" title="Doctors"></i>
        <i class="fas fa-procedures" title="Patients"></i>
        <i class="fas fa-pills" title="Pharmacists"></i>
        <i class="fas fa-user-shield" title="Admin"></i>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



<!--  
<html>
<body>
<h2>AarogyaChain</h2>

<a href="adminLogin">Admin Login</a></br>
<a href="doctorLogin">Doctor Login</a></br>
<a href="patientLogin">Patient Login</a></br>
<a href="pharmacistLogin">Pharmacist Login</a></br>
</body>
</html>

-->