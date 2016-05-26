package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.ApplyPowerDao;
import com.meducation.ORM.ApplyPower;
import com.meducation.util.MyBaseDaoSupport;

@Component("applypowerdao")
public class ApplyPowerDaoImpl extends MyBaseDaoSupport<ApplyPower>
		implements
			ApplyPowerDao {

}
