package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.meducation.ORM.ApplyPower;
import com.meducation.ORM.PageList;
import com.meducation.ORM.Person;
import com.meducation.service.ApplyPowerService;
import com.meducation.service.PersonService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("json-default")
public class ApplyPowerAction extends ActionSupport
		implements
			ModelDriven<ApplyPower> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	ApplyPowerService applypowerservice;
	@Resource
	PersonService personservice;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 20;
	List<ApplyPower> memberList;
	private String result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private ApplyPower model = new ApplyPower();// ���ڷ�װ��Ա����ģ��
	public ApplyPower getModel() {
		return model;
	}

	@Action(value = "/Person_askfor", results = {@Result(name = "success", type = "json", params = {
			"root", "result"})})
	public String askfor() throws UnsupportedEncodingException {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		if (applypowerservice.countByquery("t.personId='" + person.getId()
				+ "' and t.status='申请'") == 0) {
			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String time = df.format(date);
			Person jing = personservice.findById(person.getId());
			ApplyPower xin = new ApplyPower();
			xin.setPersonId(Integer.toString(jing.getId()));
			xin.setLoginName(jing.getLoginName());
			xin.setRealName(jing.getRealName());
			xin.setIdentifyNum(jing.getIdentifyNum());
			xin.setWorkPlace(jing.getWorkPlace());
			xin.setSex(jing.getSex());
			xin.setTel(jing.getTel());
			xin.setEmail(jing.getEmail());
			xin.setAddress(jing.getAddress());
			xin.setCode(jing.getCode());
			String aa = ServletActionContext.getRequest().getParameter("A")
					.trim();
			String roleType = new String(aa.getBytes("iso-8859-1"), "UTF-8");
			xin.setApplyType(roleType);
			xin.setApplyTime(time);
			xin.setStatus("申请");
			applypowerservice.saveData(xin);
			this.result = "true";
		} else
			this.result = "false";
		return SUCCESS;
	}

	@Action(value = "/Person_roleaskforback", results = {@Result(name = "success", type = "json", params = {
			"root", "result"})})
	public String roleaskforback() throws UnsupportedEncodingException {
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		if (applypowerservice.updata("delete from ApplyPower where personId='"
				+ person.getId() + "' and status='申请'") == 0)
			this.result = "false";
		else
			this.result = "true";

		return SUCCESS;
	}

	@Action(value = "/Person_giverole", results = {@Result(name = "success", location = "/WEB-INF/users/RoleApply.jsp")})
	public String giverole() throws UnsupportedEncodingException {
		Page();
		return SUCCESS;
	}

	public void Page() {
		count = applypowerservice.countByquery("t.status='申请'");
		memberList = applypowerservice.findInfoByPage("t.status='申请'", pageNo,
				pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/Person_adminYes", results = {@Result(name = "success", location = "/WEB-INF/users/RoleApply.jsp")})
	public String adminYes() throws UnsupportedEncodingException {
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = df.format(date);
		Person person = (Person) ServletActionContext.getRequest().getSession()
				.getAttribute("Person");
		applypowerservice
				.updata("update ApplyPower set status='已审批',approvePerson='"
						+ person.getRealName() + "',approveTime='" + time
						+ "' where id="
						+ ServletActionContext.getRequest().getParameter("id"));
		ApplyPower jing = applypowerservice
				.findById(Integer.parseInt(ServletActionContext.getRequest()
						.getParameter("id")));

		applypowerservice.updata("update Person set roleType='"
				+ jing.getApplyType() + "' where id=" + jing.getPersonId());

		Page();
		return SUCCESS;
	}
	@Action(value = "/Person_adminNo", results = {@Result(name = "success", location = "/WEB-INF/users/RoleApply.jsp")})
	public String adminNo() throws UnsupportedEncodingException {
		applypowerservice.updata("delete from ApplyPower where id="
				+ ServletActionContext.getRequest().getParameter("id"));
		Page();
		return SUCCESS;
	}

	@Action(value = "/Person_applyroleQuery", results = {@Result(name = "success", location = "/WEB-INF/users/RoleApplyQuery.jsp")})
	public String applyroleQuery() throws UnsupportedEncodingException {
		return SUCCESS;
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
		if (!model.getApplyType().isEmpty())
			model.setApplyType(new String(model.getApplyType().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getApprovePerson().isEmpty())
			model.setApprovePerson(new String(model.getApprovePerson()
					.getBytes("iso-8859-1"), "UTF-8"));
	}

	@Action(value = "/Person_QueryApprove", results = {@Result(name = "success", location = "/WEB-INF/users/RoleApplyQuery.jsp")})
	public String QueryApprove() throws UnsupportedEncodingException {
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
		if (!model.getApplyType().isEmpty())
			sql = sql + " and t.applyType like '%" + model.getApplyType()
					+ "%'";
		if (!model.getApprovePerson().isEmpty())
			sql = sql + " and t.approvePerson like '%"
					+ model.getApprovePerson() + "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = applypowerservice.countByquery(sql);
		memberList = applypowerservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
		return SUCCESS;
	}

	@Action(value = "/Person_roledel", results = {@Result(name = "success", location = "/WEB-INF/users/RoleApplyQuery.jsp")})
	public String roledel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		applypowerservice.delData(id);
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
		if (!model.getApplyType().isEmpty())
			sql = sql + " and t.applyType like '%" + model.getApplyType()
					+ "%'";
		if (!model.getApprovePerson().isEmpty())
			sql = sql + " and t.approvePerson like '%"
					+ model.getApprovePerson() + "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = applypowerservice.countByquery(sql);
		memberList = applypowerservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
		return SUCCESS;
	}
}
