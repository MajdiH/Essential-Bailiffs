package com.mobapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mobapp.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}
