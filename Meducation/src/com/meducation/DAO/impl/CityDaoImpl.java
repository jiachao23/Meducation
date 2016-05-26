package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.CityDao;
import com.meducation.ORM.City;
import com.meducation.util.MyBaseDaoSupport;

@Component("citydao")
public class CityDaoImpl extends MyBaseDaoSupport<City> implements CityDao {

}
