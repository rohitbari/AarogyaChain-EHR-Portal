package com.rohit.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.rohit.model.Pharmacist;

@Component
public class PharmacistDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	// add Pharmacist
	@Transactional
	public int addPharmacist(Pharmacist pharmacist) {
		int i = (Integer) hibernateTemplate.save(pharmacist);
		return i;
	}

	// delete Pharmacist
	@Transactional
	public void deletePharmacist(int ph_id) {
		Pharmacist pharmacist = hibernateTemplate.get(Pharmacist.class, ph_id);
		hibernateTemplate.delete(pharmacist);
	}

	// update Pharmacist
	@Transactional
	public void updatePharmacist(Pharmacist pharmacist) {
		hibernateTemplate.update(pharmacist);
	}

	// get one pharmacist
	public Pharmacist getPharmacist(int ph_id) {
		return hibernateTemplate.get(Pharmacist.class, ph_id);
	}

	// get all pharmacists
	public List<Pharmacist> getAllPharmacists() {
		return hibernateTemplate.loadAll(Pharmacist.class);
	}
}
