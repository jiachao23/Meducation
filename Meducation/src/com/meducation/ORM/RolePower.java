package com.meducation.ORM;

import org.directwebremoting.annotations.DataTransferObject;

/**
 * RolePower entity. @author MyEclipse Persistence Tools
 */
@DataTransferObject
public class RolePower implements java.io.Serializable {

	// Fields

	private Integer id;
	private String roleId;
	private String powerId;
	private String a1;

	// Constructors

	/** default constructor */
	public RolePower() {
	}

	/** full constructor */
	public RolePower(String roleId, String powerId, String a1) {
		this.roleId = roleId;
		this.powerId = powerId;
		this.a1 = a1;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getPowerId() {
		return this.powerId;
	}

	public void setPowerId(String powerId) {
		this.powerId = powerId;
	}

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

}