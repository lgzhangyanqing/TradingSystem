package com.mercury.dao.impl;

import com.mercury.beans.Person;
import com.mercury.dao.PersonDao;
import com.mercury.utils.JdbcUtil;

import java.sql.*;

public class PersonDaoImpl implements PersonDao {
	private JdbcUtil util;
	
	public PersonDaoImpl() {
		if (util==null) {
			util = new JdbcUtil();
		}
	}
	@Override
	public Person findPersonByEmail(String email) {
		// TODO Auto-generated method stub
		String sql = "select username, password, authority from users u, user_roles r " +
				"where u.user_id=r.user_id and username=?";
		Person person = new Person();
		try {
			Connection conn = util.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email.toLowerCase());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				person.setUsername(rs.getString("username"));
				person.setPassword(rs.getString("password"));
				person.setAuthority(rs.getString("authority"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return person;
	}

}
