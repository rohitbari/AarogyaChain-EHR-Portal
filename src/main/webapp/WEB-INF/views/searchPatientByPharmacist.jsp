<%@page import="com.rohit.model.HealthRecord"%>
<%@page import="java.util.List"%>
<%@page import="com.rohit.model.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Search Patient - Pharmacist</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            margin-top: 40px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .btn-primary {
            background-color: #0d47a1;
            border-color: #0d47a1;
        }

        .btn-primary:hover {
            background-color: #1565c0;
        }

        table {
            margin-top: 30px;
        }

        table th, table td {
            text-align: center;
            vertical-align: middle;
        }

        .dashboard-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Form Card -->
    <div class="card p-4">
        <h4 class="mb-3 text-primary"><i class="fa fa-search"></i> Search Patient by Aadhar</h4>
        <form action="submitSearchPatientByPharmacist" method="post">
            <div class="mb-3">
                <label for="p_aadhar" class="form-label">Aadhar Number</label>
                <input type="text" id="p_aadhar" name="p_aadhar" class="form-control" placeholder="Enter Aadhar No." minlength="12" maxlength="12" required>
            </div>
            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> Search</button>
        </form>
    </div>

    <!-- Display Patient and Records if available -->
    <%
        Patient patient = (Patient) request.getAttribute("patient");
        List<HealthRecord> healthRecords = (List<HealthRecord>) request.getAttribute("healthRecords");

        if (patient != null) {
    %>
        <div class="card mt-5 p-4">
            <h4 class="text-success mb-3">Health Records for: <%= patient.getP_name() %></h4>
            <p>
                <strong>Aadhar:</strong> <%= patient.getP_aadhar() %> |
                <strong>DOB:</strong> <%= patient.getP_dob() %> |
                <strong>Contact:</strong> <%= patient.getP_contact() %> |
                <strong>Address:</strong> <%= patient.getP_address() %>
            </p>

            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Diagnosis</th>
                            <th>Date</th>
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
        </div>
    <%
        }
    %>

    <!-- Go Back Link -->
    <a href="pharmacistDashboard" class="btn btn-outline-primary dashboard-link"><i class="fa fa-arrow-left"></i> Go to Dashboard</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
