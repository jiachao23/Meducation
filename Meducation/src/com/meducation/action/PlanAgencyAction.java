package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.meducation.ORM.PageList;
import com.meducation.ORM.Person;
import com.meducation.ORM.PlanAgency;
import com.meducation.service.PlanAgencyService;
import com.meducation.service.PlanService;
import com.opensymphony.xwork2.ActionSupport;

public class PlanAgencyAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	PlanAgencyService planagencyservice;
	@Resource
	PlanService planservice;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 20;
	List<PlanAgency> memberList;

	public void query() {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		String planID = ServletActionContext.getRequest()
				.getParameter("PlanId").trim();
		String sql = "t.planId='" + planID + "'";
		count = planagencyservice.countByquery(sql);
		memberList = planagencyservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/PlanAgency_look", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanAgencyQuery.jsp")})
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

	@Action(value = "/PlanAgency_querydel", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanAgencyQuery.jsp")})
	public String querydel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		planagencyservice.delData(id);
		query();
		return SUCCESS;
	}

	@Action(value = "/PlanAgency_browser", results = {@Result(name = "success", location = "/WEB-INF/agency/AddCourseToPlan.jsp")})
	public String browser() throws UnsupportedEncodingException {
		PlanAgency_query();
		return SUCCESS;
	}

	public void PlanAgency_query() {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.agencyName='" + person.getWorkPlace()
				+ "' and t.status<>'计划创建' and t.status<>'培训结束'";
		count = planagencyservice.countByquery(sql);
		memberList = planagencyservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/PlanAgency_startwork", results = {@Result(name = "success", location = "/WEB-INF/agency/AddCourseToPlan.jsp")})
	public String startwork() throws UnsupportedEncodingException {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");

		planagencyservice
				.updata("update PlanAgency set status='正在执行' where id="
						+ ServletActionContext.getRequest().getParameter("id")
								.trim());
		planagencyservice
				.updata("update AgencyCourse set status='正在执行' where planId='"
						+ ServletActionContext.getRequest()
								.getParameter("planId").trim()
						+ "' and agencyName='" + person.getWorkPlace() + "'");

		PlanAgency_query();
		return SUCCESS;
	}

	@Action(value = "/PlanAgency_closePlan", results = {@Result(name = "success", location = "/WEB-INF/agency/AddCourseToPlan.jsp")})
	public String closePlan() throws UnsupportedEncodingException {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");

		planagencyservice
				.updata("update PlanAgency set status='培训结束' where id="
						+ ServletActionContext.getRequest().getParameter("id")
								.trim());
		planagencyservice
				.updata("update AgencyCourse set status='培训结束' where planId='"
						+ ServletActionContext.getRequest()
								.getParameter("planId").trim()
						+ "' and agencyName='" + person.getWorkPlace() + "'");

		PlanAgency_query();
		return SUCCESS;
	}

}
