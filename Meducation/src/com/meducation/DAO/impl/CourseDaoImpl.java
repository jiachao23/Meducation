package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.CourseDao;
import com.meducation.ORM.Course;
import com.meducation.util.MyBaseDaoSupport;

@Component("coursedao")
public class CourseDaoImpl extends MyBaseDaoSupport<Course> implements
		CourseDao {

}
