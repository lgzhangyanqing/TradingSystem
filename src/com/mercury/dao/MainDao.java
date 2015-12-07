package com.mercury.dao;

import java.util.List;

import com.mercury.beans.User;

public interface MainDao {
	public User findByName(String name);
	public void save(User user);
	public void update(User user);
	public void delete(User user);
	public List<User> queryAll();
}
