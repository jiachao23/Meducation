package com.meducation.service;

import java.util.List;

import com.meducation.ORM.PlanSchool;
import com.meducation.ORM.SelectedItems;

public interface PlanSchoolService {

	/** */
	public String saveOrUpdateData(PlanSchool planSchool);
	/** */
	public void delData(Integer id);
	/** */
	public PlanSchool findById(Integer id);

	public List<PlanSchool> findAllInfo();

	public List<PlanSchool> findInfoByQuery(String qe);
	/** */
	public List<PlanSchool> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<PlanSchool> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(SelectedItems selectedItems);

	public int updata(String hql);

	public List<Object[]> queryByString(String hql);

}
