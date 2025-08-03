<%@page import="com.rohit.model.HealthRecord"%>
<%@page import="java.util.List"%>
<%@page import="com.rohit.model.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Patient Dashboard</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', sans-serif;
        }
        .dashboard-container {
            margin-top: 50px;
        }
        .patient-card {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .patient-card h2 {
            color: #0d6efd;
            margin-bottom: 15px;
        }
        .patient-details p {
            margin: 5px 0;
            font-size: 16px;
        }
        .records-table {
            margin-top: 30px;
        }
        .records-table table {
            border-radius: 10px;
            overflow: hidden;
        }
        .logout-btn {
            float: right;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<%
    Patient patient = (Patient) request.getAttribute("patient");
    List<HealthRecord> healthRecords = (List<HealthRecord>) request.getAttribute("healthRecords");
%>

<div class="container dashboard-container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="patient-card">
                <div class="d-flex justify-content-between align-items-center">
                    <h2>Welcome, <%= patient.getP_name() %></h2>
                    <a href="patientLogin" class="btn btn-outline-danger logout-btn">Logout</a>
                </div>
                <div class="patient-details mt-3">
                    <p><strong>Aadhar Number:</strong> <%= patient.getP_aadhar() %></p>
                    <p><strong>Date of Birth:</strong> <%= patient.getP_dob() %></p>
                    <p><strong>Contact Number:</strong> <%= patient.getP_contact() %></p>
                </div>
            </div>

            <div class="records-table mt-5">
                <h4 class="mb-3">Your Health Records</h4>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover text-center align-middle">
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
                                if (healthRecords != null && !healthRecords.isEmpty()) {
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
                                } else {
                            %>
                                <tr>
                                    <td colspan="5">No health records found.</td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
