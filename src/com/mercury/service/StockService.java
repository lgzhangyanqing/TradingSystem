package com.mercury.service;

import java.io.*;
import java.net.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.OwnershipInfo;
import com.mercury.beans.Stock;
import com.mercury.beans.StockInfo;
import com.mercury.dao.OwnInfoDao;
import com.mercury.dao.StockDao;

@Service
public class StockService {
	@Autowired
	private StockDao sd;
	@Autowired
	private OwnInfoDao od;

	public StockDao getSd() {
		return sd;
	}
	public void setSd(StockDao sd){
		this.sd = sd;
	}	
	public OwnInfoDao getOd() {
		return od;
	}
	public void setOd(OwnInfoDao od) {
		this.od = od;
	}
	
	public boolean realStock(Stock stock){
		StockInfo stockInfo = getStockInfo(stock);
		if(stockInfo != null && stockInfo.getStockName() != ""){
			return true;
		}
		return false;
	}
	
	@Transactional
	public void addStock(Stock stock){
		stock.setSymbol(stock.getSymbol().toUpperCase());
		sd.save(stock);
	}
	
	@Transactional
	public void removeStock(Stock stock){
		sd.delete(stock);
	}
	
	@Transactional
	public Stock loadById(int id){
		return sd.findBySid(id);
	}
	
	@Transactional
	public List<Stock> getByName(String name){
		return sd.findBySymbol(name);
	}
	
	@Transactional
	public List<Stock> getAllStock(){
		return sd.queryAll();
	}
	
	@Transactional
	public List<OwnershipInfo> getAllOwn(){
		return od.queryAll();
	}
	
	@Transactional
	public boolean hasStock(Stock stock){
		List<Stock> s = getByName(stock.getSymbol().toUpperCase());
		if (s == null || s.size() == 0){
			return false;
		}else{
			return true;
		}
	}
	
	public StockInfo getStockInfo(Stock stock) {
		String yahoo_quote = "http://finance.yahoo.com/d/quotes.csv?s=" + stock.getSymbol() + "&f=snc1l1p2&e=.c";
		String pchange = null;
		String name = null;
		double price = 0;
		double change = 0;
		try {
			URL url = new URL(yahoo_quote);
			URLConnection urlconn = url.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(urlconn.getInputStream()));
			String content = in.readLine();
			System.out.println(content);
			content = content.replace((char)34, (char)32);//' ' replace '"'
			String[] tokens = content.split(",");			
			pchange = tokens[tokens.length-1].trim();
			price = Double.parseDouble(tokens[tokens.length-2].trim());
			change = Double.parseDouble(tokens[tokens.length-3].trim());
			name =  tokens[tokens.length-4].trim();
		}catch (Exception e) {
				e.printStackTrace();
			}
			StockInfo si = new StockInfo();
			si.setStock(stock);
			si.setStockName(name);
			si.setPchange(pchange);
			si.setPrice(price);
			si.setChange(change);
			return si;	
	}
	
	//get real time stockInfo
	public List<StockInfo> getInfo(List<Stock> stocks) {
		List<StockInfo> sf = new ArrayList<StockInfo>();
		for (Stock s : stocks) {
			StockInfo info = getStockInfo(s);
			if (info != null && info.getStockName() != "") sf.add(info);
		}
		return sf;
	}
}
