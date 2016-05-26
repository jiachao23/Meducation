package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.meducation.ORM.PageList;
import com.meducation.ORM.SchoolAgency;
import com.meducation.ORM.TrainingAgency;
import com.meducation.service.TrainingAgencyService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AgencyInfoAction extends ActionSupport
		implements
			ModelDriven<TrainingAgency> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	TrainingAgencyService trainingagencyservice;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 10;
	List<TrainingAgency> memberList;

	private TrainingAgency model = new TrainingAgency();// ���ڷ�װ��Ա����ģ��
	public TrainingAgency getModel() {
		return model;
	}

	@Action(value = "/AgencyInfo_browser", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/agencyInfo.jsp")})
	public String browser() {
		Page();
		return SUCCESS;

	}

	public void Page() {
		count = trainingagencyservice.countAll();
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		memberList = trainingagencyservice.browseAll(pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/AgencyInfo_del", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/agencyInfo.jsp")})
	public String del() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		trainingagencyservice.delData(id);
		Page();
		return SUCCESS;

	}

	@Action(value = "/AgencyInfo_edit", results = {@Result(name = "input", location = "/WEB-INF/baseInfo/agencyInfoModify.jsp")})
	public String edit() {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		TrainingAgency trainingagency = trainingagencyservice.findById(id);
		if (trainingagency != null) {
			try {
				BeanUtils.copyProperties(model, trainingagency);
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
		if (!model.getAgenceName().isEmpty())
			model.setAgenceName(new String(model.getAgenceName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getAgenceCode().isEmpty())
			model.setAgenceCode(new String(model.getAgenceCode().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getAgengcePerson().isEmpty())
			model.setAgengcePerson(new String(model.getAgengcePerson()
					.getBytes("iso-8859-1"), "UTF-8"));

	}

	@Action(value = "/AgencyInfo_query", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/agencyInfoQuery.jsp")})
	public String query() throws UnsupportedEncodingException {
		processcharset();

		String sql = "t.id<>0";
		if (!model.getAgenceName().isEmpty())
			sql = sql + " and t.agenceName like '%" + model.getAgenceName()
					+ "%'";
		if (!model.getAgenceCode().isEmpty())
			sql = sql + " and t.agenceCode like '%" + model.getAgenceCode()
					+ "%'";
		if (!model.getAgengcePerson().isEmpty())
			sql = sql + " and t.agengcePerson like '%"
					+ model.getAgengcePerson() + "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = trainingagencyservice.countByquery(sql);
		memberList = trainingagencyservice
				.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);

		return SUCCESS;
	}

	@Action(value = "/AgencyInfo_querydel", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/agencyInfoQuery.jsp")})
	public String querydel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		trainingagencyservice.delData(id);

		query();

		return SUCCESS;
	}

	@Action(value = "/AgencyInfo_search", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/agencyInfoQuery.jsp")})
	public String search() throws UnsupportedEncodingException {
		return SUCCESS;
	}

	@Action(value = "/PlanAgency_show", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanAgencyChoose.jsp")})
	public String show() {
		Page();
		return SUCCESS;
	}

	@Action(value = "/PlanAgencyInfo_planquery", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanAgencyChoose.jsp")})
	public String planquery() throws UnsupportedEncodingException {
		processcharset();

		String sql = "t.id<>0";
		if (!model.getAgenceName().isEmpty())
			sql = sql + " and t.agenceName like '%" + model.getAgenceName()
					+ "%'";
		if (!model.getAgenceCode().isEmpty())
			sql = sql + " and t.agenceCode like '%" + model.getAgenceCode()
					+ "%'";
		if (!model.getAgengcePerson().isEmpty())
			sql = sql + " and t.agengcePerson like '%"
					+ model.getAgengcePerson() + "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = trainingagencyservice.countByquery(sql);
		memberList = trainingagencyservice
				.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);

		return SUCCESS;
	}

	@Action(value = "/PlanSchool_lookCourse2", results = {@Result(name = "success", type = "chain", params = {
			"actionName", "PlanSchool_lookCourse3"})})
	public String lookCourse2() throws UnsupportedEncodingException {
		lookCourse2Componet();
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public void lookCourse2Componet() {
		List<SchoolAgency> schoolAgency_list = trainingagencyservice
				.queryByString("From SchoolAgency where planId='"
						+ ServletActionContext.getRequest()
								.getParameter("PlanId").trim()
						+ "' and schoolId='"
						+ ServletActionContext.getRequest().getParameter(
								"SchoolId") + "'");
		SchoolAgency schoolAgency = schoolAgency_list.get(0);

		ServletActionContext.getRequest().getSession()
				.setAttribute("G_AgencyId", schoolAgency.getAgencyId());

		int id = Integer.parseInt(schoolAgency.getAgencyId());
		TrainingAgency trainingAgency = trainingagencyservice.findById(id);
		if (trainingAgency != null) {
			try {
				BeanUtils.copyProperties(model, trainingAgency);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Action(value = "/PlanSchool_teacherlookCourse2", results = {@Result(name = "success", type = "chain", params = {
			"actionName", "PlanSchool_teacherlookCourse3"})})
	public String teacherlookCourse2() throws UnsupportedEncodingException {
		lookCourse2Componet();
		return SUCCESS;
	}
}
