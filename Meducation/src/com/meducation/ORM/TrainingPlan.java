package com.meducation.ORM;

/**
 * TrainingPlan entity. @author MyEclipse Persistence Tools
 */

public class TrainingPlan implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String planName;
	private String planNum;
	private String beginTime;
	private String endTime;
	private String toDistrict;
	private String introduce;
	private String creator;
	private String createTime;
	private String authorizedPerson;
	private String authorizedTime;
	private String status;
	private String a1;
	private String a2;

	// Constructors

	/** default constructor */
	public TrainingPlan() {
	}

	/** full constructor */
	public TrainingPlan(String planName, String planNum, String beginTime,
			String endTime, String toDistrict, String introduce,
			String creator, String createTime, String authorizedPerson,
			String authorizedTime, String status, String a1, String a2) {
		this.planName = planName;
		this.planNum = planNum;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.toDistrict = toDistrict;
		this.introduce = introduce;
		this.creator = creator;
		this.createTime = createTime;
		this.authorizedPerson = authorizedPerson;
		this.authorizedTime = authorizedTime;
		this.status = status;
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

	public String getToDistrict() {
		return this.toDistrict;
	}

	public void setToDistrict(String toDistrict) {
		this.toDistrict = toDistrict;
	}

	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getCreator() {
		return this.creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getAuthorizedPerson() {
		return this.authorizedPerson;
	}

	public void setAuthorizedPerson(String authorizedPerson) {
		this.authorizedPerson = authorizedPerson;
	}

	public String getAuthorizedTime() {
		return this.authorizedTime;
	}

	public void setAuthorizedTime(String authorizedTime) {
		this.authorizedTime = authorizedTime;
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

	public String getA2() {
		return this.a2;
	}

	public void setA2(String a2) {
		this.a2 = a2;
	}

}