package com.meducation.service;

import java.util.List;

import com.meducation.ORM.Power;

public interface PowerService {

	/** */
	public String saveOrUpdateData(Power power);
	/** */
	public void delData(Integer id);
	/** */
	public Power findById(Integer id);

	public List<Power> findAllInfo();

	public List<Power> findInfoByQuery(String qe);
	/** */
	public List<Power> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<Power> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(Power powerl);

}
