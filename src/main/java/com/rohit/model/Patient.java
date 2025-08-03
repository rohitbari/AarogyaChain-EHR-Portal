package com.rohit.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Patient {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pid;
	private String p_name;
	
	@Temporal(TemporalType.DATE)	//tells Hibernate: Store only the date part in the DB column dob, ignore time.
	private Date p_dob;
	@Column(unique = true, nullable = false)
	private String p_aadhar;
	private String p_address;
	private String p_contact;
	
	
	
	public Patient() {
		super();
	}
	
	
	public Patient(int pid, String p_name, Date p_dob, String p_aadhar, String p_address, String p_contact) {
		super();
		this.pid = pid;
		this.p_name = p_name;
		this.p_dob = p_dob;
		this.p_aadhar = p_aadhar;
		this.p_address = p_address;
		this.p_contact = p_contact;
	}


	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public Date getP_dob() {
		return p_dob;
	}
	public void setP_dob(Date p_dob) {
		this.p_dob = p_dob;
	}
	public String getP_aadhar() {
		return p_aadhar;
	}
	public void setP_aadhar(String p_aadhar) {
		this.p_aadhar = p_aadhar;
	}
	public String getP_address() {
		return p_address;
	}
	public void setP_address(String p_address) {
		this.p_address = p_address;
	}
	public String getP_contact() {
		return p_contact;
	}
	public void setP_contact(String p_contact) {
		this.p_contact = p_contact;
	}
	
	
	@Override
	public String toString() {
		return "Patient [pid=" + pid + ", p_name=" + p_name + ", p_dob=" + p_dob + ", p_aadhar=" + p_aadhar
				+ ", p_address=" + p_address + ", p_contact=" + p_contact + "]";
	}
	
	
	
	
}
