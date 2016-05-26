package com.meducation.ORM;

/**
 * PersonRole entity. @author MyEclipse Persistence Tools
 */

public class PersonRole implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String personId;
	private String roleId;
	private String roleName;
	private String a1;

	// Constructors

	/** default constructor */
	public PersonRole() {
	}

	/** full constructor */
	public PersonRole(String personId, String roleId, String roleName, String a1) {
		this.personId = personId;
		this.roleId = roleId;
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

	public String getPersonId() {
		return this.personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
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