package com.mercury.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.Stock;
import com.mercury.beans.StockInfo;
import com.mercury.dao.StockDao;

//@Service
public class StockService {
	//@Autowired
	private StockDao sd;
	
	//@Transactional
	public List<Stock> getByName(String name){
		return sd.findBySymbol(name);
	}
	
	//@Transactional
	public List<Stock> getAllStock(){
		return sd.queryAll();
	}
	
	private static StockInfo getStockInfo(Stock stock) {
		String yahoo_quote = "http://finance.yahoo.com/d/quotes.csv?s=" + stock.getSymbol() + "&f=snc1l1p2&e=.c";
		String name = null;
		String pchange = null;
		double price = 0;
		double change = 0;
		try {
			URL url = new URL(yahoo_quote);
			URLConnection urlconn = url.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(urlconn.getInputStream()));
			String content = in.readLine();
			content = content.replace((char)34, (char)32);
			String[] tokens = content.split(",");
			pchange = tokens[tokens.length-1].trim();
			price = Double.parseDouble(tokens[tokens.length-2].trim());
			change = Double.parseDouble(tokens[tokens.length-3].trim());
			name = tokens[tokens.length-4].trim();
		} catch (Exception e) {
			e.printStackTrace();
		}
		StockInfo si = new StockInfo();
		si.setPchange(pchange);
		si.setName(name);
		si.setPrice(price);
		si.setChange(change);
		return si;
	}
	/*public static void marketData(List<Stock> stocks) {
		for (Stock stock:stocks) {
			getStockInfo(stock);
		}
	}*/
	
	//get real time stockInfo
		public List<StockInfo> getInfo(List<Stock> stocks) {
			List<StockInfo> sf = new ArrayList<StockInfo>();
			for (Stock s : stocks) {
				StockInfo info = getStockInfo(s);
				if (info != null && info.getName() != "") 
					sf.add(info);
			}
			return sf;
		}
}
