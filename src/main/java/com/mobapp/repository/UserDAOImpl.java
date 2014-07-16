package com.mobapp.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManagerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.mobapp.model.User;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private EntityManagerFactory entityManagerFactory;
	
	private Session getCurrentSession() {
		return entityManagerFactory.createEntityManager().unwrap(Session.class);
	}

	public User getUser(String username) {
		List<User> userList = new ArrayList<User>();
		Query query = getCurrentSession().createQuery("from User u where u.username = :username");
		query.setParameter("username", username);
		userList = query.list();
		if (userList.size() > 0)
			return userList.get(0);
		else
			return null;	
	}

}
