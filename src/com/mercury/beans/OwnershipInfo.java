package com.mercury.beans;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.Transient;

/*
 * Embed Ownership bean as a field of join table in OwnershipInfo
 */
@Entity
@Table(name="YFTS_OWN")
@AssociationOverrides(value = { 
		@AssociationOverride (name="own.user", joinColumns=@JoinColumn(name="USER_ID")),
		@AssociationOverride (name="own.stock", joinColumns=@JoinColumn(name="STOCK_ID")) })
public class OwnershipInfo {
	private Ownership own = new Ownership();
	private Integer quantity;
	
	public OwnershipInfo() {}
	public OwnershipInfo(User user, Stock stock, Integer quantity){
		this.own.setUser(user);
		this.own.setStock(stock);
		this.quantity = quantity;
	}
		
	@EmbeddedId
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
	
	@Column(name="QUANTITY")
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	@Override
	public boolean equals(Object o){
		if (!(o instanceof OwnershipInfo)) return false;
		OwnershipInfo osi = (OwnershipInfo) o;
		if (this.own == null){
			if (osi.getOwn() != null) return false;
		}else {
			if (osi.getOwn() == null) return false;
			if (!this.own.equals(osi.getOwn())) return false;
		}
		return true;
	}
	
	@Override
	public int hashCode(){
		return getOwn()!=null ? getOwn().hashCode() : 0;
	}
}
