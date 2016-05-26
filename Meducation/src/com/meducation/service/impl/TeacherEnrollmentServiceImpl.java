package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.TeacherEnrollmentDao;
import com.meducation.ORM.AgencyCourse;
import com.meducation.ORM.Person;
import com.meducation.ORM.SchoolAgency;
import com.meducation.ORM.ScoresRecord;
import com.meducation.ORM.SelectedItems;
import com.meducation.ORM.TeacherEnrollment;
import com.meducation.ORM.User;
import com.meducation.service.TeacherEnrollmentService;

@Service("teacherenrollmentservice")
@Transactional
@RemoteProxy(name = "teacherenrollmentservice")
public class TeacherEnrollmentServiceImpl implements TeacherEnrollmentService {
	@Resource
	private TeacherEnrollmentDao teacherenrollmentdao;

	@Override
	public String saveOrUpdateData(TeacherEnrollment teacherenrollment) {
		teacherenrollmentdao.saveOrUpdate(teacherenrollment);
		return null;

	}

	@Override
	public void delData(Integer id) {
		teacherenrollmentdao.delById(id);

	}

	@Override
	public TeacherEnrollment findById(Integer id) {
		return (TeacherEnrollment) teacherenrollmentdao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TeacherEnrollment> findAllInfo() {
		return teacherenrollmentdao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TeacherEnrollment> findInfoByQuery(String qe) {
		return teacherenrollmentdao.query(qe);
	}

	@Override
	public int countAll() {
		return teacherenrollmentdao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TeacherEnrollment> browseAll(int pageNo, int pageSize) {
		return teacherenrollmentdao.listAll(pageNo, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	@RemoteMethod
	public String saveData(SelectedItems selectedItems) {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String PlanId = (String) ServletActionContext.getRequest().getSession()
				.getAttribute("G_PlanId");
		String SchoolId = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("G_SchoolId");
		String AgencyId = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("G_AgencyId");

		List<SchoolAgency> SchoolAgency_list = teacherenrollmentdao
				.queryByString("from SchoolAgency where planId='" + PlanId
						+ "' and agencyId='" + AgencyId + "' and schoolId='"
						+ SchoolId + "'");
		SchoolAgency schoolAgency = SchoolAgency_list.get(0);

		List<AgencyCourse> AgencyCourse_list = teacherenrollmentdao
				.queryByString("from AgencyCourse where planId='" + PlanId
						+ "' and agencyId='" + AgencyId + "'");

		String[] list = selectedItems.getItems();
		for (int i = 0; i < list.length; i++) {
			for (int j = 0; j < AgencyCourse_list.size(); j++) {

				if (list[i].equalsIgnoreCase(Integer.toString(AgencyCourse_list
						.get(j).getId()))) {

					if (teacherenrollmentdao.queryByString(
							"from TeacherEnrollment t where t.teacherIdentifyNum='"
									+ person.getIdentifyNum()
									+ "' and t.courseId='"
									+ AgencyCourse_list.get(j).getCourseId()
									+ "'").size() == 0) {
						TeacherEnrollment teacherEnrollment = new TeacherEnrollment();
						teacherEnrollment.setPlanId(AgencyCourse_list.get(j)
								.getPlanId());
						teacherEnrollment.setPlanName(AgencyCourse_list.get(j)
								.getPlanName());
						teacherEnrollment.setPlanCode(AgencyCourse_list.get(j)
								.getPlanCode());
						teacherEnrollment.setAgencyId(AgencyCourse_list.get(j)
								.getAgencyId());
						teacherEnrollment.setAgencyName(AgencyCourse_list
								.get(j).getAgencyName());
						teacherEnrollment.setAgencyCode(AgencyCourse_list
								.get(j).getAgencyCode());
						teacherEnrollment.setSchoolId(schoolAgency
								.getSchoolId());
						teacherEnrollment.setSchoolName(schoolAgency
								.getSchoolName());
						teacherEnrollment.setSchoolCode(schoolAgency
								.getSchoolCode());
						teacherEnrollment.setTeacherId(Integer.toString(person
								.getId()));
						teacherEnrollment.setTeacherRealName(person
								.getRealName());
						teacherEnrollment.setTeacherIdentifyNum(person
								.getIdentifyNum());
						teacherEnrollment.setCourseId(AgencyCourse_list.get(j)
								.getCourseId());
						teacherEnrollment.setCourseName(AgencyCourse_list
								.get(j).getCourseName());
						teacherEnrollment.setCourseContant(AgencyCourse_list
								.get(j).getCourseContant());
						teacherEnrollment.setCourseCode(AgencyCourse_list
								.get(j).getCourseCode());
						teacherEnrollment.setCourseBeginTime(AgencyCourse_list
								.get(j).getCourseBeginTime());
						teacherEnrollment.setCourseEndTime(AgencyCourse_list
								.get(j).getCourseEndTime());
						teacherEnrollment.setCourseTeacher(AgencyCourse_list
								.get(j).getCourseTeacher());
						teacherEnrollment.setCoursePlace(AgencyCourse_list.get(
								j).getCoursePlace());
						teacherEnrollment.setCourseSubject(AgencyCourse_list
								.get(j).getCourseSubject());
						teacherEnrollment.setCourseScore("无");
						teacherEnrollment.setStatus("报名成功");
						teacherenrollmentdao.saveOrUpdate(teacherEnrollment);
					}
					break;

				}
			}

		}

		return "ture";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TeacherEnrollment> findInfoByPage(String qe, int pageNo,
			int pageSize) {
		return teacherenrollmentdao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return teacherenrollmentdao.countQuery(hql);
	}

	@Override
	@RemoteMethod
	public String saveScores(ScoresRecord scoresRecord) {
		List<User> list = scoresRecord.getItems();
		for (int i = 0; i < list.size(); i++) {
			User jing = list.get(i);
			teacherenrollmentdao
					.update("update TeacherEnrollment set status='结课', courseScore='"
							+ jing.getPassword().trim()
							+ "' where id="
							+ jing.getLogin_name().substring(3).trim());
		}
		return "ture";

	}

}
