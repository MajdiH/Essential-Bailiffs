package com.mobapp.repository;

import com.mobapp.model.User;

public interface UserDAO {
	
	public User getUser(String username);

}
