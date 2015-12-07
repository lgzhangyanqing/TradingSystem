package com.mercury.beans;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Embeddable
public class Ownership implements Serializable{
	private User user;
	private Stock stock;
	
	public Ownership () {}
	
	@ManyToOne
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne
	public Stock getStock() {
		return stock;
	}
	public void setStock(Stock stock) {
		this.stock = stock;
	}

	@Override
	public boolean equals(Object o){
		if (!(o instanceof Ownership)) return false;
		Ownership os = (Ownership) o;
		if (this.user == null){
			if (os.user != null) return false;			
		}else {
			if (os.user == null) return false;
			if (this.stock == null){
				if (os.stock != null) return false;
			}else {
				if (os.stock == null) return false;
				if (!this.user.equals(os.user) || !this.stock.equals(os.stock)) {
					return false;
				}
			}
		}
		return true;
	}
	
	@Override
	public int hashCode(){
		int hash = user !=null ? user.hashCode() : 0; 
		hash = 31 * hash + (stock!=null ? stock.hashCode() : 0);
		return hash;
	}
}
