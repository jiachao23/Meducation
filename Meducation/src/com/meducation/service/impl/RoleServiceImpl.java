package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.RoleDao;
import com.meducation.ORM.Role;
import com.meducation.service.RoleService;

@Service("roleservice")
@Transactional
@RemoteProxy(name = "roleservice")
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleDao roledao;

	@Override
	public String saveOrUpdateData(Role role) {
		roledao.saveOrUpdate(role);
		return null;

	}

	@Override
	public void delData(Integer id) {
		roledao.delById(id);

	}

	@Override
	public Role findById(Integer id) {
		return (Role) roledao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> findAllInfo() {
		return roledao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> findInfoByQuery(String qe) {
		return roledao.query(qe);
	}

	@Override
	public int countAll() {
		return roledao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> browseAll(int pageNo, int pageSize) {
		return roledao.listAll(pageNo, pageSize);
	}

	@Override
	public String saveData(Role role) {
		roledao.saveOrUpdate(role);
		return "ture";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> findInfoByPage(String qe, int pageNo, int pageSize) {
		return roledao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return roledao.countQuery(hql);
	}
}
