package com.rohit.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.rohit.model.Doctor;

@Component
public class DoctorDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	// add doctor
	@Transactional
	public int addDoctor(Doctor doctor) {
		int i = (Integer) hibernateTemplate.save(doctor);
		return i;
	}

	// delete doctor
	@Transactional
	public void deleteDoctor(int did) {
		Doctor doctor = hibernateTemplate.get(Doctor.class, did);
		hibernateTemplate.delete(doctor);
	}

	// update doctor
	@Transactional
	public void updateDoctor(Doctor doctor) {
		hibernateTemplate.update(doctor);
	}

	// get one doctor
	public Doctor getDoctor(int did) {
		return hibernateTemplate.get(Doctor.class, did);
	}
	
//	public Doctor getDoctorByEmailPassword(String email, String password){
//		return hibernateTemplate.get
//	}

	// get all doctors
	public List<Doctor> getAllDoctors() {
		return hibernateTemplate.loadAll(Doctor.class);
	}
}
