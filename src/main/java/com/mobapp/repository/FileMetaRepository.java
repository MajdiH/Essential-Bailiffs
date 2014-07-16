package com.mobapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mobapp.model.FileMeta;

public interface FileMetaRepository extends JpaRepository<FileMeta, Integer> {

}
