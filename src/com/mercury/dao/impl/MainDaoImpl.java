package com.mercury.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import com.mercury.beans.User;
import com.mercury.dao.MainDao;

public class MainDaoImpl implements MainDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public User findByName(String userName) {
		return (User) sessionFactory.getCurrentSession().load(User.class, userName);
	}

	@Override
	public void save(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public void update(User user) {
		sessionFactory.getCurrentSession().update(user);
	}

	@Override
	public void delete(User user) {
		sessionFactory.getCurrentSession().delete(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryAll() {
		return sessionFactory.getCurrentSession().createCriteria(User.class)
				.addOrder(Order.asc("uid")).list();
	}

}
