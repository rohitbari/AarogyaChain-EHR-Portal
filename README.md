
# 🩺 AarogyaChain – Electronic Health Record (EHR) System

**AarogyaChain** is a Spring MVC and Hibernate-based web application designed to digitize and streamline medical records. It offers secure and centralized access to health data for **Doctors**, **Patients**, **Pharmacists**, and **Admins**, ensuring transparency, traceability, and data integrity.

---

## ✅ Key Features

### 🏥 Admin
- Login
- Add/View/Delete Doctors
- Add/View/Delete Pharmacists
- View All Patients
- Search Patient → View Complete Patient Details

### 👨‍⚕️ Doctor
- Login
- Search Patient → View Patient Info
- Add New Patient
- Add/View Health Records for Patients
- Change Password

### 🧑‍💻 Patient
- Login using Aadhaar and DOB
- View Personal Medical History
- View Prescriptions

### 💊 Pharmacist
- Login
- Search Patient by Aadhaar
- View Health Records and Prescriptions
- Change Password

---

## 🛠️ Technology Stack

| Layer        | Technologies                                       |
|--------------|----------------------------------------------------|
| Backend      | Java, Spring MVC, Spring ORM (Hibernate)           |
| Frontend     | JSP, HTML, CSS, Bootstrap                          |
| Database     | PostgreSQL                                         |
| Server       | Apache Tomcat                                      |
| IDE/Tools    | Eclipse / IntelliJ IDEA, pgAdmin                   |

---

## 📁 Project Structure

```

AarogyaChain/
├── src/
│   └── com.rohit.\*       # Controllers, DAOs, Entities / Models
├── webapp/
│   ├── WEB-INF/
│       ├── views/          # JSP Pages
│       └── web.xml
└── README.md

````

---

## 🧪 Setup Instructions

### 🔧 Prerequisites:
- Java JDK 8+
- PostgreSQL
- Apache Tomcat 7
- Maven
- Eclipse/IntelliJ IDEA

### 🚀 Steps to Run:

1. **Clone the repository**
   ```bash
   git clone https://github.com/rohitbari/AarogyaChain-EHR-Portal.git
````

2. **Import into IDE**
   Open in Eclipse or IntelliJ as a Maven project.

3. **Database Setup**

   * Create a PostgreSQL database named `aarogya_db`
   * Execute the SQL script inside `/sql/aarogya_db.sql`
   * Update DB credentials in your `DBConnection.java` or `config.xml`

4. **Run Application**

   * Build the project using Maven
   * Deploy the WAR file on Apache Tomcat
   * Access the app at:
     `http://localhost:8080/AarogyaChain/`

---

## 🧾 Database Design (PostgreSQL Schema)

### 1. **Doctor**

| Column         | Type         | Description        |
| -------------- | ------------ | ------------------ |
| id (PK)        | SERIAL       | Unique Doctor ID   |
| name           | VARCHAR(100) | Doctor’s Name      |
| email          | VARCHAR(100) | Unique Email       |
| password       | VARCHAR(100) | Encrypted Password |
| specialization | VARCHAR(100) | Medical Expertise  |
| contact        | VARCHAR(15)  | Phone Number       |

### 2. **Patient**

| Column  | Type         | Description         |
| ------- | ------------ | ------------------- |
| id (PK) | SERIAL       | Unique Patient ID   |
| name    | VARCHAR(100) | Patient’s Name      |
| dob     | DATE         | Date of Birth       |
| aadhaar | VARCHAR(12)  | Unique Aadhaar No   |
| address | VARCHAR(255) | Residential Address |
| contact | VARCHAR(15)  | Phone Number        |

### 3. **Pharmacist**

| Column   | Type         | Description          |
| -------- | ------------ | -------------------- |
| id (PK)  | SERIAL       | Unique Pharmacist ID |
| name     | VARCHAR(100) | Name                 |
| email    | VARCHAR(100) | Unique Email         |
| password | VARCHAR(100) | Encrypted Password   |
| contact  | VARCHAR(15)  | Phone Number         |

### 4. **HealthRecord**

| Column       | Type     | Description                 |
| ------------ | -------- | --------------------------- |
| id (PK)      | SERIAL   | Unique Record ID            |
| patient\_id  | INT (FK) | Linked to Patient table     |
| doctor\_id   | INT (FK) | Linked to Doctor table      |
| date         | DATE     | Date of Visit               |
| diagnosis    | TEXT     | Medical Condition Diagnosed |
| prescription | TEXT     | Medications Prescribed      |
| notes        | TEXT     | Additional Notes            |

---

## 👤 Author

**Rohit Bari**
Java Developer | Backend & Full Stack Enthusiast
[GitHub](https://github.com/rohitbari) • [LinkedIn](https://linkedin.com/in/rohitbari)

---

