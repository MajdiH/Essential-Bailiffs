package com.mobapp.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobapp.repository.UserDAO;
import com.mobapp.repository.UserRepository;
import com.mobapp.exception.UserNotFoundException;
import com.mobapp.model.User;

@Service
@Transactional(rollbackFor = { UserNotFoundException.class })
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private UserRepository userRepository;

	public User getUser(String username) {
		return userDAO.getUser(username);
	}

	@Override
	public User create(User user) {
		return userRepository.save(user); 
	}

	@Override
	public List<User> getAll() {
		return userRepository.findAll();
	}

	@Override
	public User update(User user) {
		User userToUpdate = get(user.getId());
		userToUpdate.update(user);
		return userToUpdate;
	}

	@Override
	public User delete(Integer id) {
		User user = get(id);
		userRepository.delete(user);
		return user;
	}

	@Override
	public User get(Integer id) throws UserNotFoundException {
		User user = null;
		if (id instanceof Integer)
			user = userRepository.findOne(id);
		if (user != null)
			return user;
		throw new UserNotFoundException(id);
	}

}
