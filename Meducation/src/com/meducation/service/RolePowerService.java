package com.meducation.service;

import java.util.List;

import com.meducation.ORM.RolePower;

public interface RolePowerService {

	/** */
	public String saveOrUpdateData(RolePower rolePower);
	/** */
	public void delData(Integer id);
	/** */
	public RolePower findById(Integer id);

	public List<RolePower> findAllInfo();

	public List<RolePower> findInfoByQuery(String qe);
	/** */
	public List<RolePower> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<RolePower> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(RolePower rolePower);

}
