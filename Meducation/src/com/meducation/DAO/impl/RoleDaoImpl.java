package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.RoleDao;
import com.meducation.ORM.Role;
import com.meducation.util.MyBaseDaoSupport;

@Component("roledao")
public class RoleDaoImpl extends MyBaseDaoSupport<Role> implements RoleDao {

}
