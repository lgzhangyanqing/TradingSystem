package com.mercury.finance;

import java.io.*;
import java.net.*;
import java.util.List;

import com.mercury.beans.Stock;

public class YahooFinance {
	private static void getPrice(Stock stock) {
		String yahoo_quote = "http://finance.yahoo.com/d/quotes.csv?s=" + stock.getId() + "&f=snc1l1p2&e=.c";
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
		stock.setPchange(pchange);
		stock.setName(name);
		stock.setPrice(price);
		stock.setChange(change);
	}
	public static void marketData(List<Stock> stocks) {
		for (Stock stock:stocks) {
			getPrice(stock);
		}
	}
}
