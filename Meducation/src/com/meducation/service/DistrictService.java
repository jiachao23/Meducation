package com.meducation.service;

import java.util.List;

import com.meducation.ORM.District;

public interface DistrictService {

	/** */
	public String saveOrUpdateData(District district);
	/** */
	public void delData(Integer id);
	/** */
	public District findById(Integer id);

	public List<Object[]> queryByString(String hql);

	public List<District> findAllInfo();

	public List<District> findInfoByQuery(String qe);
	/** */
	public List<District> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<District> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(District district);

}
