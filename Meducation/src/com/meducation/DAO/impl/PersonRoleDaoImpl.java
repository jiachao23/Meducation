package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.PersonRoleDao;
import com.meducation.ORM.PersonRole;
import com.meducation.util.MyBaseDaoSupport;

@Component("personroledao")
public class PersonRoleDaoImpl extends MyBaseDaoSupport<PersonRole>
		implements
			PersonRoleDao {

}
