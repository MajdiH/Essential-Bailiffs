package com.mobapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mobapp.exception.ObservationNotFoundException;
import com.mobapp.model.Observation;
import com.mobapp.repository.ObservationRepository;

@Service
@Transactional(rollbackFor = { ObservationNotFoundException.class })
public class ObservationServiceImpl implements ObservationService {
	
	@Autowired
	private ObservationRepository observationRepository;

	@Override
	public Observation create(Observation observation) {
		return observationRepository.save(observation);
	}

	@Override
	public List<Observation> getAll() {
		return observationRepository.findAll();
	}

	@Override
	public Observation update(Observation observation) {
		Observation observationToUpdate = get(observation.getId());
		observationToUpdate.update(observation);
		return observationToUpdate;
	}

	@Override
	public Observation delete(Integer id) {
		Observation observation = get(id);
		observationRepository.delete(id);
		return observation;
	}

	@Override
	public Observation get(Integer id) throws ObservationNotFoundException {
		Observation observation = null;
		if (id instanceof Integer)
			observation = observationRepository.findOne(id);
		if (observation != null)
			return observation;
		throw new ObservationNotFoundException(id);
	}

}
