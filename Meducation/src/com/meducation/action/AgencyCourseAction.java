package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.meducation.ORM.AgencyCourse;
import com.meducation.ORM.PageList;
import com.meducation.ORM.Person;
import com.meducation.service.AgencyCourseService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("json-default")
public class AgencyCourseAction extends ActionSupport
		implements
			ModelDriven<AgencyCourse> {

	private static final long serialVersionUID = 1L;

	@Resource
	AgencyCourseService agencyCourseService;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 10;
	List<AgencyCourse> memberList;

	private String result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	private AgencyCourse model = new AgencyCourse();// ���ڷ�װ��Ա����ģ��
	public AgencyCourse getModel() {
		return model;
	}

	@Action(value = "/CourseChoose_look", results = {@Result(name = "success", location = "/WEB-INF/agency/CourseSee.jsp")})
	public String look() {
		query();
		setparam();
		return SUCCESS;

	}

	public void setparam() {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			String page = ServletActionContext.getRequest()
					.getParameter("page").trim();
			ServletActionContext.getRequest().getSession()
					.setAttribute("firstlevel_page", page);
		}
		if (ServletActionContext.getRequest().getParameter("Source") != null) {
			String Source = ServletActionContext.getRequest()
					.getParameter("Source").trim();
			ServletActionContext.getRequest().getSession()
					.setAttribute("Source", Source);
		}
		if (ServletActionContext.getRequest().getParameter("PlanId") != null) {
			String PlanId = ServletActionContext.getRequest()
					.getParameter("PlanId").trim();
			ServletActionContext.getRequest().getSession()
					.setAttribute("G_PlanId", PlanId);
		}
		if (ServletActionContext.getRequest().getParameter("SchoolId") != null) {
			String Source = ServletActionContext.getRequest()
					.getParameter("SchoolId").trim();
			ServletActionContext.getRequest().getSession()
					.setAttribute("G_SchoolId", Source);
		}
	}

	public void query() {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String planID = ServletActionContext.getRequest()
				.getParameter("PlanId").trim();
		String sql = "t.planId='" + planID + "' and t.agencyName='"
				+ person.getWorkPlace() + "'";
		queryComponent(sql);
	}

	public void queryComponent(String sql) {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		count = agencyCourseService.countByquery(sql);
		memberList = agencyCourseService.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/AgencyCourse_querydel", results = {@Result(name = "success", location = "/WEB-INF/agency/CourseSee.jsp")})
	public String querydel() {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		agencyCourseService.delData(id);
		query();
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_showAllAgencyAndCourse", results = {@Result(name = "success", location = "/WEB-INF/school/SchoolChooseAgency.jsp")})
	public String showAllAgencyAndCourse() {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			String page = ServletActionContext.getRequest()
					.getParameter("page").trim();
			ServletActionContext.getRequest().getSession()
					.setAttribute("firstlevel_page", page);
		}
		String Source = ServletActionContext.getRequest()
				.getParameter("SchoolId").trim();
		ServletActionContext.getRequest().getSession()
				.setAttribute("G_SchoolId", Source);
		String PlanId = ServletActionContext.getRequest()
				.getParameter("PlanId").trim();
		ServletActionContext.getRequest().getSession()
				.setAttribute("G_PlanId", PlanId);

		String planID = ServletActionContext.getRequest()
				.getParameter("PlanId").trim();
		String sql = "t.planId='" + planID + "'";

		queryComponent(sql);
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_AgencyName", results = {@Result(name = "success", type = "json", params = {
			"root", "result"})})
	public String AgencyName() {

		queryByString();
		return SUCCESS;
	}

	public void queryByString() {
		JSONArray ja = new JSONArray();
		List<Object[]> list = new ArrayList<Object[]>();
		list = agencyCourseService
				.queryByString("Select distinct t.agencyId,t.agencyName from AgencyCourse t");
		for (int i = 0; i < list.size(); i++) {
			Object[] object = (Object[]) list.get(i);
			JSONObject jo = new JSONObject();
			jo.element("id", object[0].toString());
			jo.element("agencyName", object[1].toString());
			ja.add(jo);
		}
		this.result = ja.toString();
	}

	@Action(value = "/PlanSchool_lookCourse", results = {@Result(name = "success", type = "chain", params = {
			"actionName", "PlanSchool_lookCourse2"})})
	public String lookCourse() {
		lookCourseComponent();
		return SUCCESS;
	}

	public void lookCourseComponent() {
		setparam();
		List<Object[]> schoolAgency_list = agencyCourseService
				.queryByString("select agencyId From SchoolAgency where planId='"
						+ ServletActionContext.getRequest()
								.getParameter("PlanId").trim()
						+ "' and schoolId='"
						+ ServletActionContext.getRequest().getParameter(
								"SchoolId") + "'");
		String sql = "t.agencyId='" + schoolAgency_list.get(0) + "'";
		queryComponent(sql);
	}

	@Action(value = "/PlanSchool_teacherlookCourse", results = {@Result(name = "success", type = "chain", params = {
			"actionName", "PlanSchool_teacherlookCourse2"})})
	public String teacherlookCourse() {
		lookCourseComponent();
		return SUCCESS;
	}

	@Action(value = "/AgencyCourse_courseBrowser", results = {@Result(name = "success", location = "/WEB-INF/agency/ScoreInfo.jsp")})
	public String courseBrowser() {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.agencyName='" + person.getWorkPlace()
				+ "' and t.status<>'培训结束'";
		queryComponent(sql);
		return SUCCESS;
	}

	@Action(value = "/AgencyCourse_courseQuery", results = {@Result(name = "success", location = "/WEB-INF/agency/ScoreInfo.jsp")})
	public String courseQuery() {
		try {
			processcharset();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.agencyName='" + person.getWorkPlace() + "'";
		if (!model.getPlanName().isEmpty())
			sql = sql + " and t.planName like '%" + model.getPlanName() + "%'";
		if (!model.getCourseName().isEmpty())
			sql = sql + " and t.courseName like '%" + model.getCourseName()
					+ "%'";

		queryComponent(sql);
		return SUCCESS;
	}

	public void processcharset() throws UnsupportedEncodingException {
		if (!model.getPlanName().isEmpty())
			model.setPlanName(new String(model.getPlanName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getCourseName().isEmpty())
			model.setCourseName(new String(model.getCourseName().getBytes(
					"iso-8859-1"), "UTF-8"));
	}

	@Action(value = "/AgencyCourse_historyQuery", results = {@Result(name = "success", location = "/WEB-INF/agency/CourseHistoryQuery.jsp")})
	public String historyQuery() {
		return SUCCESS;
	}

	@Action(value = "/AgencyCourse_historyQueryTotle", results = {@Result(name = "success", location = "/WEB-INF/department/DepartmentAgencyQuery.jsp")})
	public String historyQueryTotle() {
		return SUCCESS;
	}

	@Action(value = "/AgencyCourse_recordQueryTotle", results = {@Result(name = "success", location = "/WEB-INF/department/DepartmentAgencyQuery.jsp")})
	public String recordQueryTotle() {
		try {
			processcharset();
			if (!model.getCourseSubject().isEmpty())
				model.setCourseSubject(new String(model.getCourseSubject()
						.getBytes("iso-8859-1"), "UTF-8"));
			if (!model.getAgencyName().isEmpty())
				model.setAgencyName(new String(model.getAgencyName().getBytes(
						"iso-8859-1"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String sql = "t.id<>0";
		if (!model.getPlanName().isEmpty())
			sql = sql + " and t.planName like '%" + model.getPlanName() + "%'";
		if (!model.getCourseName().isEmpty())
			sql = sql + " and t.courseName like '%" + model.getCourseName()
					+ "%'";
		if (!model.getCourseSubject().isEmpty())
			sql = sql + " and t.courseSubject like '%"
					+ model.getCourseSubject() + "%'";
		if (!model.getAgencyName().isEmpty())
			sql = sql + " and t.agencyName like '%" + model.getAgencyName()
					+ "%'";
		queryComponent(sql);
		return SUCCESS;
	}

	@Action(value = "/AgencyCourse_recordQuery", results = {@Result(name = "success", location = "/WEB-INF/agency/CourseHistoryQuery.jsp")})
	public String recordQuery() {
		try {
			processcharset();
			if (!model.getCourseTeacher().isEmpty())
				model.setCourseTeacher(new String(model.getCourseTeacher()
						.getBytes("iso-8859-1"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.agencyName='" + person.getWorkPlace() + "'";
		if (!model.getPlanName().isEmpty())
			sql = sql + " and t.planName like '%" + model.getPlanName() + "%'";
		if (!model.getCourseName().isEmpty())
			sql = sql + " and t.courseName like '%" + model.getCourseName()
					+ "%'";
		if (!model.getCourseTeacher().isEmpty())
			sql = sql + " and t.courseTeacher like '%"
					+ model.getCourseTeacher() + "%'";
		queryComponent(sql);
		return SUCCESS;
	}

}
