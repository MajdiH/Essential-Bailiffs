package com.mobapp.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "observations")
public class Observation {

	@Id
	@GeneratedValue
	private Integer id;
	private Integer userId;
    private Integer clientId;
	private Date createdAt;
	private String statement;
	private String comment;
	
	/**
	 * Method updates already existed {@link Observation} object with values from the
	 * inputed argument.
	 * 
	 * @param observation
	 *            - Object which contains new Observation values.
	 * @return {@link Observation} object to which this method applied.
	 */
	public Observation update(Observation observation) {
		this.userId = observation.userId;
		this.clientId = observation.clientId;
		this.createdAt = observation.createdAt;
		this.statement = observation.statement;
		this.comment = observation.comment;
		return this;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getClientId() {
		return clientId;
	}

	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getStatement() {
		return statement;
	}

	public void setStatement(String statement) {
		this.statement = statement;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	

}
