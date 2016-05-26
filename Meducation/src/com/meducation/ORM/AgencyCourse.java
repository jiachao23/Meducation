package com.meducation.ORM;

/**
 * AgencyCourse entity. @author MyEclipse Persistence Tools
 */

public class AgencyCourse implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String planId;
	private String planName;
	private String planCode;
	private String agencyId;
	private String agencyName;
	private String agencyCode;
	private String courseId;
	private String courseName;
	private String courseCode;
	private String courseContant;
	private String courseSubject;
	private String courseTeacher;
	private String coursePlace;
	private String courseBeginTime;
	private String courseEndTime;
	private String status;
	private String a1;

	// Constructors

	/** default constructor */
	public AgencyCourse() {
	}

	/** full constructor */
	public AgencyCourse(String planId, String planName, String planCode,
			String agencyId, String agencyName, String agencyCode,
			String courseId, String courseName, String courseCode,
			String courseContant, String courseSubject, String courseTeacher,
			String coursePlace, String courseBeginTime, String courseEndTime,
			String status, String a1) {
		this.planId = planId;
		this.planName = planName;
		this.planCode = planCode;
		this.agencyId = agencyId;
		this.agencyName = agencyName;
		this.agencyCode = agencyCode;
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseCode = courseCode;
		this.courseContant = courseContant;
		this.courseSubject = courseSubject;
		this.courseTeacher = courseTeacher;
		this.coursePlace = coursePlace;
		this.courseBeginTime = courseBeginTime;
		this.courseEndTime = courseEndTime;
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

	public String getPlanCode() {
		return this.planCode;
	}

	public void setPlanCode(String planCode) {
		this.planCode = planCode;
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

	public String getCourseId() {
		return this.courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseCode() {
		return this.courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public String getCourseContant() {
		return this.courseContant;
	}

	public void setCourseContant(String courseContant) {
		this.courseContant = courseContant;
	}

	public String getCourseSubject() {
		return this.courseSubject;
	}

	public void setCourseSubject(String courseSubject) {
		this.courseSubject = courseSubject;
	}

	public String getCourseTeacher() {
		return this.courseTeacher;
	}

	public void setCourseTeacher(String courseTeacher) {
		this.courseTeacher = courseTeacher;
	}

	public String getCoursePlace() {
		return this.coursePlace;
	}

	public void setCoursePlace(String coursePlace) {
		this.coursePlace = coursePlace;
	}

	public String getCourseBeginTime() {
		return this.courseBeginTime;
	}

	public void setCourseBeginTime(String courseBeginTime) {
		this.courseBeginTime = courseBeginTime;
	}

	public String getCourseEndTime() {
		return this.courseEndTime;
	}

	public void setCourseEndTime(String courseEndTime) {
		this.courseEndTime = courseEndTime;
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