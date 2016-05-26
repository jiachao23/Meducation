package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.SchoolDao;
import com.meducation.ORM.School;
import com.meducation.util.MyBaseDaoSupport;

@Component("schooldao")
public class SchoolDaoImpl extends MyBaseDaoSupport<School> implements
		SchoolDao {

}
