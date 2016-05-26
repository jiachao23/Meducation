package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.PlanSchoolDao;
import com.meducation.ORM.PlanSchool;
import com.meducation.ORM.School;
import com.meducation.ORM.SelectedItems;
import com.meducation.ORM.TrainingPlan;
import com.meducation.service.PlanSchoolService;

@Service("planschoolservice")
@Transactional
@RemoteProxy(name = "planschoolservice")
public class PlanSchoolServiceImpl implements PlanSchoolService {
	@Resource
	private PlanSchoolDao planschooldao;

	@Override
	public String saveOrUpdateData(PlanSchool planSchool) {
		planschooldao.saveOrUpdate(planSchool);
		return null;
	}

	@Override
	public void delData(Integer id) {
		planschooldao.delById(id);

	}

	@Override
	public PlanSchool findById(Integer id) {
		return (PlanSchool) planschooldao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PlanSchool> findAllInfo() {
		return planschooldao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PlanSchool> findInfoByQuery(String qe) {
		return planschooldao.query(qe);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PlanSchool> findInfoByPage(String qe, int pageNo, int pageSize) {
		return planschooldao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return planschooldao.countQuery(hql);
	}

	@Override
	public int countAll() {
		return planschooldao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PlanSchool> browseAll(int pageNo, int pageSize) {
		return planschooldao.listAll(pageNo, pageSize);
	}

	@Override
	public int updata(String hql) {
		return planschooldao.update(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	@RemoteMethod
	public String saveData(SelectedItems selectedItems) {

		List<TrainingPlan> Plan_list = planschooldao
				.queryByString("from TrainingPlan where id="
						+ selectedItems.getPlanID() + "");

		String[] list = selectedItems.getItems();
		List<School> School_list;

		for (int i = 0; i < list.length; i++) {
			PlanSchool planSchool = new PlanSchool();
			School_list = planschooldao.queryByString("from School where id="
					+ list[i] + "");
			String hql = "from PlanSchool t where";
			hql = hql + " t.planNum='" + Plan_list.get(0).getPlanNum() + "'";
			hql = hql + " and t.schoolCode='"
					+ School_list.get(0).getSchoolCode() + "'";
			if (planschooldao.queryByString(hql).size() == 0) {
				planSchool
						.setPlanId(Integer.toString(Plan_list.get(0).getId()));
				planSchool.setPlanNum(Plan_list.get(0).getPlanNum());
				planSchool.setPlanName(Plan_list.get(0).getPlanName());
				planSchool.setBelongDistrictName(School_list.get(0)
						.getBelongDistrictName());
				planSchool.setBelongDistrictCode(School_list.get(0)
						.getBelongDistrictCode());
				planSchool.setSchoolId(Integer.toString(School_list.get(0)
						.getId()));
				planSchool.setSchoolName(School_list.get(0).getSchoolName());
				planSchool.setSchoolCode(School_list.get(0).getSchoolCode());
				planSchool.setSchoolType(School_list.get(0).getSchoolType());
				planSchool.setStatus("计划创建");
				planSchool.setBeginTime(Plan_list.get(0).getBeginTime());
				planSchool.setEndTime(Plan_list.get(0).getEndTime());
				planSchool.setIntroduce(Plan_list.get(0).getIntroduce());
				planschooldao.saveOrUpdate(planSchool);
			}
		}

		return "ture";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> queryByString(String hql) {
		return planschooldao.queryByString(hql);
	}

}
