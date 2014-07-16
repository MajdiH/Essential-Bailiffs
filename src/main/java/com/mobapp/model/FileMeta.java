package com.mobapp.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@JsonIgnoreProperties({"bytes"})
@Table(name = "medias")
public class FileMeta {
	
	@Id
	@GeneratedValue
	private Integer id;
	private Integer observationId;
	private String fileName;
	private String fileSize;
	private String fileType;
	@Transient
	private byte[] bytes;
	
	@Transient
	public byte[] getBytes() {
		return bytes;
	}
	@Transient
	public void setBytes(byte[] bytes) {
		this.bytes = bytes;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getObservationId() {
		return observationId;
	}
	public void setObservationId(Integer observationId) {
		this.observationId = observationId;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
}
