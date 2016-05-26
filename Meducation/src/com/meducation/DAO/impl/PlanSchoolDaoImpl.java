package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.PlanSchoolDao;
import com.meducation.ORM.PlanSchool;
import com.meducation.util.MyBaseDaoSupport;

@Component("planschooldao")
public class PlanSchoolDaoImpl extends MyBaseDaoSupport<PlanSchool> implements
		PlanSchoolDao {

}
