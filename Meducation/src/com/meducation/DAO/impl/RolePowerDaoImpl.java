package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.RolePowerDao;
import com.meducation.ORM.RolePower;
import com.meducation.util.MyBaseDaoSupport;

@Component("rolepowerdao")
public class RolePowerDaoImpl extends MyBaseDaoSupport<RolePower> implements
		RolePowerDao {

}
