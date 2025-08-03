package com.rohit.controller;

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

import com.rohit.dao.HealthRecordDao;
import com.rohit.dao.PatientDao;
import com.rohit.model.HealthRecord;
import com.rohit.model.Patient;

@Controller
public class PatientController {
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Patient patient = (Patient) context.getBean("patient");
	PatientDao patientDao = (PatientDao) context.getBean("patientDao");

	HealthRecord healthRecord = (HealthRecord) context.getBean("healthRecord");
	HealthRecordDao healthRecordDao = (HealthRecordDao) context.getBean("healthRecordDao");

	// Show patient Login Page (GET request)
	@RequestMapping(path = "/patientLogin")
	public String openPatientLoginPage() {
		return "patientLogin";
	}

	// login admin
	@RequestMapping(path = "/PatientLogin", method = RequestMethod.POST)
	public String adminLogin(HttpServletRequest request, HttpSession session) {
		String p_aadhar = request.getParameter("p_aadhar");
		String p_dob = request.getParameter("p_dob");

		// Convert string to java.util.Date
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date inputDob = null;
		try {
			inputDob = sdf.parse(p_dob);
		} catch (Exception e) {
			e.printStackTrace();
			return "patientLogin"; // Invalid date format
		}

		List<Patient> allPatients = patientDao.getAllPatients();
		for (Patient p : allPatients) {
			if (p.getP_aadhar().equals(p_aadhar) && p.getP_dob().equals(inputDob)) {
				session.setAttribute("p_id", p.getPid());
				session.setAttribute("patient", p);

				System.out.println("Patient Login...!!");
				return "redirect:/viewOwnDetailsByPatient";
			}
		}
		System.err.println("Failed to Login...!!");
		return "patientLogin";
	}

	// show Patient own Health Record
	@RequestMapping("/viewOwnDetailsByPatient")
	public String viewOwnDetailsByPatient(Model m, HttpServletRequest request, HttpSession session) {
		int patient_id = (Integer) request.getSession().getAttribute("p_id");
		Patient p = patientDao.getPatient(patient_id);

		List<HealthRecord> healthRecords = healthRecordDao.getRecordsByPatientId(patient_id);
		m.addAttribute("patient", p);
		m.addAttribute("healthRecords", healthRecords);

		return "viewOwnDetailsByPatient";
	}

}
