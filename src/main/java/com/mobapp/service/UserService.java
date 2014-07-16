package com.mobapp.service;

import java.util.List;

import com.mobapp.exception.UserNotFoundException;
import com.mobapp.model.User;

public interface UserService {
	
	public User getUser(String username);
	public User create(User user);
	public User get(Integer id) throws UserNotFoundException;
	public List<User> getAll();
	public User update(User user);
	public User delete(Integer id);

}
