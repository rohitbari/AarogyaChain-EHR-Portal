package com.rohit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Pharmacist {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int ph_id;
	private String ph_name;
	@Column(unique = true, nullable = false)
	private String ph_email;
	private String ph_password;
	private String ph_contact;
	
	
	public Pharmacist() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Pharmacist(int ph_id, String ph_name, String ph_email, String ph_password, String ph_contact) {
		super();
		this.ph_id = ph_id;
		this.ph_name = ph_name;
		this.ph_email = ph_email;
		this.ph_password = ph_password;
		this.ph_contact = ph_contact;
	}


	public int getPh_id() {
		return ph_id;
	}


	public void setPh_id(int ph_id) {
		this.ph_id = ph_id;
	}


	public String getPh_name() {
		return ph_name;
	}


	public void setPh_name(String ph_name) {
		this.ph_name = ph_name;
	}


	public String getPh_email() {
		return ph_email;
	}


	public void setPh_email(String ph_email) {
		this.ph_email = ph_email;
	}


	public String getPh_password() {
		return ph_password;
	}


	public void setPh_password(String ph_password) {
		this.ph_password = ph_password;
	}


	public String getPh_contact() {
		return ph_contact;
	}


	public void setPh_contact(String ph_contact) {
		this.ph_contact = ph_contact;
	}


	@Override
	public String toString() {
		return "Pharmacist [ph_id=" + ph_id + ", ph_name=" + ph_name + ", ph_email=" + ph_email + ", ph_password="
				+ ph_password + ", ph_contact=" + ph_contact + "]";
	}
	
	
}
