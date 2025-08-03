<%@page import="com.rohit.model.HealthRecord"%>
<%@page import="java.util.List"%>
<%@page import="com.rohit.model.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Patient Health Record Search</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 40px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #0d6efd;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 500;
        }

        .back-link {
            margin-top: 20px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="submitSearchPatientByDoctor" method="post" class="mb-4">
            <div class="mb-3">
                <label class="form-label">Aadhar No.:</label>
                <input type="text" class="form-control" placeholder="Aadhar No." minlength="12" maxlength="12" name="p_aadhar" required />
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>

        <%
            Patient patient = (Patient) request.getAttribute("patient");
            List<HealthRecord> healthRecords = (List<HealthRecord>) request.getAttribute("healthRecords");
        %>

        <%
            if(patient != null) {
        %>
            <h2>Health Records for Patient: <%= patient.getP_name() %></h2>
            <p>
                <strong>Aadhar:</strong> <%= patient.getP_aadhar() %> &nbsp; | &nbsp;
                <strong>DOB:</strong> <%= patient.getP_dob() %> &nbsp; | &nbsp;
                <strong>Contact:</strong> <%= patient.getP_contact() %> &nbsp; | &nbsp;
                <strong>Address:</strong> <%= patient.getP_address() %>
            </p>

            <div class="table-responsive mt-3">
                <table class="table table-bordered table-hover align-middle">
                    <thead class="table-light text-center">
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
        <%
            }
        %>

        <a href="doctorDashboard" class="btn btn-outline-secondary back-link mt-3">Go to Dashboard</a>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
