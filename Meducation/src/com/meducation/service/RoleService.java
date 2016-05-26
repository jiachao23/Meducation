package com.meducation.service;

import java.util.List;

import com.meducation.ORM.Role;

public interface RoleService {

	/** */
	public String saveOrUpdateData(Role role);
	/** */
	public void delData(Integer id);
	/** */
	public Role findById(Integer id);

	public List<Role> findAllInfo();

	public List<Role> findInfoByQuery(String qe);
	/** */
	public List<Role> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<Role> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(Role role);

}
