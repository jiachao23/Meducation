package com.meducation.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

public class UsersAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Action(value = "/Users_roleuser", results = {@Result(name = "success", location = "/WEB-INF/users/RoleUsersQuery.jsp")})
	public String roleuser() {
		return SUCCESS;

	}

}
