package com.rohit.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.rohit.model.HealthRecord;

@Component
public class HealthRecordDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	// add HealthRecord
	@Transactional
	public int addHealthRecord(HealthRecord record) {
		int i = (Integer) hibernateTemplate.save(record);
		return i;
	}

	// delete HealthRecord
	@Transactional
	public void deleteHealthRecord(int hr_id) {
		HealthRecord record = hibernateTemplate.get(HealthRecord.class, hr_id);
		hibernateTemplate.delete(record);
	}

	// update HealthRecord
	@Transactional
	public void updateHealthRecord(HealthRecord record) {
		hibernateTemplate.update(record);
	}

	// get one HealthRecord
	public HealthRecord getHealthRecord(int hr_id) {
		return hibernateTemplate.get(HealthRecord.class, hr_id);
	}

	// get all HealthRecords
	public List<HealthRecord> getAllHealthRecords() {
		return hibernateTemplate.loadAll(HealthRecord.class);
	}
	
	// get all healthrecords by patient id
	public List<HealthRecord> getRecordsByPatientId(int pid) {
	    String hql = "FROM HealthRecord hr WHERE hr.patient.id = :pid";
	    return (List<HealthRecord>) hibernateTemplate.findByNamedParam(hql, "pid", pid);
	}


}
