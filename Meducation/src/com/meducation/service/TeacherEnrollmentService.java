package com.meducation.service;

import java.util.List;

import com.meducation.ORM.ScoresRecord;
import com.meducation.ORM.SelectedItems;
import com.meducation.ORM.TeacherEnrollment;

public interface TeacherEnrollmentService {

	/** */
	public String saveOrUpdateData(TeacherEnrollment teacherenrollment);
	/** */
	public void delData(Integer id);
	/** */
	public TeacherEnrollment findById(Integer id);

	public List<TeacherEnrollment> findAllInfo();

	public List<TeacherEnrollment> findInfoByQuery(String qe);
	/** */
	public List<TeacherEnrollment> findInfoByPage(String qe, int pageNo,
			int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<TeacherEnrollment> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(SelectedItems selectedItems);

	public String saveScores(ScoresRecord scoresRecord);

}
