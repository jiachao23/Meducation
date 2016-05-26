package com.meducation.service;

import java.util.List;

import com.meducation.ORM.PlanAgency;
import com.meducation.ORM.SelectedItems;

public interface PlanAgencyService {

	/** */
	public String saveOrUpdateData(PlanAgency planAgency);
	/** */
	public void delData(Integer id);
	/** */
	public PlanAgency findById(Integer id);

	public List<PlanAgency> findAllInfo();

	public List<PlanAgency> findInfoByQuery(String qe);
	/** */
	public List<PlanAgency> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<PlanAgency> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(SelectedItems selectedItems);

	public int updata(String hql);

}
