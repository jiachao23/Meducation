package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.SchoolAgencyDao;
import com.meducation.ORM.SchoolAgency;
import com.meducation.util.MyBaseDaoSupport;

@Component("schoolAgencyDao")
public class SchoolAgencyDaoImpl extends MyBaseDaoSupport<SchoolAgency>
		implements
			SchoolAgencyDao {

}
