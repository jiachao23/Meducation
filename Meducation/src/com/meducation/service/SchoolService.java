package com.meducation.service;

import java.util.List;

import com.meducation.ORM.School;

public interface SchoolService {

	/** */
	public String saveOrUpdateData(School school);
	/** */
	public void delData(Integer id);
	/** */
	public School findById(Integer id);

	public List<School> findAllInfo();

	public List<School> findInfoByQuery(String qe);
	/** */
	public List<School> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<School> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(School school);

	public List<Object[]> queryByString(String hql);

}
