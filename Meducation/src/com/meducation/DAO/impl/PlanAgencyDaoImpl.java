package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.PlanAgencyDao;
import com.meducation.ORM.PlanAgency;
import com.meducation.util.MyBaseDaoSupport;

@Component("planagencydao")
public class PlanAgencyDaoImpl extends MyBaseDaoSupport<PlanAgency>
		implements
			PlanAgencyDao {

}
