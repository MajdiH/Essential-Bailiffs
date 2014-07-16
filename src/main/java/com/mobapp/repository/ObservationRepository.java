package com.mobapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mobapp.model.Observation;

public interface ObservationRepository extends JpaRepository<Observation, Integer> {

}
