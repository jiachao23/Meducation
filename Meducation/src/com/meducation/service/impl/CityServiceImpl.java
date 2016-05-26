package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.CityDao;
import com.meducation.ORM.City;
import com.meducation.service.CityService;

@Service("cityservice")
@Transactional
@RemoteProxy(name = "cityservice")
public class CityServiceImpl implements CityService {
	@Resource
	private CityDao citydao;

	@Override
	@RemoteMethod
	public String saveOrUpdateData(City city) {
		String hql = "update City t set t.cityName='" + city.getCityName()
				+ "', t.cityCode='" + city.getCityCode() + "' where t.id="
				+ city.getId();
		citydao.update(hql);
		return "ture";
	}

	@Override
	@RemoteMethod
	public void delData(Integer id) {
		citydao.delById(id);
	}

	@Override
	public City findById(Integer id) {
		return (City) citydao.loadById(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<City> findAllInfo() {
		return citydao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	@RemoteMethod
	public List<City> findInfoByQuery(String qe) {
		return citydao.query(qe);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<City> findInfoByPage(String qe, int pageNo, int pageSize) {
		return citydao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countAll() {
		return citydao.countAll();
	}

	@Override
	public int countByquery(String hql) {
		return citydao.countQuery(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<City> browseAll(int pageNo, int pageSize) {
		return citydao.listAll(pageNo, pageSize);
	}

	@Override
	@RemoteMethod
	public String saveData(City city) {
		citydao.saveOrUpdate(city);
		return "ture";
	}

}
