package com.mobapp.service;

import java.util.List;

import com.mobapp.model.FileMeta;


public interface FileMetaService {
	public FileMeta create(FileMeta fileMeta);
	public FileMeta get(Integer id);
	public List<FileMeta> getAll();
	public FileMeta delete(Integer id);
}
