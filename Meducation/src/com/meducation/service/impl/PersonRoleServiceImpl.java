package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.PersonRoleDao;
import com.meducation.ORM.PersonRole;
import com.meducation.service.PersonRoleService;

@Service("personroleservice")
@Transactional
@RemoteProxy(name = "personroleservice")
public class PersonRoleServiceImpl implements PersonRoleService {

	@Resource
	private PersonRoleDao userroledao;

	@Override
	public String saveOrUpdateData(PersonRole personrole) {
		userroledao.saveOrUpdate(personrole);
		return null;

	}

	@Override
	public void delData(Integer id) {
		userroledao.delById(id);

	}

	@Override
	public PersonRole findById(Integer id) {
		return (PersonRole) userroledao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonRole> findAllInfo() {
		return userroledao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonRole> findInfoByQuery(String qe) {
		return userroledao.query(qe);
	}

	@Override
	public int countAll() {
		return userroledao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonRole> browseAll(int pageNo, int pageSize) {
		return userroledao.listAll(pageNo, pageSize);
	}

	@Override
	public String saveData(PersonRole userrole) {
		userroledao.saveOrUpdate(userrole);
		return "ture";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonRole> findInfoByPage(String qe, int pageNo, int pageSize) {
		return userroledao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return userroledao.countQuery(hql);
	}

}
