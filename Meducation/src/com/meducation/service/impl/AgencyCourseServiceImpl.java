package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.AgencyCourseDao;
import com.meducation.ORM.AgencyCourse;
import com.meducation.ORM.Course;
import com.meducation.ORM.Person;
import com.meducation.ORM.PlanAgency;
import com.meducation.ORM.SelectedItems;
import com.meducation.service.AgencyCourseService;

@Service("agencyCourseService")
@Transactional
@RemoteProxy(name = "agencyCourseService")
public class AgencyCourseServiceImpl implements AgencyCourseService {

	@Resource
	private AgencyCourseDao agencyCourseDao;

	@Override
	public String saveOrUpdateData(AgencyCourse agencyCourse) {

		agencyCourseDao.saveOrUpdate(agencyCourse);
		return "true";

	}

	@Override
	public void delData(Integer id) {
		agencyCourseDao.delById(id);

	}

	@Override
	public AgencyCourse findById(Integer id) {
		return (AgencyCourse) agencyCourseDao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AgencyCourse> findAllInfo() {
		return agencyCourseDao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AgencyCourse> findInfoByQuery(String qe) {
		return agencyCourseDao.query(qe);
	}

	@Override
	public int countAll() {
		return agencyCourseDao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AgencyCourse> browseAll(int pageNo, int pageSize) {
		return agencyCourseDao.listAll(pageNo, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	@RemoteMethod
	public String saveData(SelectedItems selectedItems) {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");

		String sql = "from PlanAgency where planId='"
				+ selectedItems.getPlanID() + "' and agencyName='"
				+ person.getWorkPlace() + "'";
		System.out.println(sql);

		List<PlanAgency> planAgency_list = agencyCourseDao
				.queryByString("from PlanAgency where planId='"
						+ selectedItems.getPlanID() + "' and agencyName='"
						+ person.getWorkPlace() + "'");

		PlanAgency planAgency = planAgency_list.get(0);

		String[] list = selectedItems.getItems();
		Course course;
		for (int i = 0; i < list.length; i++) {
			AgencyCourse agencyCourse = new AgencyCourse();
			course = (Course) agencyCourseDao.queryByString(
					"from Course where id=" + list[i] + "").get(0);
			String hql = "from AgencyCourse t where";
			hql = hql + " t.planId='" + planAgency.getPlanId() + "'";
			hql = hql + " and t.agencyId='" + planAgency.getAgencyId() + "'";
			hql = hql + " and t.courseId='" + list[i] + "'";

			if (agencyCourseDao.queryByString(hql).size() == 0) {
				agencyCourse.setPlanId(planAgency.getPlanId());
				agencyCourse.setPlanName(planAgency.getPlanName());
				agencyCourse.setPlanCode(planAgency.getPlanNum());
				agencyCourse.setAgencyId(planAgency.getAgencyId());
				agencyCourse.setAgencyName(planAgency.getAgencyName());
				agencyCourse.setAgencyCode(planAgency.getAgencyCode());
				agencyCourse.setCourseId(list[i]);
				agencyCourse.setCourseName(course.getCourseName());
				agencyCourse.setCourseCode(course.getCourseNum());
				agencyCourse.setCourseContant(course.getCourseContant());
				agencyCourse.setCourseSubject(course.getCourseSubject());
				agencyCourse.setCourseBeginTime(course.getCourseBeginTime());
				agencyCourse.setCourseEndTime(course.getCourseEndTime());
				agencyCourse.setCourseTeacher(course.getCourseTeacher());
				agencyCourse.setCoursePlace(course.getCoursePlace());
				agencyCourse.setStatus("拟定课程阶段");
				agencyCourseDao.saveOrUpdate(agencyCourse);
			}
		}

		return "ture";
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<AgencyCourse> findInfoByPage(String qe, int pageNo, int pageSize) {
		return agencyCourseDao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return agencyCourseDao.countQuery(hql);
	}

	@Override
	public int updata(String hql) {
		return agencyCourseDao.update(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> find(String qe, int pageNo, int pageSize) {
		return agencyCourseDao.queryByHql(qe, pageNo, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> queryByString(String hql) {
		return agencyCourseDao.queryByString(hql);
	}
}
