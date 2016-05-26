package com.meducation.ORM;

import java.util.HashSet;
import java.util.Set;

/**
 * Course entity. @author MyEclipse Persistence Tools
 */

public class Course implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Course course;
	private String courseName;
	private String courseContant;
	private String courseSubject;
	private String courseNum;
	private String courseTeacher;
	private String coursePlace;
	private String courseBeginTime;
	private String courseEndTime;
	private String agencyId;
	private String agencyName;
	private String agencyCode;
	private String a1;
	private Set courses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Course() {
	}

	/** minimal constructor */
	public Course(Course course) {
		this.course = course;
	}

	/** full constructor */
	public Course(Course course, String courseName, String courseContant,
			String courseSubject, String courseNum, String courseTeacher,
			String coursePlace, String courseBeginTime, String courseEndTime,
			String agencyId, String agencyName, String agencyCode, String a1,
			Set courses) {
		this.course = course;
		this.courseName = courseName;
		this.courseContant = courseContant;
		this.courseSubject = courseSubject;
		this.courseNum = courseNum;
		this.courseTeacher = courseTeacher;
		this.coursePlace = coursePlace;
		this.courseBeginTime = courseBeginTime;
		this.courseEndTime = courseEndTime;
		this.agencyId = agencyId;
		this.agencyName = agencyName;
		this.agencyCode = agencyCode;
		this.a1 = a1;
		this.courses = courses;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Course getCourse() {
		return this.course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
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

	public String getCourseNum() {
		return this.courseNum;
	}

	public void setCourseNum(String courseNum) {
		this.courseNum = courseNum;
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

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

	public Set getCourses() {
		return this.courses;
	}

	public void setCourses(Set courses) {
		this.courses = courses;
	}

}