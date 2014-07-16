package com.mobapp.exception;

public class ClientNotFoundException extends RuntimeException{
	
	private static final long serialVersionUID = -2859292084648724403L;
	private final int clientId;

	public ClientNotFoundException(int id) {
		clientId = id;
	}
	
	public int getClientId() {
		return clientId;
	}

}
