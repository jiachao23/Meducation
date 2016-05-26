package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.meducation.ORM.PageList;
import com.meducation.ORM.Person;
import com.meducation.ORM.TrainingPlan;
import com.meducation.service.PlanService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("json-default")
public class PlanInfoAction extends ActionSupport
		implements
			ModelDriven<TrainingPlan> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	PlanService planservice;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 20;
	List<TrainingPlan> memberList;
	private String result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private TrainingPlan model = new TrainingPlan();
	public TrainingPlan getModel() {
		return model;
	}

	@Action(value = "/PlanInfo_browser", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanInfo.jsp")})
	public String browser() {
		Page();
		return SUCCESS;
	}
	/*
	 * public void Page1() { count = planservice.countAll(); if
	 * (ServletActionContext.getRequest().getParameter("page") != null) { pageNo
	 * = Integer.parseInt(ServletActionContext.getRequest()
	 * .getParameter("page")); } memberList = planservice.browseAll(pageNo,
	 * pageSize); PageList pageList = new PageList();
	 * pageList.setPageNumber(pageNo); pageList.setFullListSize(count);
	 * pageList.setList(memberList); pageList.setObjectsPerPage(pageSize);
	 * ServletActionContext.getRequest().setAttribute("pageList", pageList); }
	 */
	public void Page() {
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		String sql = "t.status<>'培训结束'";
		count = planservice.countByquery(sql);
		memberList = planservice.findInfoByPage(sql, pageNo, pageSize);
		CountTime(memberList);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	public void CountTime(List<TrainingPlan> memberList) {
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Calendar c1 = java.util.Calendar.getInstance();
		java.util.Calendar c2 = java.util.Calendar.getInstance();
		String s2 = df.format(date);
		int result = 0;
		TrainingPlan trainingPlan = null;
		for (int i = 0; i < memberList.size(); i++) {
			trainingPlan = memberList.get(i);
			String s1 = trainingPlan.getEndTime().trim();
			try {
				c1.setTime(df.parse(s1));
				c2.setTime(df.parse(s2));
			} catch (java.text.ParseException e) {
				System.err.println("格式不正确");
			}
			result = c1.compareTo(c2);
			if (result < 0) {
				planservice
						.updata("update TrainingPlan set status='培训结束' where id="
								+ trainingPlan.getId());
				planservice
						.updata("update PlanAgency set status='培训结束' where planId='"
								+ trainingPlan.getId() + "'");
				planservice
						.updata("update PlanSchool set status='培训结束' where planId='"
								+ trainingPlan.getId() + "'");
			}

		}
	}

	@Action(value = "/PlanInfo_del", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanInfo.jsp")})
	public String del() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());

		planservice.updata("delete from PlanAgency where planId='" + id + "'");
		planservice.updata("delete from PlanSchool where planId='" + id + "'");

		planservice.delData(id);
		Page();
		return SUCCESS;

	}

	@Action(value = "/PlanInfo_edit", results = {@Result(name = "input", location = "/WEB-INF/plan/PlanInfoModify.jsp")})
	public String edit() {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		TrainingPlan plan = planservice.findById(id);
		if (plan != null) {
			try {
				BeanUtils.copyProperties(model, plan);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String Source = ServletActionContext.getRequest().getParameter("page")
				.trim();
		ServletActionContext.getRequest().setAttribute("page", Source);
		return INPUT;
	}

	public void processcharset() throws UnsupportedEncodingException {
		if (!model.getPlanName().isEmpty())
			model.setPlanName(new String(model.getPlanName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getPlanNum().isEmpty())
			model.setPlanNum(new String(model.getPlanNum().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getCreator().isEmpty())
			model.setCreator(new String(model.getCreator().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getBeginTime().isEmpty())
			model.setBeginTime(new String(model.getBeginTime().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getEndTime().isEmpty())
			model.setEndTime(new String(model.getEndTime().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getCreateTime().isEmpty())
			model.setCreateTime(new String(model.getCreateTime().getBytes(
					"iso-8859-1"), "UTF-8"));

	}

	@Action(value = "/PlanInfo_query", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanInfoQuery.jsp")})
	public String query() throws UnsupportedEncodingException {
		processcharset();

		String sql = "t.id<>0";
		if (!model.getPlanName().isEmpty())
			sql = sql + " and t.planName like '%" + model.getPlanName() + "%'";
		if (!model.getPlanNum().isEmpty())
			sql = sql + " and t.planNum like '%" + model.getPlanNum() + "%'";
		if (!model.getCreator().isEmpty())
			sql = sql + " and t.creator like '%" + model.getCreator() + "%'";
		if (!model.getBeginTime().isEmpty())
			sql = sql + " and t.beginTime>= '" + model.getBeginTime() + "'";
		if (!model.getEndTime().isEmpty())
			sql = sql + " and t.endTime<= '" + model.getEndTime() + "'";
		if (!model.getCreateTime().isEmpty())
			sql = sql + " and t.createTime>= '" + model.getCreateTime() + "'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = planservice.countByquery(sql);
		memberList = planservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);

		return SUCCESS;
	}

	@Action(value = "/PlanInfo_querydel", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanInfoQuery.jsp")})
	public String querydel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		planservice.delData(id);
		query();
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_showall", results = {@Result(name = "success", type = "chain", params = {
			"actionName", "PlanSchool_show"})})
	public String showall() {
		query_plan();
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_showall2", results = {@Result(name = "success", type = "chain", params = {
			"actionName", "PlanSchoolInfo_planquery"})})
	public String showall2() {
		query_plan();
		return SUCCESS;
	}

	@Action(value = "/PlanAgency_showall3", results = {@Result(name = "success", type = "chain", params = {
			"actionName", "PlanAgency_show"})})
	public String showall3() {
		query_plan();
		return SUCCESS;
	}

	@Action(value = "/PlanAgency_showall4", results = {@Result(name = "success", type = "chain", params = {
			"actionName", "PlanAgencyInfo_planquery"})})
	public String showall4() {
		query_plan();
		return SUCCESS;
	}

	@Action(value = "/PlanInfo_search", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanInfoQuery.jsp")})
	public String search() throws UnsupportedEncodingException {
		return SUCCESS;
	}

	public void query_plan() {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("PlanId").trim());
		TrainingPlan plan = planservice.findById(id);
		if (plan != null) {
			try {
				BeanUtils.copyProperties(model, plan);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
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
	}

	@Action(value = "/PlanAgency_down", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanInfo.jsp")})
	public String down() {

		String planID = (String) ServletActionContext.getRequest()
				.getParameter("planID").trim();
		planservice.updata("update TrainingPlan set status='等待审批' where id='"
				+ planID + "'");
		Page();
		return SUCCESS;
	}

	@Action(value = "/PlanInfo_approve", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanInfoApprove.jsp")})
	public String approve() {
		Page2();
		return SUCCESS;
	}

	public void Page2() {
		String sql = "t.status='等待审批'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = planservice.countByquery(sql);
		memberList = planservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/PlanInfo_agree", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanInfoApprove.jsp")})
	public String agree() {
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = df.format(date);
		String planID = (String) ServletActionContext.getRequest()
				.getParameter("PlanId").trim();
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		planservice
				.updata("update TrainingPlan set status='通过审批',authorizedPerson='"
						+ person.getRealName()
						+ "',authorizedTime='"
						+ time
						+ "' where id='" + planID + "'");

		Page2();
		return SUCCESS;
	}

	@Action(value = "/PlanInfo_notagree", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanInfoApprove.jsp")})
	public String notagree() {
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = df.format(date);
		String planID = (String) ServletActionContext.getRequest()
				.getParameter("PlanId").trim();
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		planservice
				.updata("update TrainingPlan set status='未通过审批',authorizedPerson='"
						+ person.getRealName()
						+ "',authorizedTime='"
						+ time
						+ "' where id='" + planID + "'");

		Page2();
		return SUCCESS;
	}

	@Action(value = "/PlanInfo_planissued", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanInfo.jsp")})
	public String planissued() {
		String planID = (String) ServletActionContext.getRequest()
				.getParameter("planID").trim();
		System.out.println(planID);

		planservice.updata("update TrainingPlan set status='计划实施' where id='"
				+ planID + "'");

		planservice
				.updata("update PlanAgency set status='拟定具体课程' where planId='"
						+ planID + "'");

		planservice
				.updata("update PlanSchool set status='拟定实施方案' where planId='"
						+ planID + "'");
		Page();
		return SUCCESS;

	}

	@Action(value = "/AgencyCourse_showInAgency", results = {@Result(name = "success", type = "chain", params = {
			"actionName", "AgencyCourse_show"})})
	public String showInAgency() throws UnsupportedEncodingException {
		query_plan();
		return SUCCESS;
	}

	@Action(value = "/AgencyCourse_CourseQuery", results = {@Result(name = "success", type = "chain", params = {
			"actionName", "CourseInfo_AgencyQuery"})})
	public String CourseQuery() throws UnsupportedEncodingException {
		query_plan();
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_lookCourse3", results = {@Result(name = "success", location = "/WEB-INF/school/PlanDetail.jsp")})
	public String lookCourse3() throws UnsupportedEncodingException {
		query_plan();
		return SUCCESS;
	}

	@Action(value = "/PlanSchool_teacherlookCourse3", results = {@Result(name = "success", location = "/WEB-INF/school/TeacherEnroll.jsp")})
	public String teacherlookCourse3() throws UnsupportedEncodingException {
		query_plan();
		return SUCCESS;
	}
}
