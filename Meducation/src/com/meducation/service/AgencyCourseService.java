package com.meducation.service;

import java.util.List;

import com.meducation.ORM.AgencyCourse;
import com.meducation.ORM.SelectedItems;

public interface AgencyCourseService {

	/** */
	public String saveOrUpdateData(AgencyCourse agencyCourse);
	/** */
	public void delData(Integer id);
	/** */
	public AgencyCourse findById(Integer id);

	public List<AgencyCourse> findAllInfo();

	public List<AgencyCourse> findInfoByQuery(String qe);
	/** */
	public List<AgencyCourse> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<AgencyCourse> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(SelectedItems selectedItems);

	public int updata(String hql);

	public List<Object> find(String qe, int pageNo, int pageSize);

	public List<Object[]> queryByString(String hql);

}
