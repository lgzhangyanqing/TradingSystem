package com.mercury.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.mercury.beans.Stock;
import com.mercury.dao.StockDao;

@Repository
public class StockDaoImpl implements StockDao {
	@Resource
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void save(Stock stock) {
		sessionFactory.getCurrentSession().save(stock);
	}

	@Override
	public void delete(Stock stock) {
		sessionFactory.getCurrentSession().delete(stock);
	}

	@Override
	public Stock findBySid(int sid) {
		return (Stock) sessionFactory.getCurrentSession().get(Stock.class, sid);
	}

	@Override
	public Stock findBySymbol(String symbol) {
		return (Stock) sessionFactory.getCurrentSession().get(Stock.class, symbol);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Stock> queryAll() {
		System.out.println("123");
//		query.setCacheable(true);
		return sessionFactory.getCurrentSession().createCriteria(Stock.class)
				.addOrder(Order.asc("sid")).list();
	}
}
