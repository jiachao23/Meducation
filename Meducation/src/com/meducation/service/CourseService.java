package com.meducation.service;

import java.util.List;

import com.meducation.ORM.Course;

public interface CourseService {

	/** */
	public String saveOrUpdateData(Course course);
	/** */
	public void delData(Integer id);
	/** */
	public Course findById(Integer id);

	public List<Course> findAllInfo();

	public List<Course> findInfoByQuery(String qe);
	/** */
	public List<Course> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);
	/** */
	public List<Course> browseAll(int pageNo, int pageSize);
	/** */
	public String saveData(Course course);

}
