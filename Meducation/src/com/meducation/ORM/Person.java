package com.meducation.ORM;

/**
 * Person entity. @author MyEclipse Persistence Tools
 */

public class Person implements java.io.Serializable {

	// Fields

	private Integer id;
	private String loginName;
	private String realName;
	private String identifyNum;
	private String workPlace;
	private String sex;
	private String tel;
	private String email;
	private String address;
	private String code;
	private String password;
	private String photo;
	private String roleType;
	private String a1;
	private String a2;

	// Constructors

	/** default constructor */
	public Person() {
	}

	/** full constructor */
	public Person(String loginName, String realName, String identifyNum,
			String workPlace, String sex, String tel, String email,
			String address, String code, String password, String photo,
			String roleType, String a1, String a2) {
		this.loginName = loginName;
		this.realName = realName;
		this.identifyNum = identifyNum;
		this.workPlace = workPlace;
		this.sex = sex;
		this.tel = tel;
		this.email = email;
		this.address = address;
		this.code = code;
		this.password = password;
		this.photo = photo;
		this.roleType = roleType;
		this.a1 = a1;
		this.a2 = a2;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getIdentifyNum() {
		return this.identifyNum;
	}

	public void setIdentifyNum(String identifyNum) {
		this.identifyNum = identifyNum;
	}

	public String getWorkPlace() {
		return this.workPlace;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getRoleType() {
		return this.roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

	public String getA2() {
		return this.a2;
	}

	public void setA2(String a2) {
		this.a2 = a2;
	}

}