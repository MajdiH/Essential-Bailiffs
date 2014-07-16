package com.mobapp.service;

import java.util.List;

import com.mobapp.exception.ObservationNotFoundException;
import com.mobapp.model.Observation;

public interface ObservationService {

	public Observation create(Observation observation);
	public Observation get(Integer id) throws ObservationNotFoundException;
	public List<Observation> getAll();
	public Observation update(Observation observation);
	public Observation delete(Integer id);
	
}
