package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.TrainingAgencyDao;
import com.meducation.ORM.TrainingAgency;
import com.meducation.service.TrainingAgencyService;

@Service("trainingagencyservice")
@Transactional
@RemoteProxy(name = "trainingagencyservice")
public class TrainingAgencyServiceImpl implements TrainingAgencyService {
	@Resource
	private TrainingAgencyDao trainingagencydao;

	@Override
	@RemoteMethod
	public String saveOrUpdateData(TrainingAgency trainingagency) {
		String hql = "update TrainingAgency t set t.agenceName='"
				+ trainingagency.getAgenceName() + "', t.agenceIntroduce='"
				+ trainingagency.getAgenceIntroduce() + "', t.agenceCode='"
				+ trainingagency.getAgenceCode() + "', t.agengcePerson='"
				+ trainingagency.getAgengcePerson() + "', t.tel='"
				+ trainingagency.getTel() + "' where t.id="
				+ trainingagency.getId();
		trainingagencydao.update(hql);

		return "ture";
	}

	@Override
	public void delData(Integer id) {
		trainingagencydao.delById(id);

	}

	@Override
	public TrainingAgency findById(Integer id) {
		return (TrainingAgency) trainingagencydao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingAgency> findAllInfo() {
		return trainingagencydao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingAgency> findInfoByQuery(String qe) {
		return trainingagencydao.query(qe);
	}

	@Override
	public int countAll() {
		return trainingagencydao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingAgency> browseAll(int pageNo, int pageSize) {
		return trainingagencydao.listAll(pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return trainingagencydao.countQuery(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingAgency> findInfoByPage(String qe, int pageNo,
			int pageSize) {
		return trainingagencydao.query(qe, pageNo, pageSize);
	}

	@Override
	public String saveData(TrainingAgency trainingAgency) {
		trainingagencydao.saveOrUpdate(trainingAgency);
		return "ture";
	}
	@SuppressWarnings("rawtypes")
	public List queryByString(String hql) {
		return trainingagencydao.queryByString(hql);
	}

}
