package com.rohit.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rohit.dao.DoctorDao;
import com.rohit.dao.HealthRecordDao;
import com.rohit.dao.PatientDao;
import com.rohit.model.Doctor;
import com.rohit.model.HealthRecord;
import com.rohit.model.Patient;
import com.rohit.model.Pharmacist;

@Controller
public class DoctorController {
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Doctor doctor = (Doctor) context.getBean("doctor");
	DoctorDao doctorDao = (DoctorDao) context.getBean("doctorDao");

	Patient patient = (Patient) context.getBean("patient");
	PatientDao patientDao = (PatientDao) context.getBean("patientDao");

	HealthRecord healthRecord = (HealthRecord) context.getBean("healthRecord");
	HealthRecordDao healthRecordDao = (HealthRecordDao) context.getBean("healthRecordDao");

	// show login doctor page
	@RequestMapping("/doctorLogin")
	public String openDoctorLoginPage() {
		return "doctorLogin";
	}

	// login doctor
	@RequestMapping(path = "/DoctorLogin", method = RequestMethod.POST)
	public String doctorLogin(HttpServletRequest request, HttpSession session) {
		String d_email = request.getParameter("d_email");
		String d_password = request.getParameter("d_password");
		List<Doctor> allDoctors = doctorDao.getAllDoctors();
		for (Doctor d : allDoctors) {
			if (d.getD_email().equals(d_email) && d.getD_password().equals(d_password)) {
				System.out.println("Doctor Login...!!");

				session = request.getSession();
				session.setAttribute("doctor_id", d.getDid());
				session.setAttribute("doctor", d);

				return "doctorDashboard";
			}
		}
		System.err.println("Failed to Login or Doctor not found..!!");
		return "doctorLogin";
	}

	// show doctor dashboard page
	@RequestMapping("/doctorDashboard")
	public String openDoctorDashboardPage() {
		return "doctorDashboard";
	}

	// show Patient add page
	@RequestMapping("/addPatient")
	public String openAddPatientPage() {
		return "addPatient";
	}

	// add Patient
	@RequestMapping(path = "/AddPatient", method = RequestMethod.POST)
	public String addDoctor(HttpServletRequest request) {
		patient.setP_name(request.getParameter("p_name"));
		patient.setP_aadhar(request.getParameter("p_aadhar"));

		// Convert string to Date
		String dobStr = request.getParameter("p_dob");
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dob;
			dob = sdf.parse(dobStr);
			patient.setP_dob(dob);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		patient.setP_contact(request.getParameter("p_contact"));
		patient.setP_address(request.getParameter("p_address"));

		int i = patientDao.addPatient(patient);
		if (i > 0) {
			System.out.println("Patient added...!!");
			return "redirect:/viewAllPatientsByDoctor";
		} else {
			System.err.println("Failed to add Patient...!!");
			return "doctorDashboard";
		}
	}

	@RequestMapping("/viewAllPatientsByDoctor")
	public String viewAllPharmacists(Model m) {
		List<Patient> allPatients = patientDao.getAllPatients();
		m.addAttribute("allPatients", allPatients);
		return "viewAllPatientsByDoctor";
	}

	// show Add Patient Health Record By Doctor page
	@RequestMapping("/addPatientHealthRecordByDoctor")
	public String openAddPatientHealthRecordByDoctor(Model m, HttpServletRequest request) {
		int patient_id = Integer.parseInt(request.getParameter("p_id"));
		m.addAttribute("patient_id", patient_id);
		return "addPatientHealthRecordByDoctor";
	}

	// Save Patient Health Record By Doctor
	@RequestMapping(path = "/savePatientHealthRecord", method = RequestMethod.POST)
	public String saveHealthRecord(HttpServletRequest request, HttpSession session) {
		int p_id = Integer.parseInt(request.getParameter("patient_id"));
		Patient patient = patientDao.getPatient(p_id);

		Doctor doctor = (Doctor) session.getAttribute("doctor"); // Logged-in
																	// doctor
																	// from
																	// session

		healthRecord.setPatient(patient);
		healthRecord.setDoctor(doctor);

		healthRecord.setDiagnosis(request.getParameter("diagnosis"));
		healthRecord.setPrescription(request.getParameter("prescription"));
		healthRecord.setNotes(request.getParameter("notes"));

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdf.parse(request.getParameter("hr_date"));
			healthRecord.setHr_date(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		int i = healthRecordDao.addHealthRecord(healthRecord);
		if (i > 0) {
			System.out.println("Health Record added successfully!");
			return "redirect:/viewAllPatientsByDoctor";
		} else {
			System.err.println("Failed to add health record");
			return "doctorDashboard";
		}
	}

	// viewPatientHealthRecordByDoctor
	@RequestMapping("/viewPatientHealthRecordByDoctor")
	public String viewPatientHealthRecord(Model model, HttpServletRequest request) {
		int patient_id = Integer.parseInt(request.getParameter("p_id"));
		Patient p = patientDao.getPatient(patient_id);

		List<HealthRecord> healthRecords = healthRecordDao.getRecordsByPatientId(patient_id);

		model.addAttribute("patient", p);
		model.addAttribute("healthRecords", healthRecords);

		return "viewPatientHealthRecordByDoctor";
	}

	// open change doctor password page
	@RequestMapping(path = "/changeDoctorPassword", method = RequestMethod.GET)
	public String openChangeDoctorPassword() {
		return "changeDoctorPassword";
	}

	// change doctor password
	@RequestMapping(path = "/ChangeDoctorPassword", method = RequestMethod.POST)
	public String changeDoctorPassword(HttpServletRequest request, HttpSession session) {
		int did = (Integer) request.getSession().getAttribute("doctor_id");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");

		Doctor d = doctorDao.getDoctor(did);
		if (d.getD_password().equals(oldPassword) && newPassword.equals(confirmPassword)) {
			d.setD_password(newPassword);
			doctorDao.updateDoctor(d);
			System.out.println("Password changed succefully...!!");
			return "doctorLogin";
		} else {
			System.err.println("Incorrect OldPassword or New password not matched...!!");
			return "changeDoctorPassword";
		}

	}

	// show search Patient By Doctor page
	@RequestMapping(path = "/searchPatientByDoctor")
	public String openSearchPatientByDoctorPage() {
		return "searchPatientByDoctor";
	}

	// show search Patient By Doctor
	@RequestMapping("/submitSearchPatientByDoctor")
	public String searchPatientByDoctor(Model m, HttpServletRequest request) {
		String p_aadhar = request.getParameter("p_aadhar");
		if (p_aadhar != null) {
			Patient p = patientDao.getPatientByAadhar(p_aadhar);
			List<HealthRecord> healthRecords = healthRecordDao.getRecordsByPatientId(p.getPid());
			m.addAttribute("patient", p);
			m.addAttribute("healthRecords", healthRecords);
		}
		return "searchPatientByDoctor";
	}

}
