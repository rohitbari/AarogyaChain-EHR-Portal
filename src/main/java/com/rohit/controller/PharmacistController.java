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

import com.rohit.dao.HealthRecordDao;
import com.rohit.dao.PatientDao;
import com.rohit.dao.PharmacistDao;
import com.rohit.model.Doctor;
import com.rohit.model.HealthRecord;
import com.rohit.model.Patient;
import com.rohit.model.Pharmacist;

@Controller
public class PharmacistController {
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");

	Pharmacist pharmacist = (Pharmacist) context.getBean("pharmacist");
	PharmacistDao pharmacistDao = (PharmacistDao) context.getBean("pharmacistDao");

	Patient patient = (Patient) context.getBean("patient");
	PatientDao patientDao = (PatientDao) context.getBean("patientDao");

	HealthRecord healthRecord = (HealthRecord) context.getBean("healthRecord");
	HealthRecordDao healthRecordDao = (HealthRecordDao) context.getBean("healthRecordDao");

	// Show Pharmacist Login Page (GET request)
	@RequestMapping(path = "/pharmacistLogin")
	public String openPharmacistLoginPage() {
		return "pharmacistLogin";
	}
	
	// Show Pharmacist Dashboard Page (GET request)
		@RequestMapping(path = "/pharmacistDashboard")
		public String openPharmacistDashboardPage() {
			return "pharmacistDashboard";
		}

	// login Pharmacist
	@RequestMapping(path = "/PharmacistLogin", method = RequestMethod.POST)
	public String doctorLogin(HttpServletRequest request, HttpSession session) {
		String ph_email = request.getParameter("ph_email");
		String ph_password = request.getParameter("ph_password");

		List<Pharmacist> allPharmacists = pharmacistDao.getAllPharmacists();
		for (Pharmacist ph : allPharmacists) {
			if (ph.getPh_email().equals(ph_email) && ph.getPh_password().equals(ph_password)) {
				System.out.println("Pharmacist Login...!!");

				session = request.getSession();
				session.setAttribute("pharmacist_id", ph.getPh_id());
				session.setAttribute("pharmacist", ph);

				return "pharmacistDashboard";
			}
		}
		System.err.println("Failed to Login or Pharmacist not found..!!");
		return "pharmacistLogin";
	}

	// open change Pharmacist password page
	@RequestMapping(path = "/changePharmacistPassword", method = RequestMethod.GET)
	public String openChangePharmacistPassword() {
		return "changePharmacistPassword";
	}

	// change doctor password
	@RequestMapping(path = "/ChangePharmacistPassword", method = RequestMethod.POST)
	public String changePharmacistPassword(HttpServletRequest request, HttpSession session) {
		int ph_id = (Integer) request.getSession().getAttribute("pharmacist_id");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");

		Pharmacist ph = pharmacistDao.getPharmacist(ph_id);
		if (ph.getPh_password().equals(oldPassword) && newPassword.equals(confirmPassword)) {
			ph.setPh_password(newPassword);
			pharmacistDao.updatePharmacist(ph);
			System.out.println("Password changed succefully...!!");
			return "pharmacistLogin";
		} else {
			System.err.println("Incorrect OldPassword or New password not matched...!!");
			return "changePharmacistPassword";
		}

	}
	
	
	//viewPatientHealthRecordByPharmacist
		@RequestMapping("/viewHealthRecordsByPharmacist")
	    public String viewHealthRecordsByPharmacist(Model model, HttpServletRequest request) {
			
	        List<HealthRecord> healthRecords = healthRecordDao.getAllHealthRecords();
	        model.addAttribute("healthRecords", healthRecords);

	        return "viewHealthRecordsByPharmacist";
	    }
		
		
		// show search Patient By Pharmacist page
		@RequestMapping(path = "/searchPatientByPharmacist")
		public String openSearchPatientByPharmacistPage() {
			return "searchPatientByPharmacist";
		}

		// show search Patient By Pharmacist
		@RequestMapping("/submitSearchPatientByPharmacist")
		public String searchPatientByDoctor(Model m, HttpServletRequest request) {
			String p_aadhar = request.getParameter("p_aadhar");
			if (p_aadhar != null) {
				Patient p = patientDao.getPatientByAadhar(p_aadhar);
				List<HealthRecord> healthRecords = healthRecordDao.getRecordsByPatientId(p.getPid());
				m.addAttribute("patient", p);
				m.addAttribute("healthRecords", healthRecords);
			}
			return "searchPatientByPharmacist";
		}

}
