package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.RolePowerDao;
import com.meducation.ORM.RolePower;
import com.meducation.service.RolePowerService;

@Service("rolepowerservice")
@Transactional
@RemoteProxy(name = "rolepowerservice")
public class RolePowerServiceImpl implements RolePowerService {
	@Resource
	private RolePowerDao rolepowerdao;

	@Override
	public String saveOrUpdateData(RolePower rolePower) {
		rolepowerdao.saveOrUpdate(rolePower);
		return null;

	}

	@Override
	public void delData(Integer id) {
		rolepowerdao.delById(id);

	}

	@Override
	public RolePower findById(Integer id) {
		return (RolePower) rolepowerdao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RolePower> findAllInfo() {
		return rolepowerdao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RolePower> findInfoByQuery(String qe) {
		return rolepowerdao.query(qe);
	}

	@Override
	public int countAll() {
		return rolepowerdao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RolePower> browseAll(int pageNo, int pageSize) {
		return rolepowerdao.listAll(pageNo, pageSize);
	}

	@Override
	public String saveData(RolePower rolePower) {
		rolepowerdao.saveOrUpdate(rolePower);
		return "ture";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RolePower> findInfoByPage(String qe, int pageNo, int pageSize) {
		return rolepowerdao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return rolepowerdao.countQuery(hql);
	}
}
