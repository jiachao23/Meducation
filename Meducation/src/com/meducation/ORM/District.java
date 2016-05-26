package com.meducation.ORM;

import org.directwebremoting.annotations.DataTransferObject;

/**
 * District entity. @author MyEclipse Persistence Tools
 */
@DataTransferObject
public class District implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String districtName;
	private String districtCode;
	private String belongCityCode;
	private String belongCityName;
	private String a1;

	// Constructors

	/** default constructor */
	public District() {
	}

	/** full constructor */
	public District(String districtName, String districtCode,
			String belongCityCode, String belongCityName, String a1) {
		this.districtName = districtName;
		this.districtCode = districtCode;
		this.belongCityCode = belongCityCode;
		this.belongCityName = belongCityName;
		this.a1 = a1;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDistrictName() {
		return this.districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public String getDistrictCode() {
		return this.districtCode;
	}

	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}

	public String getBelongCityCode() {
		return this.belongCityCode;
	}

	public void setBelongCityCode(String belongCityCode) {
		this.belongCityCode = belongCityCode;
	}

	public String getBelongCityName() {
		return this.belongCityName;
	}

	public void setBelongCityName(String belongCityName) {
		this.belongCityName = belongCityName;
	}

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

}