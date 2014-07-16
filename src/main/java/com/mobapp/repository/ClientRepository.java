package com.mobapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mobapp.model.Client;


public interface ClientRepository extends JpaRepository<Client, Integer> {

}
