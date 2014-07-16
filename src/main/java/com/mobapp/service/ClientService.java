package com.mobapp.service;

import java.util.List;

import com.mobapp.exception.ClientNotFoundException;
import com.mobapp.model.Client;


public interface ClientService {

	public Client create(Client client);
	public Client get(Integer id) throws ClientNotFoundException;
	public List<Client> getAll();
	public Client update(Client client);
	public Client delete(Integer id);
}
