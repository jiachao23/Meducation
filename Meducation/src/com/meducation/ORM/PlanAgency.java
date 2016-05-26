package com.meducation.ORM;

/**
 * PlanAgency entity. @author MyEclipse Persistence Tools
 */

public class PlanAgency implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String planId;
	private String planName;
	private String planNum;
	private String agencyId;
	private String agencyName;
	private String agencyCode;
	private String status;
	private String beginTime;
	private String endTime;
	private String introduce;
	private String a1;

	// Constructors

	/** default constructor */
	public PlanAgency() {
	}

	/** full constructor */
	public PlanAgency(String planId, String planName, String planNum,
			String agencyId, String agencyName, String agencyCode,
			String status, String beginTime, String endTime, String introduce,
			String a1) {
		this.planId = planId;
		this.planName = planName;
		this.planNum = planNum;
		this.agencyId = agencyId;
		this.agencyName = agencyName;
		this.agencyCode = agencyCode;
		this.status = status;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.introduce = introduce;
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

	public String getAgencyId() {
		return this.agencyId;
	}

	public void setAgencyId(String agencyId) {
		this.agencyId = agencyId;
	}

	public String getAgencyName() {
		return this.agencyName;
	}

	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}

	public String getAgencyCode() {
		return this.agencyCode;
	}

	public void setAgencyCode(String agencyCode) {
		this.agencyCode = agencyCode;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

}