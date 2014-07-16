package com.mobapp.exception;

public class ObservationNotFoundException extends RuntimeException {

	private static final long serialVersionUID = -2859292084648724403L;
	private final int observationId;

	public ObservationNotFoundException(int id) {
		observationId = id;
	}
	
	public int getObservationId() {
		return observationId;
	}
}
