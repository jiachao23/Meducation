package com.meducation.service;

import java.util.List;

import com.meducation.ORM.Person;

public interface PersonService {

	/** 更新操作 */
	public void saveOrUpdateUser(Person person);

	/** 删除操作 */
	public void delPerson(Integer id);

	/** 查询单个用户 */
	public Person findPersonById(Integer id);

	/** 更新操作 */
	public boolean updatePersonInfo(Person person);

	public boolean updatePersonPW(String PW);

	public List<Person> findAllPersonInfo();

	public List<Person> findPersonInfo(String qe);

	public int countPerson();

	public List<Person> browsePerson(int pageNo, int pageSize);

	public String save(Person person);

	public List<Person> PersonEExist(String hql);

	public boolean PersonExist(String hql);

	public boolean PersonExistPW(String pw);

	public List<Object[]> queryByString(String hql);

	public boolean updatePersonPW(String PW, String ID);

	public List<Person> findInfoByPage(String qe, int pageNo, int pageSize);
	/** */
	public int countAll();
	/** */
	public int countByquery(String hql);

	public List<Person> browseAll(int pageNo, int pageSize);

	public Person findById(Integer id);

	public int updata(String hql);
}
