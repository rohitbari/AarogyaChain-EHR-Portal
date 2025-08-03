package com.rohit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Doctor {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int did;
	private String d_name;
	@Column(unique = true, nullable = false)
	private String d_email;
	private String d_password;
	private String d_specialization;
	private String d_contact;
	
	
	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Doctor(int did, String d_name, String d_email, String d_password, String d_specialization,
			String d_contact) {
		super();
		this.did = did;
		this.d_name = d_name;
		this.d_email = d_email;
		this.d_password = d_password;
		this.d_specialization = d_specialization;
		this.d_contact = d_contact;
	}


	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_email() {
		return d_email;
	}
	public void setD_email(String d_email) {
		this.d_email = d_email;
	}
	public String getD_password() {
		return d_password;
	}
	public void setD_password(String d_password) {
		this.d_password = d_password;
	}
	public String getD_specialization() {
		return d_specialization;
	}
	public void setD_specialization(String d_specialization) {
		this.d_specialization = d_specialization;
	}
	public String getD_contact() {
		return d_contact;
	}
	public void setD_contact(String d_contact) {
		this.d_contact = d_contact;
	}


	@Override
	public String toString() {
		return "Doctor [did=" + did + ", d_name=" + d_name + ", d_email=" + d_email + ", d_password=" + d_password
				+ ", d_specialization=" + d_specialization + ", d_contact=" + d_contact + "]";
	}
	
	
	
}
