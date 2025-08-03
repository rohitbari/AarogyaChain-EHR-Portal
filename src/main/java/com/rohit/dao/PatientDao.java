package com.rohit.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.rohit.model.Patient;

@Component
public class PatientDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	// add patient
	@Transactional
	public int addPatient(Patient patient) {
		int i = (Integer) hibernateTemplate.save(patient);
		return i;
	}

	// delete Patient
	@Transactional
	public void deletePatient(int pid) {
		Patient patient = hibernateTemplate.get(Patient.class, pid);
		hibernateTemplate.delete(patient);
	}

	// update Patient
	@Transactional
	public void updatePatient(Patient patient) {
		hibernateTemplate.update(patient);
	}

	// get one Patient
	public Patient getPatient(int pid) {
		return hibernateTemplate.get(Patient.class, pid);
	}

	// get all doctors
	public List<Patient> getAllPatients() {
		return hibernateTemplate.loadAll(Patient.class);
	}

	// get Patient By Aadhar
	public Patient getPatientByAadhar(String aadhar) {
	    String hql = "FROM Patient WHERE p_aadhar = :aadhar";
	    List<Patient> list = (List<Patient>) hibernateTemplate.findByNamedParam(hql, "aadhar", aadhar);
	    return list.isEmpty() ? null : list.get(0);
	}


}
