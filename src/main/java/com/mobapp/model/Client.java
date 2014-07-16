package com.mobapp.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "clients")
public class Client {
	@Id
	@GeneratedValue
	private Integer id;
	@NotEmpty
	private String firstName;
	@NotEmpty
	private String lastName;
	@NotEmpty
	private String tel;
	@NotEmpty
	@Email
	private String email;
	@NotNull
	@Past
	private Date birthday;
	@NotEmpty
	private String profession;
	@NotEmpty
	private String adress;
	@NotNull
	private Integer zip;
	@NotEmpty
	private String city;
	@NotEmpty
	private String country;

	/**
	 * Method updates already existed {@link Client} object with values from the
	 * inputed argument.
	 * 
	 * @param client
	 *            - Object which contains new Client values.
	 * @return {@link Client} object to which this method applied.
	 */
	public Client update(Client client) {
		this.firstName = client.firstName;
		this.lastName = client.lastName;
		this.tel = client.tel;
		this.email = client.email;
		this.birthday = client.birthday;
		this.profession = client.profession;
		this.adress = client.adress;
		this.zip = client.zip;
		this.city = client.city;
		this.country = client.country;
		return this;
	}

	@Override
	public String toString() {
		return firstName + ": " + firstName + " and lastName " + lastName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public Integer getZip() {
		return zip;
	}

	public void setZip(Integer zip) {
		this.zip = zip;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

}
