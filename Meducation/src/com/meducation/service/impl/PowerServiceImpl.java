package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.PowerDao;
import com.meducation.ORM.Power;
import com.meducation.service.PowerService;

@Service("powerservice")
@Transactional
@RemoteProxy(name = "powerservice")
public class PowerServiceImpl implements PowerService {
	@Resource
	private PowerDao powerdao;

	@Override
	public String saveOrUpdateData(Power power) {
		powerdao.saveOrUpdate(power);
		return null;

	}

	@Override
	public void delData(Integer id) {
		powerdao.delById(id);

	}

	@Override
	public Power findById(Integer id) {
		return (Power) powerdao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Power> findAllInfo() {
		return powerdao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Power> findInfoByQuery(String qe) {
		return powerdao.query(qe);
	}

	@Override
	public int countAll() {
		return powerdao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Power> browseAll(int pageNo, int pageSize) {
		return powerdao.listAll(pageNo, pageSize);
	}

	@Override
	public String saveData(Power power) {
		powerdao.saveOrUpdate(power);
		return "ture";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Power> findInfoByPage(String qe, int pageNo, int pageSize) {
		return powerdao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return powerdao.countQuery(hql);
	}
}
