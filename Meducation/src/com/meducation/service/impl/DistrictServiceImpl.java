package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.DistrictDao;
import com.meducation.ORM.District;
import com.meducation.service.DistrictService;

@Service("districtservice")
@Transactional
@RemoteProxy(name = "districtservice")
public class DistrictServiceImpl implements DistrictService {
	@Resource
	private DistrictDao districtdao;

	@Override
	public String saveOrUpdateData(District district) {
		String hql = "update District t set t.districtCode='"
				+ district.getDistrictCode() + "', t.districtName='"
				+ district.getDistrictName() + "', t.belongCityCode='"
				+ district.getBelongCityCode() + "', t.belongCityName='"
				+ district.getBelongCityName() + "' where t.id="
				+ district.getId();
		districtdao.update(hql);

		return "true";

	}

	@Override
	public void delData(Integer id) {
		districtdao.delById(id);

	}

	@Override
	public District findById(Integer id) {
		return (District) districtdao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<District> findAllInfo() {
		return districtdao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<District> findInfoByQuery(String qe) {
		return districtdao.query(qe);
	}

	@Override
	public int countAll() {
		return districtdao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<District> browseAll(int pageNo, int pageSize) {
		return districtdao.listAll(pageNo, pageSize);
	}

	@Override
	public String saveData(District district) {
		districtdao.saveOrUpdate(district);
		return "ture";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<District> findInfoByPage(String qe, int pageNo, int pageSize) {
		return districtdao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return districtdao.countQuery(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> queryByString(String hql) {
		System.out.println(hql);
		return districtdao.queryByString(hql);
	}

}
