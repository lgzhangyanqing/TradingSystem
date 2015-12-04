package com.mercury.beans;

import java.util.List;

public class UserInfo {
	private String message;
	private List<User> users;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
}
