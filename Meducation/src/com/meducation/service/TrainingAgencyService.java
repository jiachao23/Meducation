package com.meducation.service;

import java.util.List;

import com.meducation.ORM.TrainingAgency;

public interface TrainingAgencyService {

	/** */
	public String saveOrUpdateData(TrainingAgency trainingagency);
	/** */
	public void delData(Integer id);
	/** */
	public TrainingAgency findById(Integer id);

	public List<TrainingAgency> findAllInfo();

	public List<TrainingAgency> findInfoByQuery(String qe);
	/** */
	public List<TrainingAgency> findInfoByPage(String qe, int pageNo,
			int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<TrainingAgency> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(TrainingAgency trainingAgency);

	@SuppressWarnings("rawtypes")
	public List queryByString(String hql);

}
