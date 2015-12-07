package com.mercury.beans;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

@SuppressWarnings("serial")
@Entity
@Table(name="YFTS_STOCK")
public class Stock implements Serializable{
	private int sid;
	private String symbol;
	private String stockDesc;
	private Set<OwnershipInfo> owns = new HashSet<OwnershipInfo>();
	private Set<Transaction> trans = new HashSet<Transaction>();
	
	@Id
	@GeneratedValue(generator="stock_id_gen")
	@GenericGenerator(name="stock_id_gen", strategy="increment")
	@Column(name="STOCK_ID")
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	
	@Column(name="SYMBOL")
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	
	@Column(name="STOCKNAME")
	public String getStockDesc() {
		return stockDesc;
	}
	public void setStockDesc(String stockDesc) {
		this.stockDesc = stockDesc;
	}
	
	@JsonIgnore
	@OneToMany(mappedBy="own.stock", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	public Set<OwnershipInfo> getOwns() {
		return owns;
	}
	public void setOwns(Set<OwnershipInfo> owns) {
		this.owns = owns;
	}
	public void addOwns(OwnershipInfo osi){
		owns.add(osi);
	}
	public void removeOwns(OwnershipInfo osi){
		owns.remove(osi);
	}
	
	@JsonIgnore
	@OneToMany(mappedBy="own.stock", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	public Set<Transaction> getTrans() {
		return trans;
	}
	public void setTrans(Set<Transaction> trans) {
		this.trans = trans;
	}
	public void addTrans(Transaction tran){
		trans.add(tran);
	}
	public void removeTrans(Transaction tran){
		trans.remove(tran);
	}
}
