package com.mobapp.repository;

import javax.persistence.EntityManagerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.mobapp.model.Role;

@Repository
public class RoleDAOImpl implements RoleDAO {
	
	@Autowired
	private EntityManagerFactory entityManagerFactory;
	
	private Session getCurrentSession() {
		return entityManagerFactory.createEntityManager().unwrap(Session.class);
	}

	public Role getRole(int id) {
		Role role = (Role) getCurrentSession().load(Role.class, id);
		return role;
	}

}
