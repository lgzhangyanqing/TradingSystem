package com.mercury.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.User;
import com.mercury.beans.UserInfo;
import com.mercury.dao.UserDao;

@Service
public class MainService {
	@Autowired
	private UserDao ud;
	
	public UserDao getMd() {
		return ud;
	}
	public void setMd(UserDao ud) {
		this.ud = ud;
	}
	
	@Transactional
	public UserInfo process(User user) {
		ud.save(user);
		UserInfo userInfo = new UserInfo();
		userInfo.setMessage("Hello " + user.getUserName() + ", welcome to YFTS!");
		userInfo.setUsers(ud.queryAll());
		return userInfo;
	}
}
