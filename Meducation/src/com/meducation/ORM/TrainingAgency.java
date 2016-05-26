package com.meducation.ORM;

import org.directwebremoting.annotations.DataTransferObject;

/**
 * TrainingAgency entity. @author MyEclipse Persistence Tools
 */
@DataTransferObject
public class TrainingAgency implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String agenceName;
	private String agenceIntroduce;
	private String agenceCode;
	private String agengcePerson;
	private String tel;
	private String a1;
	private String a2;

	// Constructors

	/** default constructor */
	public TrainingAgency() {
	}

	/** full constructor */
	public TrainingAgency(String agenceName, String agenceIntroduce,
			String agenceCode, String agengcePerson, String tel, String a1,
			String a2) {
		this.agenceName = agenceName;
		this.agenceIntroduce = agenceIntroduce;
		this.agenceCode = agenceCode;
		this.agengcePerson = agengcePerson;
		this.tel = tel;
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

	public String getAgenceName() {
		return this.agenceName;
	}

	public void setAgenceName(String agenceName) {
		this.agenceName = agenceName;
	}

	public String getAgenceIntroduce() {
		return this.agenceIntroduce;
	}

	public void setAgenceIntroduce(String agenceIntroduce) {
		this.agenceIntroduce = agenceIntroduce;
	}

	public String getAgenceCode() {
		return this.agenceCode;
	}

	public void setAgenceCode(String agenceCode) {
		this.agenceCode = agenceCode;
	}

	public String getAgengcePerson() {
		return this.agengcePerson;
	}

	public void setAgengcePerson(String agengcePerson) {
		this.agengcePerson = agengcePerson;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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