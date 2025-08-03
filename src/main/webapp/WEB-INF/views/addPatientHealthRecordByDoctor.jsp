<%@page import="com.rohit.dao.DoctorDao"%>
<%@page import="com.rohit.model.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Health Record</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            max-width: 700px;
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #0d6efd;
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            font-weight: 500;
            margin-top: 10px;
        }

        textarea, input[type="date"] {
            resize: none;
        }

        .btn-primary {
            width: 100%;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #0d6efd;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Health Record</h2>
        <form action="savePatientHealthRecord" method="post">
            <input type="hidden" name="doctor_id" value="1" />
            <input type="hidden" name="patient_id" value="<%=request.getParameter("p_id")%>" />

            <div class="mb-3">
                <label for="diagnosis">Diagnosis:</label>
                <textarea name="diagnosis" class="form-control" rows="3" required></textarea>
            </div>

            <div class="mb-3">
                <label for="prescription">Prescription:</label>
                <textarea name="prescription" class="form-control" rows="3" required></textarea>
            </div>

            <div class="mb-3">
                <label for="notes">Notes:</label>
                <textarea name="notes" class="form-control" rows="3"></textarea>
            </div>

            <div class="mb-3">
                <label for="hr_date">Visit Date:</label>
                <input type="date" name="hr_date" class="form-control" required />
            </div>

            <button type="submit" class="btn btn-primary">Save Health Record</button>
        </form>

        <a href="viewAllPatientsByDoctor" class="back-link">Back to Patient List</a>
    </div>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
