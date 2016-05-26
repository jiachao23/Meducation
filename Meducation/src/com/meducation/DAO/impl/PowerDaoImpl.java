package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.PowerDao;
import com.meducation.ORM.Power;
import com.meducation.util.MyBaseDaoSupport;

@Component("powerdao")
public class PowerDaoImpl extends MyBaseDaoSupport<Power> implements PowerDao {

}
