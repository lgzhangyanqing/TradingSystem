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
@Table(name="YFTS_USER")
public class User implements Serializable{
	private int uid;
	private String userName;
	private String passWord;
	private String email;
	private String firstName;
	private String lastName;
	private int balance;
	private String authority;
	private int enabled;
	private Set<OwnershipInfo> owns = new HashSet<OwnershipInfo>();
	private Set<Transaction> trans = new HashSet<Transaction>();

	@Id
	@GeneratedValue(generator="user_id_gen")
	@GenericGenerator(name="user_id_gen", strategy="increment")
	@Column(name="USER_ID")
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	@Column(name="USERNAME")
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Column(name="PASSWORD")
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	@Column(name="EMAIL")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="FIRSTNAME")
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	@Column(name="LASTNAME")
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	@Column(name="BALANCE")
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	@Column(name="AUTHORITY")
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	@Column(name="ENABLED")
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	@JsonIgnore
	@OneToMany(mappedBy="own.user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
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
	@OneToMany(mappedBy="own.user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
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
