package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.SchoolDao;
import com.meducation.ORM.School;
import com.meducation.service.SchoolService;

@Service("schoolservice")
@Transactional
@RemoteProxy(name = "schoolservice")
public class SchoolServiceImpl implements SchoolService {
	@Resource
	private SchoolDao schooldao;

	@Override
	public String saveOrUpdateData(School school) {
		String hql = "update School t set t.schoolName='"
				+ school.getSchoolName() + "', t.schoolCode='"
				+ school.getSchoolCode() + "', t.schoolType='"
				+ school.getSchoolType() + "', t.schoolAddress='"
				+ school.getSchoolAddress() + "', t.belongDistrictName='"
				+ school.getBelongDistrictName() + "', t.belongDistrictCode='"
				+ school.getBelongDistrictCode() + "' where t.id="
				+ school.getId();
		schooldao.update(hql);
		return "true";
	}

	@Override
	public void delData(Integer id) {
		schooldao.delById(id);

	}

	@Override
	public School findById(Integer id) {
		return (School) schooldao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<School> findAllInfo() {
		return schooldao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<School> findInfoByQuery(String qe) {
		return schooldao.query(qe);
	}

	@Override
	public int countAll() {
		return schooldao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<School> browseAll(int pageNo, int pageSize) {
		return schooldao.listAll(pageNo, pageSize);
	}

	@Override
	public String saveData(School school) {
		schooldao.saveOrUpdate(school);
		return "ture";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<School> findInfoByPage(String qe, int pageNo, int pageSize) {
		return schooldao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return schooldao.countQuery(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> queryByString(String hql) {
		return schooldao.queryByString(hql);
	}

}
