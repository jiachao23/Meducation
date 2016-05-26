package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.meducation.ORM.PageList;
import com.meducation.ORM.Person;
import com.meducation.ORM.PlanSchool;
import com.meducation.service.PlanSchoolService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PlanSchoolAction extends ActionSupport
		implements
			ModelDriven<PlanSchool> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	PlanSchoolService planschoolservice;

	private PlanSchool model = new PlanSchool();// ���ڷ�װ��Ա����ģ��
	public PlanSchool getModel() {
		return model;
	}
	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 40;
	List<PlanSchool> memberList;

	public void query() {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		String planID = ServletActionContext.getRequest()
				.getParameter("PlanId").trim();
		String sql = "t.planId='" + planID + "'";
		getPageList(sql);
	}

	@Action(value = "/PlanSchool_look", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanSchoolQuery.jsp")})
	public String look() throws UnsupportedEncodingException {
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
		String Source = ServletActionContext.getRequest()
				.getParameter("Source").trim();
		ServletActionContext.getRequest().getSession()
				.setAttribute("Source", Source);
		String PlanId = ServletActionContext.getRequest()
				.getParameter("PlanId").trim();
		ServletActionContext.getRequest().getSession()
				.setAttribute("G_PlanId", PlanId);
	}

	@Action(value = "/PlanSchool_querydel", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanSchoolQuery.jsp")})
	public String querydel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		planschoolservice.delData(id);
		query();
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_browser", results = {@Result(name = "success", location = "/WEB-INF/school/PlanSchool.jsp")})
	public String browser() throws UnsupportedEncodingException {
		PlanSchool_query();
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_teacherbrowser", results = {@Result(name = "success", location = "/WEB-INF/school/PlanSchoolQuery.jsp")})
	public String teacherbrowser() throws UnsupportedEncodingException {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.schoolName='" + person.getWorkPlace()
				+ "' and t.status='正在报名'";
		getPageList(sql);
		return SUCCESS;
	}

	public void PlanSchool_query() {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.schoolName='" + person.getWorkPlace()
				+ "' and t.status<>'计划创建' and status<>'培训结束'";
		getPageList(sql);
	}

	public void getPageList(String sql) {
		count = planschoolservice.countByquery(sql);
		memberList = planschoolservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/PlanSchool_beginCourse", results = {@Result(name = "success", location = "/WEB-INF/school/PlanSchool.jsp")})
	public String beginCourse() throws UnsupportedEncodingException {
		planschoolservice
				.updata("update PlanSchool set status='正在报名' where planId='"
						+ ServletActionContext.getRequest().getParameter(
								"PlanId")
						+ "' and schoolId='"
						+ ServletActionContext.getRequest().getParameter(
								"SchoolId") + "'");

		PlanSchool_query();
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_endCourse", results = {@Result(name = "success", location = "/WEB-INF/school/PlanSchool.jsp")})
	public String endCourse() throws UnsupportedEncodingException {
		planschoolservice
				.updata("update PlanSchool set status='培训结束' where planId='"
						+ ServletActionContext.getRequest().getParameter(
								"PlanId")
						+ "' and schoolId='"
						+ ServletActionContext.getRequest().getParameter(
								"SchoolId") + "'");

		PlanSchool_query();
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_history", results = {@Result(name = "success", location = "/WEB-INF/school/PlanSchoolInfoFilter.jsp")})
	public String history() throws UnsupportedEncodingException {
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_historydQuery", results = {@Result(name = "success", location = "/WEB-INF/school/PlanSchoolInfoFilter.jsp")})
	public String historydQuery() throws UnsupportedEncodingException {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		processcharset();
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.schoolName='" + person.getWorkPlace()
				+ "' and t.status<>'计划创建'";

		if (!model.getPlanName().isEmpty())
			sql = sql + " and t.planName like '%" + model.getPlanName() + "%'";
		if (!model.getBeginTime().isEmpty())
			sql = sql + " and t.beginTime>='" + model.getBeginTime() + "'";
		if (!model.getEndTime().isEmpty())
			sql = sql + " and t.endTime<='" + model.getEndTime() + "'";

		getPageList(sql);
		return SUCCESS;
	}

	public void processcharset() throws UnsupportedEncodingException {
		if (!model.getPlanName().isEmpty())
			model.setPlanName(new String(model.getPlanName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getBeginTime().isEmpty())
			model.setBeginTime(new String(model.getBeginTime().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getEndTime().isEmpty())
			model.setEndTime(new String(model.getEndTime().getBytes(
					"iso-8859-1"), "UTF-8"));
	}

	/*
	 * planschoolservice .queryByString(
	 * "from TrainingPlan a, TrainingAgency b,School c where a.id=1024 and b.id=3 and c.id=4"
	 * );
	 */
}
