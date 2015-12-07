package com.mercury.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mercury.beans.OwnershipInfo;
import com.mercury.beans.Stock;
import com.mercury.beans.StockInfo;
import com.mercury.service.StockService;

@Controller
@SessionAttributes
public class StockController {
	@Autowired
	private StockService ss;
	
	public StockService getSs() {
		return ss;
	}

	public void setSs(StockService ss) {
		this.ss = ss;
	}

	//@Resource
	private List<Stock> stocks;
	//@Resource
	private List<StockInfo> si;
	
	@RequestMapping(value="/market", method=RequestMethod.GET)
	@ResponseBody
	public List<StockInfo> marketData() {
		stocks = ss.getAllStock();
		si= ss.getInfo(stocks);
		return si;
	}
	@RequestMapping(value="/stock")
	public String listAllStock(){
		return "stock";
	}
	
	@RequestMapping(value="/getStock", method=RequestMethod.GET)
	@ResponseBody
	public List<Stock> getStock(){
		return ss.getAllStock();
	}
	
	@RequestMapping(value="/stockOwned", method=RequestMethod.GET)
	@ResponseBody
	public List<OwnershipInfo> getAllOwn(){
		return ss.getAllOwn();
	}
	
	//Delete a certain stock
	@RequestMapping(value="/stock", params="delete", method=RequestMethod.POST)
	public String deleteStock(@RequestParam("delete") int sid) throws Exception {
		Stock stock = ss.loadById(sid);
		ss.removeStock(stock);
		return "redirect:stock";
	}
	
	@RequestMapping(value="/validateStock", method=RequestMethod.POST, produces="text/plain")
	@ResponseBody
	public String validateStock(@RequestBody Stock stock){
		String status = "valid";
		if (stock != null){
			if(!ss.realStock(stock)){
				status = "Not a valid stock!";
			}else if (ss.hasStock(stock)){
				status = "Stock already exists!";
			}
		}
		return status;
	}	
	
	@RequestMapping(value="/addStock", method=RequestMethod.POST)
	public String addStock(@ModelAttribute("stock") Stock stock, BindingResult result){
		ss.addStock(stock);
		return "redirect:stock";
	}
}
