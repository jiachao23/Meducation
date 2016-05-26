package com.meducation.service;

import java.util.List;

import com.meducation.ORM.TrainingPlan;

public interface PlanService {

	/** */
	public String saveOrUpdateData(TrainingPlan plan);
	/** */
	public void delData(Integer id);
	/** */
	public TrainingPlan findById(Integer id);

	public List<TrainingPlan> findAllInfo();

	public List<TrainingPlan> findInfoByQuery(String qe);
	/** */
	public List<TrainingPlan> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<TrainingPlan> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(TrainingPlan plan);

	public List<TrainingPlan> queryByString(String qe);

	public int updata(String hql);
}
