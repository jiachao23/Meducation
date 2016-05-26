package com.meducation.ORM;

/**
 * SchoolAgency entity. @author MyEclipse Persistence Tools
 */

public class SchoolAgency implements java.io.Serializable {

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
	private String schoolAdmin;
	private String schoolAdminTime;
	private String a1;

	// Constructors

	/** default constructor */
	public SchoolAgency() {
	}

	/** full constructor */
	public SchoolAgency(String planId, String planName, String planCode,
			String agencyId, String agencyName, String agencyCode,
			String schoolId, String schoolName, String schoolCode,
			String schoolAdmin, String schoolAdminTime, String a1) {
		this.planId = planId;
		this.planName = planName;
		this.planCode = planCode;
		this.agencyId = agencyId;
		this.agencyName = agencyName;
		this.agencyCode = agencyCode;
		this.schoolId = schoolId;
		this.schoolName = schoolName;
		this.schoolCode = schoolCode;
		this.schoolAdmin = schoolAdmin;
		this.schoolAdminTime = schoolAdminTime;
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

	public String getSchoolAdmin() {
		return this.schoolAdmin;
	}

	public void setSchoolAdmin(String schoolAdmin) {
		this.schoolAdmin = schoolAdmin;
	}

	public String getSchoolAdminTime() {
		return this.schoolAdminTime;
	}

	public void setSchoolAdminTime(String schoolAdminTime) {
		this.schoolAdminTime = schoolAdminTime;
	}

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

}