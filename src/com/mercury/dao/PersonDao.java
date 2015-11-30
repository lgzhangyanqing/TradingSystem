package com.mercury.dao;

import com.mercury.beans.Person;

public interface PersonDao {
	public Person findPersonByEmail(String email);
}
