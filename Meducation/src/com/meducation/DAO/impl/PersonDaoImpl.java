package com.meducation.DAO.impl;

import org.springframework.stereotype.Component;

import com.meducation.DAO.PersonDao;
import com.meducation.ORM.Person;
import com.meducation.util.MyBaseDaoSupport;

@Component("persondao")
public class PersonDaoImpl extends MyBaseDaoSupport<Person> implements PersonDao{

}
