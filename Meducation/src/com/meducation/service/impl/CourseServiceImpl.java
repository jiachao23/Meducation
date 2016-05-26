package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.CourseDao;
import com.meducation.DAO.TrainingAgencyDao;
import com.meducation.ORM.Course;
import com.meducation.ORM.Person;
import com.meducation.ORM.TrainingAgency;
import com.meducation.service.CourseService;

@Service("courseservice")
@Transactional
@RemoteProxy(name = "courseservice")
public class CourseServiceImpl implements CourseService {
	@Resource
	private CourseDao coursedao;
	@Resource
	private TrainingAgencyDao trainingagencydao;

	@Override
	public String saveOrUpdateData(Course course) {
		String hql = "update Course t set t.courseName='"
				+ course.getCourseName() + "', t.courseContant='"
				+ course.getCourseContant() + "', t.courseSubject='"
				+ course.getCourseSubject() + "', t.courseNum='"
				+ course.getCourseNum() + "', t.courseTeacher='"
				+ course.getCourseTeacher() + "', t.coursePlace='"
				+ course.getCoursePlace() + "', t.courseBeginTime='"
				+ course.getCourseBeginTime() + "', t.courseEndTime='"
				+ course.getCourseEndTime() + "' where t.id=" + course.getId();
		coursedao.update(hql);
		return "true";

	}

	@Override
	public void delData(Integer id) {
		coursedao.delById(id);

	}

	@Override
	public Course findById(Integer id) {
		return (Course) coursedao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Course> findAllInfo() {
		return coursedao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Course> findInfoByQuery(String qe) {
		return coursedao.query(qe);
	}

	@Override
	public int countAll() {
		return coursedao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Course> browseAll(int pageNo, int pageSize) {
		return coursedao.listAll(pageNo, pageSize);
	}

	@Override
	public String saveData(Course course) {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		TrainingAgency trainingAgency = (TrainingAgency) trainingagencydao
				.loadObject("from TrainingAgency where agenceName='"
						+ person.getWorkPlace() + "'");
		course.setAgencyId(Integer.toString(trainingAgency.getId()));
		course.setAgencyName(trainingAgency.getAgenceName());
		course.setAgencyCode(trainingAgency.getAgenceCode());
		coursedao.saveOrUpdate(course);
		return "ture";
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Course> findInfoByPage(String qe, int pageNo, int pageSize) {
		return coursedao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return coursedao.countQuery(hql);
	}

}
