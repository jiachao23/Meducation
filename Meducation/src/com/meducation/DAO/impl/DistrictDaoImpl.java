package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.DistrictDao;
import com.meducation.ORM.District;
import com.meducation.util.MyBaseDaoSupport;

@Component("districtdao")
public class DistrictDaoImpl extends MyBaseDaoSupport<District> implements
		DistrictDao {

}
