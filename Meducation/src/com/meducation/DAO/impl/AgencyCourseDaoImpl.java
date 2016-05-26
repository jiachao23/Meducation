package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.AgencyCourseDao;
import com.meducation.ORM.AgencyCourse;
import com.meducation.util.MyBaseDaoSupport;

@Component("agencyCourseDao")
public class AgencyCourseDaoImpl extends MyBaseDaoSupport<AgencyCourse>
		implements
			AgencyCourseDao {

}
