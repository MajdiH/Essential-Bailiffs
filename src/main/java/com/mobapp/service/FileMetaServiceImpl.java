package com.mobapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mobapp.model.FileMeta;
import com.mobapp.repository.FileMetaRepository;

@Service
@Transactional
public class FileMetaServiceImpl implements FileMetaService {

	@Autowired
	private FileMetaRepository fileMetaRepository;

	@Override
	public FileMeta create(FileMeta fileMeta) {
		return fileMetaRepository.save(fileMeta);
	}

	@Override
	public FileMeta get(Integer id) {
		FileMeta fileMeta = null;
		if (id instanceof Integer)
			fileMeta = fileMetaRepository.findOne(id);
		return fileMeta;
	}

	@Override
	public List<FileMeta> getAll() {
		return fileMetaRepository.findAll();
	}

	@Override
	public FileMeta delete(Integer id) {
		FileMeta fileMeta = get(id);
		fileMetaRepository.delete(id);
		return fileMeta;
	}

}
