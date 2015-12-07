package com.mercury.dao;

import java.util.List;

import com.mercury.beans.Stock;
import com.mercury.beans.Transaction;
import com.mercury.beans.User;

public interface TransDao {
	public void saveTransaction(Transaction trans);
	public void deleteTransaction(Transaction trans);
	public List<Transaction> queryByUser(User user);
	public List<Transaction> queryByStock(Stock stock);
	public List<Transaction> queryAll();
}
