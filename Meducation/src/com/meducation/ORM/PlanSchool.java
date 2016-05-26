package com.meducation.ORM;

/**
 * PlanSchool entity. @author MyEclipse Persistence Tools
 */

public class PlanSchool implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String planId;
	private String planName;
	private String planNum;
	private String beginTime;
	private String endTime;
	private String introduce;
	private String belongDistrictName;
	private String belongDistrictCode;
	private String schoolId;
	private String schoolName;
	private String schoolCode;
	private String schoolType;
	private String status;
	private String a1;

	// Constructors

	/** default constructor */
	public PlanSchool() {
	}

	/** full constructor */
	public PlanSchool(String planId, String planName, String planNum,
			String beginTime, String endTime, String introduce,
			String belongDistrictName, String belongDistrictCode,
			String schoolId, String schoolName, String schoolCode,
			String schoolType, String status, String a1) {
		this.planId = planId;
		this.planName = planName;
		this.planNum = planNum;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.introduce = introduce;
		this.belongDistrictName = belongDistrictName;
		this.belongDistrictCode = belongDistrictCode;
		this.schoolId = schoolId;
		this.schoolName = schoolName;
		this.schoolCode = schoolCode;
		this.schoolType = schoolType;
		this.status = status;
		this.a1 = a1;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPlanId() {
		return this.planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public String getPlanName() {
		return this.planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getPlanNum() {
		return this.planNum;
	}

	public void setPlanNum(String planNum) {
		this.planNum = planNum;
	}

	public String getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getBelongDistrictName() {
		return this.belongDistrictName;
	}

	public void setBelongDistrictName(String belongDistrictName) {
		this.belongDistrictName = belongDistrictName;
	}

	public String getBelongDistrictCode() {
		return this.belongDistrictCode;
	}

	public void setBelongDistrictCode(String belongDistrictCode) {
		this.belongDistrictCode = belongDistrictCode;
	}

	public String getSchoolId() {
		return this.schoolId;
	}

	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}

	public String getSchoolName() {
		return this.schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getSchoolCode() {
		return this.schoolCode;
	}

	public void setSchoolCode(String schoolCode) {
		this.schoolCode = schoolCode;
	}

	public String getSchoolType() {
		return this.schoolType;
	}

	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

}