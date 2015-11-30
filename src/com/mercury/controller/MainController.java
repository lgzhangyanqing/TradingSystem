package com.mercury.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mercury.beans.Stock;
import com.mercury.finance.YahooFinance;

@Controller
public class MainController {
	@Resource
	private List<Stock> stocks;
	
	@RequestMapping(value="/market", method=RequestMethod.GET)
	@ResponseBody
	public List<Stock> marketData() {
		YahooFinance.marketData(stocks);
		return stocks;
	}
}
