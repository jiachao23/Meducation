package com.meducation.util;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

@SuppressWarnings("unchecked")
public class MyBaseDaoSupport<T> implements MyBaseDao<T> {

	@Resource
	HibernateTemplate hibernateTemplate;

	@SuppressWarnings("rawtypes")
	private Class clazz = (Class) (((ParameterizedType) (this.getClass()
			.getGenericSuperclass())).getActualTypeArguments()[0]);

	/** 统计指定类的所有持久化对象 */
	@SuppressWarnings({"rawtypes"})
	public int countAll() {
		final String hql = "select count(*) from " + clazz.getSimpleName();
		Long count = (Long) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql);
				query.setMaxResults(1);
				return query.uniqueResult();
			}
		});
		return count.intValue();
	}

	/** 统计指定类的查询结果 */
	@SuppressWarnings({"rawtypes"})
	public int countQuery(String hql) {
		final String counthql = "select count(*) from " + clazz.getSimpleName()
				+ " as t where " + hql;
		Long count = (Long) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(counthql);
				query.setMaxResults(1);
				return query.uniqueResult();
			}
		});
		return count.intValue();
	}

	/** 删除指定ID的持久化对象 */
	public void delById(Serializable id) {
		hibernateTemplate.delete(hibernateTemplate.load(clazz, id));
	}

	/** 装载指定类的所有持久化对象 */
	@SuppressWarnings("rawtypes")
	public List listAll() {
		return hibernateTemplate.find("FROM " + clazz.getSimpleName());
	}

	/** 分页装载指定类的所有持久化对象 */
	@SuppressWarnings("rawtypes")
	public List listAll(int pageNo, int pageSize) {
		final int pNo = pageNo;
		final int pSize = pageSize;
		final String hql = "from " + clazz.getSimpleName()
				+ " as t order by t.id desc";
		List list = hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql);
				query.setMaxResults(pSize);
				query.setFirstResult((pNo - 1) * pSize);
				List result = query.list();
				if (!Hibernate.isInitialized(result))
					Hibernate.initialize(result);
				return result;
			}
		});
		return list;
	}

	/** 加载指定ID的持久化对象 */
	public Object loadById(Serializable id) {
		return hibernateTemplate.get(clazz, id);
	}

	/** 加载满足条件的持久化对象 */
	@SuppressWarnings({"rawtypes"})
	public Object loadObject(String hql) {
		final String hql1 = hql;
		Object obj = null;
		List list = hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql1);
				return query.list();
			}
		});
		if (list.size() > 0)
			obj = list.get(0);
		return obj;
	}

	/** 查询指定类的满足条件的持久化对象 */
	@SuppressWarnings({"rawtypes"})
	public List query(String hql) {

		final String hql1 = "FROM " + clazz.getSimpleName() + " t WHERE " + hql
				+ " order by t.id desc";
		return hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql1);
				return query.list();
			}
		});
	}

	@SuppressWarnings({"rawtypes"})
	public List queryByString(String hql) {
		final String hql1 = hql;
		return hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql1);
				return query.list();
			}
		});
	}

	/** 分页查询指定类的满足条件的持久化对象 */
	@SuppressWarnings({"rawtypes"})
	public List query(String hql, int pageNo, int pageSize) {
		final int pNo = pageNo;
		final int pSize = pageSize;
		final String hql1 = "FROM " + clazz.getSimpleName() + " t WHERE " + hql
				+ " order by t.id desc";
		return hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql1);
				query.setMaxResults(pSize);
				query.setFirstResult((pNo - 1) * pSize);
				List result = query.list();
				if (!Hibernate.isInitialized(result))
					Hibernate.initialize(result);
				return result;
			}
		});
	}

	@SuppressWarnings("rawtypes")
	public List queryByHql(String hql, int pageNo, int pageSize) {
		final int pNo = pageNo;
		final int pSize = pageSize;
		final String hql1 = hql;
		System.out.println(hql1);
		return hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql1);
				query.setMaxResults(pSize);
				query.setFirstResult((pNo - 1) * pSize);
				List result = query.list();
				if (!Hibernate.isInitialized(result))
					Hibernate.initialize(result);
				return result;
			}
		});
	}

	/** 保存或更新指定的持久化对象 */
	public void saveOrUpdate(Object obj) {
		hibernateTemplate.saveOrUpdate(obj);
	}

	/** 条件更新数据 */
	@SuppressWarnings({"rawtypes"})
	public int update(String hql) {
		final String hql1 = hql;
		return ((Integer) hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql1);
				return query.executeUpdate();
			}
		})).intValue();
	}

	/** 从连接池中取得一个JDBC连接 */
	@SuppressWarnings("deprecation")
	public Connection getConnection() {
		return hibernateTemplate.getSessionFactory().getCurrentSession()
				.connection();
	}

}
