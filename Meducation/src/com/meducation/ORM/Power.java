package com.meducation.ORM;

import org.directwebremoting.annotations.DataTransferObject;

/**
 * Power entity. @author MyEclipse Persistence Tools
 */
@DataTransferObject
public class Power implements java.io.Serializable {

	// Fields

	private Integer id;
	private String powerName;
	private String a1;

	// Constructors

	/** default constructor */
	public Power() {
	}

	/** full constructor */
	public Power(String powerName, String a1) {
		this.powerName = powerName;
		this.a1 = a1;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPowerName() {
		return this.powerName;
	}

	public void setPowerName(String powerName) {
		this.powerName = powerName;
	}

	public String getA1() {
		return this.a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

}