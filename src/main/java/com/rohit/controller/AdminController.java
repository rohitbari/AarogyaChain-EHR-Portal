package com.rohit.controller;

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
import com.rohit.dao.PharmacistDao;
import com.rohit.model.Doctor;
import com.rohit.model.HealthRecord;
import com.rohit.model.Patient;
import com.rohit.model.Pharmacist;

@Controller
public class AdminController {
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Doctor doctor = (Doctor) context.getBean("doctor");
	DoctorDao doctorDao = (DoctorDao) context.getBean("doctorDao");

	Pharmacist pharmacist = (Pharmacist) context.getBean("pharmacist");
	PharmacistDao pharmacistDao = (PharmacistDao) context.getBean("pharmacistDao");

	Patient patient = (Patient) context.getBean("patient");
	PatientDao patientDao = (PatientDao) context.getBean("patientDao");

	HealthRecord healthRecord = (HealthRecord) context.getBean("healthRecord");
	HealthRecordDao healthRecordDao = (HealthRecordDao) context.getBean("healthRecordDao");

	// Show Admin Login Page (GET request)
	@RequestMapping(path = "/adminLogin")
	public String openAdminLoginPage() {
		return "adminLogin";
	}

	// login admin
	@RequestMapping(path = "/AdminLogin", method = RequestMethod.POST)
	public String adminLogin(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if (email.equals("admin@gmail.com") && password.equals("admin")) {
			System.out.println("Admin Login...!!");
			return "adminDashboard";
		} else {
			System.err.println("Failed to Login...!!");
			return "adminLogin";
		}
	}

	// show admin dashboard page
	@RequestMapping(path = "/adminDashboard")
	public String openAdminDashboard() {
		return "adminDashboard";
	}

	// Doctor
	// show add doctor page
	@RequestMapping(path = "/addDoctor")
	public String openAddDoctorPage() {
		return "addDoctor";
	}

	// add doctor
	@RequestMapping(path = "/AddDoctor", method = RequestMethod.POST)
	public String addDoctor(HttpServletRequest request) {
		doctor.setD_name(request.getParameter("d_name"));
		doctor.setD_email(request.getParameter("d_email"));
		doctor.setD_password(request.getParameter("d_password"));
		doctor.setD_contact(request.getParameter("d_contact"));
		doctor.setD_specialization(request.getParameter("d_specialization"));
		int i = doctorDao.addDoctor(doctor);
		if (i > 0) {
			System.out.println("Doctor added...!!");
			return "redirect:/viewAllDoctors";
		} else {
			System.err.println("Failed to add Doctor...!!");
			return "adminDashboard";
		}
	}

	// view all doctors
	@RequestMapping(path = "/viewAllDoctors")
	public String viewAllDoctors(Model m) {
		List<Doctor> allDoctors = doctorDao.getAllDoctors();
		m.addAttribute("allDoctors", allDoctors);
		return "viewAllDoctors";
	}

	// delete doctor
	@RequestMapping(path = "/deleteDoctor")
	public String deleteDoctor(HttpServletRequest request) {
		int did = Integer.parseInt(request.getParameter("did"));
		doctorDao.deleteDoctor(did);
		System.out.println("Doctor deleted...!!");
		return "redirect:/viewAllDoctors";
	}

	// Pharmacist
	// show add pharmacist page
	@RequestMapping(path = "/addPharmacist")
	public String openAddPharmacistPage() {
		return "addPharmacist";
	}

	// add Pharmacist
	@RequestMapping(path = "/AddPharmacist", method = RequestMethod.POST)
	public String addPharmacist(HttpServletRequest request) {
		pharmacist.setPh_name(request.getParameter("ph_name"));
		pharmacist.setPh_email(request.getParameter("ph_email"));
		pharmacist.setPh_password(request.getParameter("ph_password"));
		pharmacist.setPh_contact(request.getParameter("ph_contact"));
		int i = pharmacistDao.addPharmacist(pharmacist);
		if (i > 0) {
			System.out.println("Pharmacist added...!!");
			return "redirect:/viewAllPharmacists";
		} else {
			System.err.println("Failed to add Pharmacist...!!");
			return "adminDashboard";
		}
	}

	// view all pharmacists
	@RequestMapping("/viewAllPharmacists")
	public String viewAllPharmacists(Model m) {
		List<Pharmacist> allPharmacists = pharmacistDao.getAllPharmacists();
		m.addAttribute("allPharmacists", allPharmacists);
		return "viewAllPharmacists";
	}

	// delete pharmacists
	@RequestMapping("/deletePharmacist")
	public String deletePharmacist(HttpServletRequest request) {
		int ph_id = Integer.parseInt(request.getParameter("ph_id"));
		pharmacistDao.deletePharmacist(ph_id);
		System.out.println("pharmacist deleted...!!");
		return "redirect:/viewAllPharmacists";
	}

	// Patients
	@RequestMapping("/viewAllPatientsByAdmin")
	public String viewAllPatientsByAdmin(Model m) {
		List<Patient> allPatients = patientDao.getAllPatients();
		m.addAttribute("allPatients", allPatients);
		return "viewAllPatientsByAdmin";
	}

	// show search Patient By Admin page
	@RequestMapping(path = "/searchPatientByAdmin")
	public String openSearchPatientByAdminPage() {
		return "searchPatientByAdmin";
	}

	// show search Patient By Admin
	@RequestMapping("/submitSearchPatientByAdmin")
	public String searchPatientByAdmin(Model m, HttpServletRequest request) {
		String p_aadhar = request.getParameter("p_aadhar");
		if (p_aadhar != null) {
			Patient p = patientDao.getPatientByAadhar(p_aadhar);
			List<HealthRecord> healthRecords = healthRecordDao.getRecordsByPatientId(p.getPid());
			m.addAttribute("patient", p);
			m.addAttribute("healthRecords", healthRecords);
		}
		return "searchPatientByAdmin";
	}
}
