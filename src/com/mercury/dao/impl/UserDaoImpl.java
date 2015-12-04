package com.mercury.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.mercury.beans.User;
import com.mercury.dao.UserDao;

public class UserDaoImpl implements UserDao {
private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
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

	@Override
	public User findByUid(int uid) {
		// TODO Auto-generated method stub
		return (User) sessionFactory.getCurrentSession().get(User.class, uid);
	}

	@SuppressWarnings("unchecked")
	@Override
	public User findByUserName(String username) {
		// TODO Auto-generated method stub
		List<User> users = sessionFactory.getCurrentSession().createCriteria(User.class)
				.add(Restrictions.eq("userName", username)).list();
		if(users.size() == 0)
			return null;
		return users.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		List<User> users = sessionFactory.getCurrentSession().createCriteria(User.class)
				.add(Restrictions.eq("email", email)).list();
		if(users.size() == 0)
			return null;
		return users.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryAll() {
		return sessionFactory.getCurrentSession().createCriteria(User.class)
				.addOrder(Order.asc("uid")).list();
	}
	
	@Override
	public User findByUser(User user) {
		// TODO Auto-generated method stub
		return (User) sessionFactory.getCurrentSession().get(User.class, user);
	}
}
