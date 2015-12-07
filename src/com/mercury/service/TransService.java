package com.mercury.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.OwnershipInfo;
import com.mercury.beans.Stock;
import com.mercury.beans.Transaction;
import com.mercury.beans.User;
import com.mercury.dao.OwnInfoDao;
import com.mercury.dao.StockDao;
import com.mercury.dao.TransDao;
import com.mercury.dao.UserDao;

@Service
public class TransService {
	private final String csvName = "\\pending.csv";
	
	@Autowired
	private UserDao ud;
	@Autowired
	private StockDao sd;
	@Autowired
	private TransDao td;
	@Autowired 
	private OwnInfoDao od;
	@Autowired
	private CsvUtil cu;
	
	public TransDao getTd() {
		return td;
	}
	public void setTd(TransDao td) {
		this.td = td;
	}	
	public OwnInfoDao getOd() {
		return od;
	}
	public void setOd(OwnInfoDao od) {
		this.od = od;
	}
	
	@Transactional
	public void addTransaction(Transaction trans){
		td.saveTransaction(trans);
	}
	
	@Transactional
	public void addTransaction(List<Transaction> trans){
		for (Transaction tran:trans){
			addTransaction(tran);
		}
	}
	
	@Transactional
	public void removeTransaction(Transaction trans){
		td.deleteTransaction(trans);
	}
	
	@Transactional
	public void removeTransaction(List<Transaction> trans){
		for (Transaction tran:trans){
			removeTransaction(tran);
		}
	}

	@Transactional
	public List<Transaction> queryByUser(User user){
		return td.queryByUser(user);
	}
	
	@Transactional
	public List<Transaction> queryByStock(Stock stock){
		return td.queryByStock(stock);
	}
	
	@Transactional
	public List<Transaction> queryAll(){
		return td.queryAll();
	}
	
	@Transactional
	public List<Transaction> getAllPendings(String path){
		List<Transaction> list = cu.parseCSV(path + csvName);
		return list;
	}
	
	@Transactional
	public List<Transaction> findPendingByUser(User user, String path){
		List<Transaction> list = getAllPendings(path);
		List<Transaction> newList = new ArrayList<Transaction>();
		for (Transaction t: list){
			if (t.getUser().getUid() == user.getUid()){
				newList.add(t);
			}
		}
		return newList;
	}
	
	//Add new pending transaction to csv file, deduct balance
	@Transactional
	public void createPending(Transaction trans, String path){
		User user = trans.getUser();
		int balance = user.getBalance();
		int amount = trans.getAmount();
		double price = trans.getPrice().doubleValue();
		balance = (int) Math.round(balance - price * amount);
		if (balance < 0) balance = 0;
		user.setBalance(balance);
		ud.update(user);
		cu.appendCSV(trans, path + csvName);
	}
	
	/*Commit pending transaction in csv file, save it to database, 
	 * update balance and ownership
	 */
	@Transactional
	public void commitPending(int transIndex, String path){
		//Parsing pending to transaction
		List<Transaction> transList = getAllPendings(path);
		Transaction tx = transList.get(transIndex);
		User user = tx.getUser();
		Stock stock = tx.getStock();
		List<OwnershipInfo> ownList = od.findByOwn(user, stock);
		
		//Calculate the quantity after transaction
		int amount = tx.getAmount();
		if (ownList == null || ownList.size() == 0){			
			if (amount > 0){
				OwnershipInfo ois = new OwnershipInfo(user, stock, amount < 0 ? 0 : amount);
				user.addOwns(ois);
			}
		}else {
			amount = ownList.get(0).getQuantity() + amount;
			if (amount > 0){
				for (OwnershipInfo ois: user.getOwns()){
					if (ois.getOwn().getStock().getSid() == stock.getSid()){
						ois.setQuantity(amount);
					}
				}
			}else{
				user.removeOwns(ownList.get(0));
				od.delete(ownList.get(0));
			}
		}
		//Calculate and update balance after transaction
		int balance = user.getBalance();
		balance = balance - 5;
		if (balance < 0) balance = 0;
		user.setBalance(balance);
		user.addTrans(tx);			//Save transaction to databse
		ud.update(user);
	}
	
	@Transactional
	public void commitPendings(List<Integer> transList, String path){
		for (int i: transList){
			commitPending(i, path);
		}
		dropPendings(transList, path, false);
	}
	
	//Delete pending transaction from csv file
	@Transactional
	public void dropPending(int transIndex, String path, boolean reimberse){
		List<Transaction> list = getAllPendings(path);
		if (reimberse){
			Transaction tran = list.get(transIndex);
			User user = tran.getUser();
			int balance = user.getBalance();
			int amount = tran.getAmount();
			double price = tran.getPrice().doubleValue();
			balance = (int) Math.round(balance + price * amount);
			if (balance < 0) balance = 0;
			user.setBalance(balance);
			ud.update(user);
		}		
		
		list.remove(transIndex);
		cu.rewriteCSV(list, path + csvName);
	}
	
	//Delete pending transactions from csv file
	@Transactional
	public void dropPendings(List<Integer> indexes, String path, boolean reimberse){
		List<Transaction> list = getAllPendings(path);
		List<Transaction> newList = new ArrayList<Transaction>();
		List<Transaction> restore = new ArrayList<Transaction>();
		for (int i=0; i<list.size(); i++){
			if (!indexes.contains(i) ){
				newList.add(list.get(i));
			}else{
				restore.add(list.get(i));
			}
		}
		if (reimberse){
			for (Transaction tran: restore){
				User user = tran.getUser();
				int balance = user.getBalance();
				int amount = tran.getAmount();
				double price = tran.getPrice().doubleValue();
				balance = (int) Math.round(balance + price * amount);
				if (balance < 0) balance = 0;
				user.setBalance(balance);
				ud.update(user);
			}
		}
		cu.rewriteCSV(newList, path + csvName);
	}
}
