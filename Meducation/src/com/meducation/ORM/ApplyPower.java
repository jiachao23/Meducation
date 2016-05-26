package com.meducation.ORM;

/**
 * ApplyPower entity. @author MyEclipse Persistence Tools
 */

public class ApplyPower implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String personId;
	private String loginName;
	private String realName;
	private String identifyNum;
	private String workPlace;
	private String sex;
	private String tel;
	private String email;
	private String address;
	private String code;
	private String applyType;
	private String applyTime;
	private String status;
	private String approvePerson;
	private String approveTime;
	private String a1;

	// Constructors

	/** default constructor */
	public ApplyPower() {
	}

	/** full constructor */
	public ApplyPower(String personId, String loginName, String realName,
			String identifyNum, String workPlace, String sex, String tel,
			String email, String address, String code, String applyType,
			String applyTime, String status, String approvePerson,
			String approveTime, String a1) {
		this.personId = personId;
		this.loginName = loginName;
		this.realName = realName;
		this.identifyNum = identifyNum;
		this.workPlace = workPlace;
		this.sex = sex;
		this.tel = tel;
		this.email = email;
		this.address = address;
		this.code = code;
		this.applyType = applyType;
		this.applyTime = applyTime;
		this.status = status;
		this.approvePerson = approvePerson;
		this.approveTime = approveTime;
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

	public String getApplyType() {
		return this.applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	public String getApplyTime() {
		return this.applyTime;
	}

	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApprovePerson() {
		return this.approvePerson;
	}

	public void setApprovePerson(String approvePerson) {
		this.approvePerson = approvePerson;
	}

	public String getApproveTime() {
		return this.approveTime;
	}

	public void setApproveTime(String approveTime) {
		this.approveTime = approveTime;
	}

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

}