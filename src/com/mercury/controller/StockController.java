package com.mercury.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mercury.beans.Stock;
import com.mercury.beans.StockInfo;
import com.mercury.service.StockService;

//@Controller
public class StockController {
	/*@Autowired*/
	private StockService ss;
	
	//@Resource
	private List<Stock> stocks;
	//@Resource
	private List<StockInfo> si;
	
	//@RequestMapping(value="/market", method=RequestMethod.GET)
	//@ResponseBody
	public List<StockInfo> marketData() {
		stocks = ss.getAllStock();
		si= ss.getInfo(stocks);
		return si;
	}
}
