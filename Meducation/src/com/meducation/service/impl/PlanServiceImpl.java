package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.PlanDao;
import com.meducation.ORM.TrainingPlan;
import com.meducation.service.PlanService;

@Service("planservice")
@Transactional
@RemoteProxy(name = "planservice")
public class PlanServiceImpl implements PlanService {
	@Resource
	private PlanDao plandao;

	@Override
	public String saveOrUpdateData(TrainingPlan plan) {
		String hql = "update TrainingPlan t set t.planName='"
				+ plan.getPlanName() + "', t.planNum='" + plan.getPlanNum()
				+ "', t.beginTime='" + plan.getBeginTime() + "', t.endTime='"
				+ plan.getEndTime() + "', t.introduce='" + plan.getIntroduce()
				+ "', t.creator='" + plan.getCreator() + "', t.createTime='"
				+ plan.getCreateTime() + "' where t.id=" + plan.getId();
		plandao.update(hql);
		return "true";

	}

	@Override
	public void delData(Integer id) {
		plandao.delById(id);

	}

	@Override
	public TrainingPlan findById(Integer id) {
		return (TrainingPlan) plandao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingPlan> findAllInfo() {
		return plandao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingPlan> findInfoByQuery(String qe) {
		return plandao.query(qe);
	}

	@Override
	public int countAll() {
		return plandao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingPlan> browseAll(int pageNo, int pageSize) {
		return plandao.listAll(pageNo, pageSize);
	}

	@Override
	public String saveData(TrainingPlan plan) {
		plandao.saveOrUpdate(plan);
		return "ture";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingPlan> findInfoByPage(String qe, int pageNo, int pageSize) {
		return plandao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return plandao.countQuery(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingPlan> queryByString(String qe) {
		return plandao.queryByString(qe);
	}
	@Override
	public int updata(String hql) {
		return plandao.update(hql);
	}

}
