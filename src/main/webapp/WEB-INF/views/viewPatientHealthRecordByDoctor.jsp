<%@page import="com.rohit.model.HealthRecord"%>
<%@page import="java.util.List"%>
<%@page import="com.rohit.model.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Health Records</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            margin-top: 50px;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #0d6efd;
            margin-bottom: 20px;
        }

        .patient-info {
            margin-bottom: 30px;
            font-size: 16px;
        }

        table {
            font-size: 15px;
        }

        .back-link {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            color: #0d6efd;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            Patient patient = (Patient) request.getAttribute("patient");
            List<HealthRecord> healthRecords = (List<HealthRecord>) request.getAttribute("healthRecords");
        %>

        <h2>Health Records for Patient: <%= patient.getP_name() %></h2>
        <div class="patient-info">
            <p>
                <strong>Aadhar:</strong> <%= patient.getP_aadhar() %> &nbsp; | &nbsp;
                <strong>DOB:</strong> <%= patient.getP_dob() %> &nbsp; | &nbsp;
                <strong>Contact:</strong> <%= patient.getP_contact() %>
            </p>
        </div>

        <div class="table-responsive">
            <table class="table table-bordered table-striped align-middle">
                <thead class="table-primary text-center">
                    <tr>
                        <th>Diagnosis</th>
                        <th>Visit Date</th>
                        <th>Prescription</th>
                        <th>Notes</th>
                        <th>Doctor Name</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (HealthRecord record : healthRecords) {
                    %>
                    <tr>
                        <td><%= record.getDiagnosis() %></td>
                        <td><%= record.getHr_date() %></td>
                        <td><%= record.getPrescription() %></td>
                        <td><%= record.getNotes() %></td>
                        <td><%= record.getDoctor().getD_name() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <a href="viewAllPatientsByDoctor" class="back-link">Back to Patients</a>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
