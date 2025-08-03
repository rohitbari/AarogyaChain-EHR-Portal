<%@page import="com.rohit.model.Patient"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Patients</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
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

        .table {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
        }

        th {
            background-color: #0d6efd;
            color: white;
            text-align: center;
        }

        td {
            text-align: center;
        }

        .btn-action {
            font-weight: 500;
            padding: 6px 12px;
            border-radius: 5px;
            background-color: #e9f2ff;
            color: #0d6efd;
            transition: 0.3s;
            text-decoration: none;
        }

        .btn-action:hover {
            background-color: #d0e7ff;
            text-decoration: none;
            color: #0a58ca;
        }

        .dashboard-link {
            display: block;
            text-align: center;
            margin-top: 30px;
        }

        .dashboard-link a {
            color: #0d6efd;
            font-weight: 500;
            text-decoration: none;
        }

        .dashboard-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Patient List</h2>

        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle">
                <thead>
                    <tr>
                        <th>Patient Name</th>
                        <th>Aadhar No.</th>
                        <th>DOB</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Add Record</th>
                        <th>Previous Record</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Patient> allPatients = (List<Patient>) request.getAttribute("allPatients");
                        for (Patient p : allPatients) {
                    %>
                    <tr>
                        <td><%= p.getP_name() %></td>
                        <td><%= p.getP_aadhar() %></td>
                        <td><%= p.getP_dob() %></td>
                        <td><%= p.getP_contact() %></td>
                        <td><%= p.getP_address() %></td>
                        <td>
                            <a class="btn-action" href="addPatientHealthRecordByDoctor?p_id=<%=p.getPid()%>">Add Record</a>
                        </td>
                        <td>
                            <a class="btn-action" href="viewPatientHealthRecordByDoctor?p_id=<%=p.getPid()%>">View Records</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <div class="dashboard-link">
            <a href="doctorDashboard">Back to Dashboard</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
