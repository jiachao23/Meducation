package com.meducation.ORM;

import org.directwebremoting.annotations.DataTransferObject;

/**
 * City entity. @author MyEclipse Persistence Tools
 */
@DataTransferObject
public class City implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -6609623935853410471L;
	private Integer id;
	private String cityName;
	private String cityCode;
	private String a1;

	// Constructors

	/** default constructor */
	public City() {
	}

	/** full constructor */
	public City(String cityName, String cityCode, String a1) {
		this.cityName = cityName;
		this.cityCode = cityCode;
		this.a1 = a1;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCityCode() {
		return this.cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

}