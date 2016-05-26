package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.TeacherEnrollmentDao;
import com.meducation.ORM.TeacherEnrollment;
import com.meducation.util.MyBaseDaoSupport;

@Component("teacherenrollmentdao")
public class TeacherEnrollmentDaoImpl extends
		MyBaseDaoSupport<TeacherEnrollment> implements TeacherEnrollmentDao {

}
