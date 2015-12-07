 package com.mercury.beans;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.hibernate.annotations.GenericGenerator;

import com.mercury.json.TimestampSerializer;

@Entity
@Table(name="YFTS_TRANS")
@AssociationOverrides(value = { 
		@AssociationOverride (name="own.user", joinColumns=@JoinColumn(name="USER_ID")),
		@AssociationOverride (name="own.stock", joinColumns=@JoinColumn(name="STOCK_ID")) })
public class Transaction {
	private int tid;
	private Ownership own = new Ownership();
	private int amount;
	private BigDecimal price;
	private Timestamp ts;
	
	public Transaction(){}	

	@Id
	@GeneratedValue(generator="trans_id_gen")
	@GenericGenerator(name="trans_id_gen", strategy="increment")
	@Column(name="TRANS_ID")
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	
	@Embedded
	public Ownership getOwn() {
		return own;
	}
	public void setOwn(Ownership own) {
		this.own = own;
	}
	
	@Transient
	public User getUser() {
		return getOwn().getUser();
	}
	public void setUser(User user) {
		getOwn().setUser(user);
	}
	
	@Transient
	public Stock getStock() {
		return getOwn().getStock();
	}
	public void setStock(Stock stock) {
		getOwn().setStock(stock);
	}
	
	@Column(name="AMOUNT")
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Column(name="PRICE")
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	@Column(name="TRANS_TIME")
	@JsonSerialize(using=TimestampSerializer.class)
	public Timestamp getTs() {
		return ts;
	}
	public void setTs(Timestamp ts) {
		this.ts = ts;
	}
	
	@Override
	public String toString(){
		return Integer.toString(getUser().getUid())+ ","+ Integer.toString(getStock().getSid())
				+","+Integer.toString(amount)+","+price.toString()+","
				+ts.toString();
	}

}
