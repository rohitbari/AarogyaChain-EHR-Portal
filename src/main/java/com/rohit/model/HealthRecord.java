package com.rohit.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Component;

@Entity
@Component
public class HealthRecord {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int hr_id;
	
	@ManyToOne
	@JoinColumn(name = "doctor_id", nullable = false)
	private Doctor doctor;

	@ManyToOne
	@JoinColumn(name = "patient_id", nullable = false)
	private Patient patient;

	@Temporal(TemporalType.DATE)
	private Date hr_date;
	private String diagnosis;
	private String prescription;
	private String notes;
	
	
	public HealthRecord() {
		super();
		// TODO Auto-generated constructor stub
	}


	public HealthRecord(int hr_id, Doctor doctor, Patient patient, Date hr_date, String diagnosis, String prescription,
			String notes) {
		super();
		this.hr_id = hr_id;
		this.doctor = doctor;
		this.patient = patient;
		this.hr_date = hr_date;
		this.diagnosis = diagnosis;
		this.prescription = prescription;
		this.notes = notes;
	}


	public int getHr_id() {
		return hr_id;
	}


	public void setHr_id(int hr_id) {
		this.hr_id = hr_id;
	}


	public Doctor getDoctor() {
		return doctor;
	}


	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}


	public Patient getPatient() {
		return patient;
	}


	public void setPatient(Patient patient) {
		this.patient = patient;
	}


	public Date getHr_date() {
		return hr_date;
	}


	public void setHr_date(Date hr_date) {
		this.hr_date = hr_date;
	}


	public String getDiagnosis() {
		return diagnosis;
	}


	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}


	public String getPrescription() {
		return prescription;
	}


	public void setPrescription(String prescription) {
		this.prescription = prescription;
	}


	public String getNotes() {
		return notes;
	}


	public void setNotes(String notes) {
		this.notes = notes;
	}


	@Override
	public String toString() {
		return "HealthRecord [hr_id=" + hr_id + ", doctor=" + doctor + ", patient=" + patient + ", hr_date=" + hr_date
				+ ", diagnosis=" + diagnosis + ", prescription=" + prescription + ", notes=" + notes + "]";
	}
	
	
}
