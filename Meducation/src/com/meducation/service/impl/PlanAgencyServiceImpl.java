package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.PlanAgencyDao;
import com.meducation.ORM.PlanAgency;
import com.meducation.ORM.SelectedItems;
import com.meducation.ORM.TrainingAgency;
import com.meducation.ORM.TrainingPlan;
import com.meducation.service.PlanAgencyService;

@Service("planagencyservice")
@Transactional
@RemoteProxy(name = "planagencyservice")
public class PlanAgencyServiceImpl implements PlanAgencyService {

	@Resource
	private PlanAgencyDao planagencydao;

	@Override
	public String saveOrUpdateData(PlanAgency planagency) {
		planagencydao.saveOrUpdate(planagency);
		return null;
	}

	@Override
	public void delData(Integer id) {
		planagencydao.delById(id);

	}

	@Override
	public PlanAgency findById(Integer id) {
		return (PlanAgency) planagencydao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PlanAgency> findAllInfo() {
		return planagencydao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PlanAgency> findInfoByQuery(String qe) {
		return planagencydao.query(qe);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PlanAgency> findInfoByPage(String qe, int pageNo, int pageSize) {
		return planagencydao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return planagencydao.countQuery(hql);
	}

	@Override
	public int countAll() {
		return planagencydao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PlanAgency> browseAll(int pageNo, int pageSize) {
		return planagencydao.listAll(pageNo, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	@RemoteMethod
	public String saveData(SelectedItems selectedItems) {

		List<TrainingPlan> Plan_list = planagencydao
				.queryByString("from TrainingPlan where id="
						+ selectedItems.getPlanID() + "");

		String[] list = selectedItems.getItems();
		List<TrainingAgency> TrainingAgency_list;

		for (int i = 0; i < list.length; i++) {
			PlanAgency planAgency = new PlanAgency();
			TrainingAgency_list = planagencydao
					.queryByString("from TrainingAgency where id=" + list[i]);
			String hql = "from PlanAgency t where";
			hql = hql + " t.planNum='" + Plan_list.get(0).getPlanNum() + "'";
			hql = hql + " and t.agencyCode='"
					+ TrainingAgency_list.get(0).getAgenceCode() + "'";
			if (planagencydao.queryByString(hql).size() == 0) {
				planAgency
						.setPlanId(Integer.toString(Plan_list.get(0).getId()));
				planAgency.setPlanNum(Plan_list.get(0).getPlanNum());
				planAgency.setPlanName(Plan_list.get(0).getPlanName());
				planAgency.setAgencyName(TrainingAgency_list.get(0)
						.getAgenceName());
				planAgency.setAgencyId(Integer.toString(TrainingAgency_list
						.get(0).getId()));
				planAgency.setAgencyCode(TrainingAgency_list.get(0)
						.getAgenceCode());
				planAgency.setStatus("计划创建");
				planAgency.setBeginTime(Plan_list.get(0).getBeginTime());
				planAgency.setEndTime(Plan_list.get(0).getEndTime());
				planAgency.setIntroduce(Plan_list.get(0).getIntroduce());

				planagencydao.saveOrUpdate(planAgency);
			}
		}

		return "ture";
	}
	@Override
	public int updata(String hql) {
		return planagencydao.update(hql);
	}

}
