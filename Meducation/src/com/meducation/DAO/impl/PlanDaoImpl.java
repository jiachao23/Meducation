package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.PlanDao;
import com.meducation.ORM.TrainingPlan;
import com.meducation.util.MyBaseDaoSupport;

@Component("plandao")
public class PlanDaoImpl extends MyBaseDaoSupport<TrainingPlan>
		implements
			PlanDao {

}
