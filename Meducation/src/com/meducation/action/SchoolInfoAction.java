package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.meducation.ORM.PageList;
import com.meducation.ORM.School;
import com.meducation.service.SchoolService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("json-default")
public class SchoolInfoAction extends ActionSupport
		implements
			ModelDriven<School> {

	private static final long serialVersionUID = 1L;

	@Resource
	SchoolService schoolservice;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 20;
	List<School> memberList;
	private String result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private School model = new School();
	public School getModel() {
		return model;
	}

	public void queryByString() {
		JSONArray ja = new JSONArray();
		List<Object[]> list = new ArrayList<Object[]>();
		list = schoolservice
				.queryByString("Select distinct t.districtName,t.districtCode from District t");
		for (int i = 0; i < list.size(); i++) {
			Object[] object = (Object[]) list.get(i);
			JSONObject jo = new JSONObject();
			jo.element("code", object[1].toString());
			jo.element("district", object[0].toString());
			ja.add(jo);
		}
		this.result = ja.toString();
	}

	@Action(value = "/SchoolInfo_district", results = {@Result(name = "success", type = "json", params = {
			"root", "result"})})
	public String district() {
		queryByString();
		return SUCCESS;
	}

	@Action(value = "/SchoolInfo_browser", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/schoolInfo.jsp")})
	public String browser() {
		Page();
		return SUCCESS;
	}

	public void Page() {
		count = schoolservice.countAll();
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		memberList = schoolservice.browseAll(pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/PlanSchool_show", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanSchoolChoose.jsp")})
	public String show() {
		Page();
		return SUCCESS;
	}

	@Action(value = "/SchoolInfo_del", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/schoolInfo.jsp")})
	public String del() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		schoolservice.delData(id);
		Page();
		return SUCCESS;

	}

	@Action(value = "/SchoolInfo_edit", results = {@Result(name = "input", location = "/WEB-INF/baseInfo/schoolInfoModify.jsp")})
	public String edit() {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		School school = schoolservice.findById(id);
		if (school != null) {
			try {
				BeanUtils.copyProperties(model, school);
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
		if (!model.getSchoolName().isEmpty())
			model.setSchoolName(new String(model.getSchoolName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getSchoolCode().isEmpty())
			model.setSchoolCode(new String(model.getSchoolCode().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getBelongDistrictName().isEmpty())
			model.setBelongDistrictName(new String(model
					.getBelongDistrictName().getBytes("iso-8859-1"), "UTF-8"));
		if (!model.getSchoolType().isEmpty())
			model.setSchoolType(new String(model.getSchoolType().getBytes(
					"iso-8859-1"), "UTF-8"));

	}

	@Action(value = "/SchoolInfo_query", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/schoolInfoQuery.jsp")})
	public String query() throws UnsupportedEncodingException {
		processcharset();

		String sql = "t.id<>0";
		if (!model.getSchoolName().isEmpty())
			sql = sql + " and t.schoolName like '%" + model.getSchoolName()
					+ "%'";
		if (!model.getSchoolCode().isEmpty())
			sql = sql + " and t.schoolCode like '%" + model.getSchoolCode()
					+ "%'";
		if (!model.getBelongDistrictName().isEmpty())
			sql = sql + " and t.belongDistrictName like '%"
					+ model.getBelongDistrictName() + "%'";
		if (!model.getSchoolType().isEmpty())
			sql = sql + " and t.schoolType like '%" + model.getSchoolType()
					+ "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = schoolservice.countByquery(sql);
		memberList = schoolservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);

		return SUCCESS;
	}

	@Action(value = "/PlanSchoolInfo_planquery", results = {@Result(name = "success", location = "/WEB-INF/plan/PlanSchoolChoose.jsp")})
	public String planquery() throws UnsupportedEncodingException {
		processcharset();

		String sql = "t.id<>0";
		if (!model.getSchoolName().isEmpty())
			sql = sql + " and t.schoolName like '%" + model.getSchoolName()
					+ "%'";
		if (!model.getSchoolCode().isEmpty())
			sql = sql + " and t.schoolCode like '%" + model.getSchoolCode()
					+ "%'";
		if (!model.getBelongDistrictName().isEmpty())
			sql = sql + " and t.belongDistrictName like '%"
					+ model.getBelongDistrictName() + "%'";
		if (!model.getSchoolType().isEmpty())
			sql = sql + " and t.schoolType like '%" + model.getSchoolType()
					+ "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = schoolservice.countByquery(sql);
		memberList = schoolservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);

		return SUCCESS;
	}

	@Action(value = "/SchoolInfo_querydel", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/schoolInfoQuery.jsp")})
	public String querydel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		schoolservice.delData(id);
		query();
		return SUCCESS;
	}

	@Action(value = "/SchoolInfo_search", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/schoolInfoQuery.jsp")})
	public String search() throws UnsupportedEncodingException {
		return SUCCESS;
	}

}
