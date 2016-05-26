package com.meducation.ORM;

/**
 * School entity. @author MyEclipse Persistence Tools
 */

public class School implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String schoolName;
	private String schoolCode;
	private String schoolType;
	private String schoolAddress;
	private String belongDistrictName;
	private String belongDistrictCode;
	private String a1;

	// Constructors

	/** default constructor */
	public School() {
	}

	/** full constructor */
	public School(String schoolName, String schoolCode, String schoolType,
			String schoolAddress, String belongDistrictName,
			String belongDistrictCode, String a1) {
		this.schoolName = schoolName;
		this.schoolCode = schoolCode;
		this.schoolType = schoolType;
		this.schoolAddress = schoolAddress;
		this.belongDistrictName = belongDistrictName;
		this.belongDistrictCode = belongDistrictCode;
		this.a1 = a1;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getSchoolAddress() {
		return this.schoolAddress;
	}

	public void setSchoolAddress(String schoolAddress) {
		this.schoolAddress = schoolAddress;
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

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

}