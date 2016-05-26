package com.meducation.service;

import java.util.List;

import com.meducation.ORM.ApplyPower;

public interface ApplyPowerService {

	/** */
	public String saveOrUpdateData(ApplyPower applypower);
	/** */
	public void delData(Integer id);
	/** */
	public ApplyPower findById(Integer id);

	public List<ApplyPower> findAllInfo();

	public List<ApplyPower> findInfoByQuery(String qe);
	/** */
	public List<ApplyPower> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<ApplyPower> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(ApplyPower applypower);

	public int updata(String hql);

}
