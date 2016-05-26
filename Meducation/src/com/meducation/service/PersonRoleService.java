package com.meducation.service;

import java.util.List;

import com.meducation.ORM.PersonRole;

public interface PersonRoleService {

	/** */
	public String saveOrUpdateData(PersonRole userrole);
	/** */
	public void delData(Integer id);
	/** */
	public PersonRole findById(Integer id);

	public List<PersonRole> findAllInfo();

	public List<PersonRole> findInfoByQuery(String qe);
	/** */
	public List<PersonRole> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<PersonRole> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(PersonRole userrole);

}
