package com.mercury.dao.impl;
import java.util.List;


import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.mercury.beans.User;
import com.mercury.dao.UserDao;

public class UserDaoImpl implements UserDao {
	/*private JdbcUtil util;
	
	public UserDaoImpl() {
		if (util==null) {
			util = new JdbcUtil();
		}
	}*/
	private SessionFactory factory;
	public SessionFactory getSessionFactory() {
		return factory;
	}
	public void setSessionFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		/*Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(user);
		tx.commit();*/
		factory.getCurrentSession().save(user);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		factory.getCurrentSession().update(user);
	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		factory.getCurrentSession().delete(user);
	}

	/*@Override
	public User findByEmail(String email) {
		String sql="select username, password, enabled from yfts_user where username=?";
		User user = new User();
		try {
			Connection conn = util.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email.toLowerCase());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user.setUserName(rs.getString("username"));
				user.setPassWord(rs.getString("password"));
				user.setAuthority(rs.getString("authority"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
		
	@Override
	public User findByUserName(String username) {
		String sql="select username, password, enabled from yfts_user where username=?";
		User user = new User();
		try {
			Connection conn = util.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user.setUserName(rs.getString("username"));
				user.setPassWord(rs.getString("password"));
				user.setAuthority(rs.getString("authority"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}*/
	@Override
	public User findByUid(int uid) {
		// TODO Auto-generated method stub
		return (User) factory.getCurrentSession().get(User.class, uid);
	}
	@Override
	public User findByUser(User user) {
		// TODO Auto-generated method stub
		return (User) factory.getCurrentSession().get(User.class, user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryAll() {
		// TODO Auto-generated method stub
		return factory.getCurrentSession().createCriteria(User.class)
				.addOrder(Order.asc("uid")).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		List<User> users = factory.getCurrentSession().createCriteria(User.class)
				.add(Restrictions.eq("email", email)).list();
		if(users.size() == 0)
			return null;
		return users.get(0);
	}
	@SuppressWarnings("unchecked")
	@Override
	public User findByUserName(String username) {
		// TODO Auto-generated method stub
		List<User> users = factory.getCurrentSession().createCriteria(User.class)
				.add(Restrictions.eq("userName", username)).list();
		if(users.size() == 0)
			return null;
		return users.get(0);
	}

}
