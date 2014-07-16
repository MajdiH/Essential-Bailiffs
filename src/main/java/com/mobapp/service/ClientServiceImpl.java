package com.mobapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mobapp.exception.ClientNotFoundException;
import com.mobapp.model.Client;
import com.mobapp.repository.ClientRepository;

@Service
@Transactional(rollbackFor = { ClientNotFoundException.class })
public class ClientServiceImpl implements ClientService {
	
	@Autowired
	private ClientRepository clientRepository;
	
	@Override
	public Client create(Client client) {
		return clientRepository.save(client);
	}

	@Override
	public Client get(Integer id) {
		Client client = null;
		if (id instanceof Integer)
			client = clientRepository.findOne(id);
		if (client != null)
			return client;
		throw new ClientNotFoundException(id);
	}

	@Override
	public List<Client> getAll() {
		return clientRepository.findAll();
	}

	@Override
	public Client update(Client client) {
		Client clientToUpdate = get(client.getId());
		clientToUpdate.update(client);
		return clientToUpdate;
	}

	@Override
	public Client delete(Integer id) {
		Client client = get(id);
		clientRepository.delete(id);
		return client;
	}

}
