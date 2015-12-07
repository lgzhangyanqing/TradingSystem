package com.mercury.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.mercury.beans.Ownership;
import com.mercury.beans.OwnershipInfo;
import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.dao.OwnInfoDao;

public class OwnInfoDaoImpl implements OwnInfoDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void save(OwnershipInfo ois) {
		sessionFactory.getCurrentSession().save(ois);
	}

	@Override
	public void update(OwnershipInfo ois) {
		sessionFactory.getCurrentSession().update(ois);
	}

	@Override
	public void delete(OwnershipInfo ois) {
		sessionFactory.getCurrentSession().delete(ois);
	}

	@Override
	public void saveOrUpdate(OwnershipInfo ois) {
		sessionFactory.getCurrentSession().saveOrUpdate(ois);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OwnershipInfo> findOwnByUser(User user) {
		return sessionFactory.getCurrentSession().createCriteria(OwnershipInfo.class)
				.add(Restrictions.eq("own.user", user)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OwnershipInfo> findByStock(Stock stock) {
		return sessionFactory.getCurrentSession().createCriteria(OwnershipInfo.class)
				.add(Restrictions.eq("own.stock", stock)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OwnershipInfo> findByOwn(User user, Stock stock) {
		Ownership own = new Ownership();
		own.setUser(user);
		own.setStock(stock);
		return sessionFactory.getCurrentSession().createCriteria(OwnershipInfo.class)
				.add(Restrictions.eq("own", own)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OwnershipInfo> queryAll() {
		return sessionFactory.getCurrentSession().createCriteria(OwnershipInfo.class)
				.addOrder(Order.asc("own")).list();
	}
}
