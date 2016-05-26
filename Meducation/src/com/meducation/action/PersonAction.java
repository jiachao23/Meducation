package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.meducation.ORM.PageList;
import com.meducation.ORM.Person;
import com.meducation.service.PersonService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("personaction")
@Scope("prototype")
@ParentPackage("json-default")
public class PersonAction extends ActionSupport implements ModelDriven<Person> {

	private static final long serialVersionUID = -6641422368817615975L;

	@Resource
	PersonService personservice;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 20;
	List<Person> memberList;
	private Person model = new Person();
	private String result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Person getModel() {
		return model;
	}

	@Action(value = "/person_findInfo", results = {@Result(name = "input", location = "/WEB-INF/person/information.jsp")})
	public String findInfo() {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");

		if (person != null) {
			try {
				BeanUtils.copyProperties(model, person);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return INPUT;

	}

	@Action(value = "/person_modifypw", results = {@Result(name = "success", location = "/WEB-INF/person/modifypw.jsp")})
	public String modifypw() {
		return SUCCESS;
	}

	@Action(value = "/person_checkexist", results = {@Result(name = "success", type = "json", params = {
			"root", "result"})})
	public String checkexist() {

		List<Object[]> list = new ArrayList<Object[]>();
		list = personservice.queryByString("from Person t where t.realName='"
				+ (String) ServletActionContext.getRequest().getParameter(
						"realName")
				+ "' and t.identifyNum='"
				+ (String) ServletActionContext.getRequest().getParameter(
						"identifyNum")
				+ "' and t.workPlace='"
				+ (String) ServletActionContext.getRequest().getParameter(
						"workPlace") + "'");

		Map<String, String> map = new HashMap<String, String>();

		if (list.size() > 0)
			map.put("person", "true");
		else
			map.put("person", "false");

		JSONObject jo = JSONObject.fromObject(map);
		this.result = jo.toString();

		return SUCCESS;
	}

	@Action(value = "/PersonInfo_browser", results = {@Result(name = "success", location = "/WEB-INF/users/UsersQuery.jsp")})
	public String browser() {
		Page();
		return SUCCESS;

	}

	public void Page() {
		count = personservice.countAll();
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		memberList = personservice.browseAll(pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	public void processcharset() throws UnsupportedEncodingException {
		if (!model.getRealName().isEmpty())
			model.setRealName(new String(model.getRealName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getLoginName().isEmpty())
			model.setLoginName(new String(model.getLoginName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getIdentifyNum().isEmpty())
			model.setIdentifyNum(new String(model.getIdentifyNum().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getWorkPlace().isEmpty())
			model.setWorkPlace(new String(model.getWorkPlace().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getRoleType().isEmpty())
			model.setRoleType(new String(model.getRoleType().getBytes(
					"iso-8859-1"), "UTF-8"));

	}

	@Action(value = "/PersonInfo_query", results = {@Result(name = "success", location = "/WEB-INF/users/UsersQuery.jsp")})
	public String query() throws UnsupportedEncodingException {
		processcharset();

		String sql = "t.id<>0";
		if (!model.getRealName().isEmpty())
			sql = sql + " and t.realName like '%" + model.getRealName() + "%'";
		if (!model.getLoginName().isEmpty())
			sql = sql + " and t.loginName like '%" + model.getLoginName()
					+ "%'";
		if (!model.getIdentifyNum().isEmpty())
			sql = sql + " and t.identifyNum like '%" + model.getIdentifyNum()
					+ "%'";
		if (!model.getWorkPlace().isEmpty())
			sql = sql + " and t.workPlace like '%" + model.getWorkPlace()
					+ "%'";
		if (!model.getRoleType().isEmpty())
			sql = sql + " and t.roleType like '%" + model.getRoleType() + "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = personservice.countByquery(sql);
		memberList = personservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);

		return SUCCESS;
	}

	@Action(value = "/Person_applyrole", results = {@Result(name = "input", location = "/WEB-INF/users/GiveRoleToUser.jsp")})
	public String applyrole() {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		String pnum = ServletActionContext.getRequest().getParameter("page")
				.trim();
		Person person = personservice.findById(id);
		if (person != null) {
			try {
				BeanUtils.copyProperties(model, person);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		ServletActionContext.getRequest().setAttribute("page", pnum);
		return INPUT;
	}

	@Action(value = "/Person_roleUpdate", results = {@Result(name = "success", type = "json", params = {
			"root", "result"})})
	public String roleUpdate() throws UnsupportedEncodingException {
		String aa = ServletActionContext.getRequest().getParameter("A").trim();
		String roleType = new String(aa.getBytes("iso-8859-1"), "UTF-8");
		personservice.updata("update Person t set t.roleType='" + roleType
				+ "' where t.id="
				+ ServletActionContext.getRequest().getParameter("B").trim());

		this.result = "true";
		return SUCCESS;
	}

	@Action(value = "/person_askforpower", results = {@Result(name = "success", location = "/WEB-INF/person/askforpower.jsp")})
	public String askforpower() {
		return SUCCESS;
	}
}
