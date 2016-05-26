package com.meducation.ORM;

import org.directwebremoting.annotations.DataTransferObject;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */
@DataTransferObject
public class Role implements java.io.Serializable {

	// Fields

	private Integer id;
	private String roleName;
	private String a1;

	// Constructors

	/** default constructor */
	public Role() {
	}

	/** full constructor */
	public Role(String roleName, String a1) {
		this.roleName = roleName;
		this.a1 = a1;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

}