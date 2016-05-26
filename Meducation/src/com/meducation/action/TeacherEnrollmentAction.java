package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.meducation.ORM.PageList;
import com.meducation.ORM.Person;
import com.meducation.ORM.TeacherEnrollment;
import com.meducation.service.TeacherEnrollmentService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherEnrollmentAction extends ActionSupport
		implements
			ModelDriven<TeacherEnrollment> {

	private static final long serialVersionUID = 1L;

	@Resource
	TeacherEnrollmentService teacherenrollmentservice;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 20;
	List<TeacherEnrollment> memberList;

	private TeacherEnrollment model = new TeacherEnrollment();// ���ڷ�װ��Ա����ģ��
	public TeacherEnrollment getModel() {
		return model;
	}

	@Action(value = "/TeacherEnrollment_browser", results = {@Result(name = "success", location = "/WEB-INF/school/TeacherCourseQuery.jsp")})
	public String browser() {
		Page();
		return SUCCESS;
	}

	public void Page() {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");

		String sql = "t.teacherIdentifyNum='" + person.getIdentifyNum().trim()
				+ "'";
		queryComponent(sql);
	}

	public void queryComponent(String sql) {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		count = teacherenrollmentservice.countByquery(sql);
		memberList = teacherenrollmentservice.findInfoByPage(sql, pageNo,
				pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	public void processcharset() throws UnsupportedEncodingException {
		if (!model.getPlanName().isEmpty())
			model.setPlanName(new String(model.getPlanName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getAgencyName().isEmpty())
			model.setAgencyName(new String(model.getAgencyName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getCourseName().isEmpty())
			model.setCourseName(new String(model.getCourseName().getBytes(
					"iso-8859-1"), "UTF-8"));
	}

	@Action(value = "/TeacherEnrollment_query", results = {@Result(name = "success", location = "/WEB-INF/school/TeacherCourseQuery.jsp")})
	public String query() throws UnsupportedEncodingException {
		querysub();
		return SUCCESS;
	}

	public void querysub() {
		try {
			processcharset();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.teacherIdentifyNum='" + person.getIdentifyNum().trim()
				+ "'";
		if (!model.getPlanName().isEmpty())
			sql = sql + " and t.planName like '%" + model.getPlanName() + "%'";
		if (!model.getAgencyName().isEmpty())
			sql = sql + " and t.agencyName like '%" + model.getAgencyName()
					+ "%'";
		if (!model.getCourseName().isEmpty())
			sql = sql + " and t.courseName like '%" + model.getCourseName()
					+ "%'";

		queryComponent(sql);
	}

	@Action(value = "/TeacherEnrollment_querydel", results = {@Result(name = "success", location = "/WEB-INF/school/TeacherCourseQuery.jsp")})
	public String querydel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		teacherenrollmentservice.delData(id);
		querysub();
		return SUCCESS;
	}

	@Action(value = "/TeacherEnrollment_score", results = {@Result(name = "success", location = "/WEB-INF/agency/ScoreRecord.jsp")})
	public String score() throws UnsupportedEncodingException {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			String page = ServletActionContext.getRequest()
					.getParameter("page").trim();
			ServletActionContext.getRequest().getSession()
					.setAttribute("firstlevel_page", page);
		}
		if (ServletActionContext.getRequest().getParameter("AgencyId") != null) {
			String AgencyId = ServletActionContext.getRequest()
					.getParameter("AgencyId").trim();
			ServletActionContext.getRequest().getSession()
					.setAttribute("G_AgencyId", AgencyId);
		}
		if (ServletActionContext.getRequest().getParameter("CourseId") != null) {
			String CourseId = ServletActionContext.getRequest()
					.getParameter("CourseId").trim();
			ServletActionContext.getRequest().getSession()
					.setAttribute("G_CourseId", CourseId);
		}

		String sql = "t.agencyId='"
				+ ServletActionContext.getRequest().getParameter("AgencyId")
						.trim() + "' and t.courseId='"
				+ ServletActionContext.getRequest().getParameter("CourseId")
				+ "'";
		queryComponent(sql);
		return SUCCESS;
	}

	@Action(value = "/TeacherEnrollment_scoreQuery", results = {@Result(name = "success", location = "/WEB-INF/agency/ScoreRecord.jsp")})
	public String scoreQuery() throws UnsupportedEncodingException {
		if (!model.getSchoolName().isEmpty())
			model.setSchoolName(new String(model.getSchoolName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getTeacherRealName().isEmpty())
			model.setTeacherRealName(new String(model.getTeacherRealName()
					.getBytes("iso-8859-1"), "UTF-8"));
		if (!model.getTeacherIdentifyNum().isEmpty())
			model.setTeacherIdentifyNum(new String(model
					.getTeacherIdentifyNum().getBytes("iso-8859-1"), "UTF-8"));

		String sql = "t.agencyId='"
				+ ServletActionContext.getRequest().getParameter("AgencyId")
						.trim() + "' and t.courseId='"
				+ ServletActionContext.getRequest().getParameter("CourseId")
				+ "'";

		if (!model.getSchoolName().isEmpty())
			sql = sql + " and t.schoolName like '%" + model.getSchoolName()
					+ "%'";
		if (!model.getTeacherRealName().isEmpty())
			sql = sql + " and t.teacherRealName like '%"
					+ model.getTeacherRealName() + "%'";
		if (!model.getTeacherIdentifyNum().isEmpty())
			sql = sql + " and t.teacherIdentifyNum like '%"
					+ model.getTeacherIdentifyNum() + "%'";
		queryComponent(sql);
		return SUCCESS;
	}

	@Action(value = "/TeacherEnrollment_getScore", results = {@Result(name = "success", location = "/WEB-INF/agency/ScoreRecordQuery.jsp")})
	public String getScore() throws UnsupportedEncodingException {
		if (!model.getSchoolName().isEmpty())
			model.setSchoolName(new String(model.getSchoolName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getTeacherRealName().isEmpty())
			model.setTeacherRealName(new String(model.getTeacherRealName()
					.getBytes("iso-8859-1"), "UTF-8"));
		if (!model.getTeacherIdentifyNum().isEmpty())
			model.setTeacherIdentifyNum(new String(model
					.getTeacherIdentifyNum().getBytes("iso-8859-1"), "UTF-8"));
		if (!model.getCourseName().isEmpty())
			model.setCourseName(new String(model.getCourseName().getBytes(
					"iso-8859-1"), "UTF-8"));
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.agencyName='" + person.getWorkPlace() + "'";

		if (!model.getSchoolName().isEmpty())
			sql = sql + " and t.schoolName like '%" + model.getSchoolName()
					+ "%'";
		if (!model.getTeacherRealName().isEmpty())
			sql = sql + " and t.teacherRealName like '%"
					+ model.getTeacherRealName() + "%'";
		if (!model.getTeacherIdentifyNum().isEmpty())
			sql = sql + " and t.teacherIdentifyNum like '%"
					+ model.getTeacherIdentifyNum() + "%'";
		if (!model.getCourseName().isEmpty())
			sql = sql + " and t.courseName like '%" + model.getCourseName()
					+ "%'";

		queryComponent(sql);
		return SUCCESS;
	}

	@Action(value = "/TeacherEnrollment_EntergetScore", results = {@Result(name = "success", location = "/WEB-INF/agency/ScoreRecordQuery.jsp")})
	public String EntergetScore() throws UnsupportedEncodingException {

		return SUCCESS;
	}

	@Action(value = "/TeacherEnrollment_EntergetScoreTotle", results = {@Result(name = "success", location = "/WEB-INF/department/DepartmentCourseQuery.jsp")})
	public String EntergetScoreTotle() throws UnsupportedEncodingException {

		return SUCCESS;
	}

	@Action(value = "/TeacherEnrollment_getScoreTotle", results = {@Result(name = "success", location = "/WEB-INF/department/DepartmentCourseQuery.jsp")})
	public String getScoreTotle() throws UnsupportedEncodingException {
		if (!model.getSchoolName().isEmpty())
			model.setSchoolName(new String(model.getSchoolName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getTeacherRealName().isEmpty())
			model.setTeacherRealName(new String(model.getTeacherRealName()
					.getBytes("iso-8859-1"), "UTF-8"));
		if (!model.getTeacherIdentifyNum().isEmpty())
			model.setTeacherIdentifyNum(new String(model
					.getTeacherIdentifyNum().getBytes("iso-8859-1"), "UTF-8"));
		if (!model.getCourseName().isEmpty())
			model.setCourseName(new String(model.getCourseName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getPlanName().isEmpty())
			model.setPlanName(new String(model.getPlanName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getAgencyName().isEmpty())
			model.setAgencyName(new String(model.getAgencyName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getCourseBeginTime().isEmpty())
			model.setCourseBeginTime(new String(model.getCourseBeginTime()
					.getBytes("iso-8859-1"), "UTF-8"));
		if (!model.getCourseEndTime().isEmpty())
			model.setCourseEndTime(new String(model.getCourseEndTime()
					.getBytes("iso-8859-1"), "UTF-8"));

		String sql = "t.id<>0";

		if (!model.getSchoolName().isEmpty())
			sql = sql + " and t.schoolName like '%" + model.getSchoolName()
					+ "%'";
		if (!model.getTeacherRealName().isEmpty())
			sql = sql + " and t.teacherRealName like '%"
					+ model.getTeacherRealName() + "%'";
		if (!model.getTeacherIdentifyNum().isEmpty())
			sql = sql + " and t.teacherIdentifyNum like '%"
					+ model.getTeacherIdentifyNum() + "%'";
		if (!model.getCourseName().isEmpty())
			sql = sql + " and t.courseName like '%" + model.getCourseName()
					+ "%'";
		if (!model.getPlanName().isEmpty())
			sql = sql + " and t.planName like '%" + model.getPlanName() + "%'";
		if (!model.getAgencyName().isEmpty())
			sql = sql + " and t.agencyName like '%" + model.getAgencyName()
					+ "%'";
		if (!model.getCourseBeginTime().isEmpty())
			sql = sql + " and t.courseBeginTime>='"
					+ model.getCourseBeginTime() + "'";
		if (!model.getCourseEndTime().isEmpty())
			sql = sql + " and t.courseEndTime<='" + model.getCourseEndTime()
					+ "'";

		queryComponent(sql);
		return SUCCESS;
	}

}
