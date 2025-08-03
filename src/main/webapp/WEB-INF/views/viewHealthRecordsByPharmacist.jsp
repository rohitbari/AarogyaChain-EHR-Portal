<%@page import="com.rohit.model.HealthRecord"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Pharmacist - Health Records</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #0d6efd;
        }

        table {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #0d6efd;
            color: white;
            text-align: center;
        }

        td {
            vertical-align: middle;
        }

        .dashboard-link {
            display: block;
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Patient Health Records</h2>

        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle">
                <thead>
                    <tr>
                        <th>Patient Name</th>
                        <th>Diagnosis</th>
                        <th>Date</th>
                        <th>Prescription</th>
                        <th>Notes</th>
                        <th>Doctor Name</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<HealthRecord> healthRecords = (List<HealthRecord>) request.getAttribute("healthRecords");
                        for (HealthRecord record : healthRecords) {
                    %>
                    <tr>
                        <td><%= record.getPatient().getP_name() %></td>
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

        <a href="pharmacistDashboard" class="btn btn-outline-primary dashboard-link">Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
