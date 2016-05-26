package com.meducation.ORM;

/**
 * TeacherEnrollment entity. @author MyEclipse Persistence Tools
 */

public class TeacherEnrollment implements java.io.Serializable {

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
	private String schoolId;
	private String schoolName;
	private String schoolCode;
	private String courseId;
	private String courseName;
	private String courseCode;
	private String courseContant;
	private String courseSubject;
	private String courseScore;
	private String courseTeacher;
	private String coursePlace;
	private String courseBeginTime;
	private String courseEndTime;
	private String teacherId;
	private String teacherRealName;
	private String teacherIdentifyNum;
	private String status;
	private String a1;

	// Constructors

	/** default constructor */
	public TeacherEnrollment() {
	}

	/** full constructor */
	public TeacherEnrollment(String planId, String planName, String planCode,
			String agencyId, String agencyName, String agencyCode,
			String schoolId, String schoolName, String schoolCode,
			String courseId, String courseName, String courseCode,
			String courseContant, String courseSubject, String courseScore,
			String courseTeacher, String coursePlace, String courseBeginTime,
			String courseEndTime, String teacherId, String teacherRealName,
			String teacherIdentifyNum, String status, String a1) {
		this.planId = planId;
		this.planName = planName;
		this.planCode = planCode;
		this.agencyId = agencyId;
		this.agencyName = agencyName;
		this.agencyCode = agencyCode;
		this.schoolId = schoolId;
		this.schoolName = schoolName;
		this.schoolCode = schoolCode;
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseCode = courseCode;
		this.courseContant = courseContant;
		this.courseSubject = courseSubject;
		this.courseScore = courseScore;
		this.courseTeacher = courseTeacher;
		this.coursePlace = coursePlace;
		this.courseBeginTime = courseBeginTime;
		this.courseEndTime = courseEndTime;
		this.teacherId = teacherId;
		this.teacherRealName = teacherRealName;
		this.teacherIdentifyNum = teacherIdentifyNum;
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

	public String getCourseScore() {
		return this.courseScore;
	}

	public void setCourseScore(String courseScore) {
		this.courseScore = courseScore;
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

	public String getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherRealName() {
		return this.teacherRealName;
	}

	public void setTeacherRealName(String teacherRealName) {
		this.teacherRealName = teacherRealName;
	}

	public String getTeacherIdentifyNum() {
		return this.teacherIdentifyNum;
	}

	public void setTeacherIdentifyNum(String teacherIdentifyNum) {
		this.teacherIdentifyNum = teacherIdentifyNum;
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