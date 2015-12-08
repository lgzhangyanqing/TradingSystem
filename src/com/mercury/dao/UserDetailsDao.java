package com.mercury.dao;

import com.mercury.model.UserAttempts;

public interface UserDetailsDao {
	void updateFailAttempts(String username);

	void resetFailAttempts(String username);

	UserAttempts getUserAttempts(String username);

}
