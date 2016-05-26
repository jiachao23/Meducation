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
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.meducation.ORM.Person;
import com.meducation.ORM.User;
import com.meducation.service.PersonService;
import com.meducation.util.MD5Impl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("userlogin")
@Scope("prototype")
@ParentPackage("json-default")
public class login extends ActionSupport implements ModelDriven<User> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String validate_code;
	private String result;

	@Resource
	PersonService personservice;

	private User model = new User();// ���ڷ�װ��Ա����ģ��
	public User getModel() {
		return model;
	}

	@Action(value = "/login_check", results = {
			@Result(name = "success", location = "/WEB-INF/login/main.jsp"),
			@Result(name = "input", location = "/index.jsp")})
	public String check() throws UnsupportedEncodingException {
		processcharset();
		String code = (String) ServletActionContext.getContext().getSession()
				.get(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		MD5Impl md5 = new MD5Impl();
		List<Person> loginUser = personservice.PersonEExist("(t.loginName='"
				+ model.getLogin_name() + "'" + " or t.identifyNum='"
				+ model.getLogin_name() + "')" + " and t.password='"
				+ md5.GetMD5Code(model.getPassword()) + "'");

		if (loginUser.size() == 0) {
			addActionError("用户名或密码错误！");
			return INPUT;
		} else
			addActionError("");

		if (code.equals(validate_code) == false) {
			addActionMessage("验证码输入错误！验证码输入错误！验证码输入错误！");
			return INPUT;
		} else
			addActionMessage("");

		ServletActionContext.getRequest().getSession()
				.setAttribute("Person", loginUser.get(0));
		return SUCCESS;
	}

	public void processcharset() throws UnsupportedEncodingException {
		if (!model.getLogin_name().isEmpty())
			model.setLogin_name(new String(model.getLogin_name().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getPassword().isEmpty())
			model.setPassword(new String(model.getPassword().getBytes(
					"iso-8859-1"), "UTF-8"));

	}

	@Action(value = "/login_school", results = {@Result(name = "success", type = "json", params = {
			"root", "result"})})
	public String school() {

		JSONArray ja = new JSONArray();
		List<Object[]> list = new ArrayList<Object[]>();
		list = personservice
				.queryByString("Select distinct t.id,t.schoolName from School t where belongDistrictCode='"
						+ ServletActionContext.getRequest()
								.getParameter("code") + "'");
		for (int i = 0; i < list.size(); i++) {
			Object[] object = (Object[]) list.get(i);
			JSONObject jo = new JSONObject();
			jo.element("id", object[0].toString());
			jo.element("school", object[1].toString());
			ja.add(jo);
		}
		System.out.println(ja.toString());
		this.result = ja.toString();
		return SUCCESS;
	}

	@Action(value = "/login_district", results = {@Result(name = "success", type = "json", params = {
			"root", "result"})})
	public String district() {
		JSONArray ja = new JSONArray();
		List<Object[]> list = new ArrayList<Object[]>();
		list = personservice
				.queryByString("Select distinct t.districtName,t.districtCode from District t");
		for (int i = 0; i < list.size(); i++) {
			Object[] object = (Object[]) list.get(i);
			JSONObject jo = new JSONObject();
			jo.element("code", object[1].toString());
			jo.element("district", object[0].toString());
			ja.add(jo);
		}
		this.result = ja.toString();
		return SUCCESS;
	}

	@Action(value = "/login_agency", results = {@Result(name = "success", type = "json", params = {
			"root", "result"})})
	public String agency() {
		JSONArray ja = new JSONArray();
		List<Object[]> list = new ArrayList<Object[]>();
		list = personservice
				.queryByString("Select distinct t.id,t.agenceName from TrainingAgency t");
		for (int i = 0; i < list.size(); i++) {
			Object[] object = (Object[]) list.get(i);
			JSONObject jo = new JSONObject();
			jo.element("id", object[0].toString());
			jo.element("agenceName", object[1].toString());
			ja.add(jo);
		}
		this.result = ja.toString();
		return SUCCESS;
	}

	public String getValidate_code() {
		return validate_code;
	}

	public void setValidate_code(String validate_code) {
		this.validate_code = validate_code;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Action(value = "/login_toremember", results = {@Result(name = "success", location = "/WEB-INF/login/remember.jsp")})
	public String remeber() {
		return SUCCESS;

	}

	@Action(value = "/login_mainpage", results = {@Result(name = "success", location = "/WEB-INF/login/main.jsp")})
	public String mainpage() {
		return SUCCESS;

	}

	@Action(value = "/login_logout", results = {@Result(name = "success", location = "/index.jsp")})
	public String logout() {
		ServletActionContext.getRequest().getSession()
				.setAttribute("Person", "");
		return SUCCESS;

	}

	@Action(value = "/login_toRegister", results = {@Result(name = "success", location = "/WEB-INF/login/register.jsp")})
	public String toMain() {
		return SUCCESS;

	}

}
