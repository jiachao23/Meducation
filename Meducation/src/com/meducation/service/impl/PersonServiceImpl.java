package com.meducation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.PersonDao;
import com.meducation.ORM.Person;
import com.meducation.service.PersonService;
import com.meducation.util.MD5Impl;

@Service("personservice")
@Transactional
@RemoteProxy(name = "personservice")
public class PersonServiceImpl implements PersonService {

	@Resource
	private PersonDao persondao;
	MD5Impl md5 = new MD5Impl();

	@Override
	@RemoteMethod
	public void saveOrUpdateUser(Person person) {
		persondao.saveOrUpdate(person);
	}

	@Override
	@RemoteMethod
	public String save(Person person) {

		String md5pw = md5.GetMD5Code(person.getPassword());
		person.setPassword(md5pw);
		persondao.saveOrUpdate(person);
		return "ture";
	}

	@Override
	public void delPerson(Integer id) {
		persondao.delById(id);
	}

	@Override
	@RemoteMethod
	public Person findPersonById(Integer id) {
		return (Person) persondao.loadById(id);
	}

	@Override
	@RemoteMethod
	public boolean updatePersonInfo(Person person) {
		String hql = "update Person t set t.loginName='"
				+ person.getLoginName() + "', t.realName='"
				+ person.getRealName() + "', t.workPlace='"
				+ person.getWorkPlace() + "', t.sex='" + person.getSex()
				+ "', t.tel='" + person.getTel() + "', t.email='"
				+ person.getEmail() + "', t.address='" + person.getAddress()
				+ "', t.code='" + person.getCode() + "' where t.identifyNum='"
				+ person.getIdentifyNum() + "'";
		persondao.update(hql);
		return true;

	}

	@Override
	@RemoteMethod
	public boolean updatePersonPW(String PW) {
		String hql = "update Person t set t.password='"
				+ md5.GetMD5Code(PW)
				+ "' where t.identifyNum='"
				+ ServletActionContext.getRequest().getSession()
						.getAttribute("identifyNum") + "'";
		persondao.update(hql);
		return true;

	}

	@Override
	@RemoteMethod
	public boolean updatePersonPW(String PW, String ID) {
		String hql = "update Person t set t.password='" + md5.GetMD5Code(PW)
				+ "' where t.identifyNum='" + ID + "'";
		persondao.update(hql);
		return true;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> findAllPersonInfo() {
		return persondao.listAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> findPersonInfo(String qe) {
		return persondao.query(qe);
	}

	@SuppressWarnings("unchecked")
	@RemoteMethod
	public boolean PersonExist(String hql) {
		List<Person> actlist = persondao.query(hql);
		if (actlist.size() == 0)
			return false;

		return true;
	}

	@SuppressWarnings("unchecked")
	@RemoteMethod
	public List<Person> PersonEExist(String hql) {
		System.out.println(hql);
		List<Person> actlist = persondao.query(hql);
		return actlist;
	}

	@SuppressWarnings("unchecked")
	@RemoteMethod
	public boolean PersonExistPW(String pw) {
		String hql = "t.identifyNum='"
				+ ServletActionContext.getRequest().getSession()
						.getAttribute("identifyNum") + "' and t.password='"
				+ md5.GetMD5Code(pw) + "'";
		List<Person> actlist = persondao.query(hql);
		if (actlist.size() == 0)
			return false;

		return true;
	}

	@Override
	public int countPerson() {
		return persondao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> browsePerson(int pageNo, int pageSize) {
		return persondao.listAll(pageNo, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> queryByString(String hql) {
		return persondao.queryByString(hql);
	}

	@Override
	public int countAll() {
		return persondao.countAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> browseAll(int pageNo, int pageSize) {
		return persondao.listAll(pageNo, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> findInfoByPage(String qe, int pageNo, int pageSize) {
		return persondao.query(qe, pageNo, pageSize);
	}

	@Override
	public int countByquery(String hql) {
		return persondao.countQuery(hql);
	}

	@Override
	public Person findById(Integer id) {
		return (Person) persondao.loadById(id);
	}

	@Override
	public int updata(String hql) {
		return persondao.update(hql);
	}

}
