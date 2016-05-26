package com.meducation.service;

import java.util.List;

import com.meducation.ORM.City;

public interface CityService {

	/** */
	public String saveOrUpdateData(City city);
	/** */
	public void delData(Integer id);
	/** */
	public City findById(Integer id);

	public List<City> findAllInfo();

	public List<City> findInfoByQuery(String qe);
	/** */
	public List<City> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<City> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(City city);

}
