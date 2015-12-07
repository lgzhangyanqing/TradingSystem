package com.mercury.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.mercury.beans.Stock;
import com.mercury.beans.Transaction;
import com.mercury.beans.User;
import com.mercury.dao.TransDao;

public class TransDaoImpl implements TransDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void saveTransaction(Transaction trans) {
		sessionFactory.getCurrentSession().save(trans);
	}

	@Override
	public void deleteTransaction(Transaction trans) {
		sessionFactory.getCurrentSession().delete(trans);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Transaction> queryByUser(User user) {
		return sessionFactory.getCurrentSession().createCriteria(Transaction.class)
				.add(Restrictions.eq("own.user", user)).addOrder(Order.asc("tid")).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Transaction> queryByStock(Stock stock) {
		return sessionFactory.getCurrentSession().createCriteria(Transaction.class)
				.add(Restrictions.eq("own.stock", stock)).addOrder(Order.asc("tid")).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Transaction> queryAll() {
		return sessionFactory.getCurrentSession().createCriteria(Transaction.class)
				.addOrder(Order.asc("tid")).list();
	}
}
