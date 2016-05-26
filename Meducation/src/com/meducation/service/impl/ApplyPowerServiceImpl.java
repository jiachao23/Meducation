package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.ApplyPowerDao;
import com.meducation.ORM.ApplyPower;
import com.meducation.service.ApplyPowerService;

@Service("applypowerservice")
@Transactional
@RemoteProxy(name = "applypowerservice")
public class ApplyPowerServiceImpl implements ApplyPowerService {
	@Resource
	private ApplyPowerDao applypowerdao;

	@Override
	public String saveOrUpdateData(ApplyPower applypower) {

		applypowerdao.saveOrUpdate(applypower);
		return "true";

	}

	@Override
	public void delData(Integer id) {
		applypowerdao.delById(id);

	}

	@Override
	public ApplyPower findById(Integer id) {
		return (ApplyPower) applypowerdao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ApplyPower> findAllInfo() {
		return applypowerdao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ApplyPower> findInfoByQuery(String qe) {
		return applypowerdao.query(qe);
	}

	@Override
	public int countAll() {
		return applypowerdao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ApplyPower> browseAll(int pageNo, int pageSize) {
		return applypowerdao.listAll(pageNo, pageSize);
	}

	@Override
	public String saveData(ApplyPower applypower) {
		applypowerdao.saveOrUpdate(applypower);
		return "ture";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ApplyPower> findInfoByPage(String qe, int pageNo, int pageSize) {
		return applypowerdao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return applypowerdao.countQuery(hql);
	}

	@Override
	public int updata(String hql) {
		return applypowerdao.update(hql);
	}
}
