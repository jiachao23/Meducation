package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.TrainingAgencyDao;
import com.meducation.ORM.TrainingAgency;
import com.meducation.util.MyBaseDaoSupport;

@Component("trainingagencydao")
public class TrainingAgencyDaoImpl extends MyBaseDaoSupport<TrainingAgency>
		implements TrainingAgencyDao {

}
