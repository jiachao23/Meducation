package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Component;

import com.meducation.ORM.Course;
import com.meducation.ORM.PageList;
import com.meducation.ORM.Person;
import com.meducation.service.CourseService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("courseInfoAction")
public class CourseInfoAction extends ActionSupport
		implements
			ModelDriven<Course> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1980081938200392034L;

	@Resource
	CourseService courseservice;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 20;
	List<Course> memberList;

	private Course model = new Course();
	public Course getModel() {
		return model;
	}

	@Action(value = "/CourseInfo_browser", results = {@Result(name = "success", location = "/WEB-INF/agency/courseInfo.jsp")})
	public String browser() {
		Page();
		return SUCCESS;
	}

	public void Page() {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.agencyName='" + person.getWorkPlace() + "'";

		count = courseservice.countByquery(sql);
		memberList = courseservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/CourseInfo_del", results = {@Result(name = "success", location = "/WEB-INF/agency/courseInfo.jsp")})
	public String del() throws UnsupportedEncodingException {

		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		courseservice.delData(id);
		Page();
		return SUCCESS;

	}

	@Action(value = "/CourseInfo_edit", results = {@Result(name = "input", location = "/WEB-INF/agency/courseInfoModify.jsp")})
	public String edit() {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		Course course = courseservice.findById(id);
		if (course != null) {
			try {
				BeanUtils.copyProperties(model, course);
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
		if (!model.getCourseName().isEmpty())
			model.setCourseName(new String(model.getCourseName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getCourseNum().isEmpty())
			model.setCourseNum(new String(model.getCourseNum().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getCourseSubject().isEmpty())
			model.setCourseSubject(new String(model.getCourseSubject()
					.getBytes("iso-8859-1"), "UTF-8"));
		if (!model.getCourseTeacher().isEmpty())
			model.setCourseTeacher(new String(model.getCourseTeacher()
					.getBytes("iso-8859-1"), "UTF-8"));
	}

	@Action(value = "/CourseInfo_query", results = {@Result(name = "success", location = "/WEB-INF/agency/courseInfoQuery.jsp")})
	public String query() throws UnsupportedEncodingException {
		query_query();
		return SUCCESS;
	}

	public void query_query() throws UnsupportedEncodingException {
		processcharset();
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		String sql = "t.agencyName='" + person.getWorkPlace() + "'";
		if (!model.getCourseName().isEmpty())
			sql = sql + " and t.courseName like '%" + model.getCourseName()
					+ "%'";
		if (!model.getCourseNum().isEmpty())
			sql = sql + " and t.courseNum like '%" + model.getCourseNum()
					+ "%'";
		if (!model.getCourseSubject().isEmpty())
			sql = sql + " and t.courseSubject like '%"
					+ model.getCourseSubject() + "%'";
		if (!model.getCourseTeacher().isEmpty())
			sql = sql + " and t.courseTeacher like '%"
					+ model.getCourseTeacher() + "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = courseservice.countByquery(sql);
		memberList = courseservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/CourseInfo_querydel", results = {@Result(name = "success", location = "/WEB-INF/agency/courseInfoQuery.jsp")})
	public String querydel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		courseservice.delData(id);
		query();
		return SUCCESS;
	}

	@Action(value = "/CourseInfo_search", results = {@Result(name = "success", location = "/WEB-INF/agency/courseInfoQuery.jsp")})
	public String search() throws UnsupportedEncodingException {
		return SUCCESS;
	}

	@Action(value = "/AgencyCourse_show", results = {@Result(name = "success", location = "/WEB-INF/agency/CourseChoose.jsp")})
	public String show() throws UnsupportedEncodingException {
		Page();
		return SUCCESS;
	}

	@Action(value = "/CourseInfo_AgencyQuery", results = {@Result(name = "success", location = "/WEB-INF/agency/CourseChoose.jsp")})
	public String AgencyQuery() throws UnsupportedEncodingException {
		query_query();
		return SUCCESS;
	}
}
