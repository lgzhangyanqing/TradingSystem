package com.mercury.beans;

public class Stock {
	private String id;
	private String name;
	private double price;
	private double change;
	private String pchange;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getChange() {
		return change;
	}
	public void setChange(double change) {
		this.change = change;
	}
	public String getPchange() {
		return pchange;
	}
	public void setPchange(String pchange) {
		this.pchange = pchange;
	}
	
}
