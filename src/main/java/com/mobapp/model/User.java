package com.mobapp.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue
	private Integer id;
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private String tel;
	private String email;
	private String adress;
	private Integer zip;
	private String city;
	private String country;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinTable(name = "user_roles", joinColumns = { @JoinColumn(name = "user_id", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "role_id", referencedColumnName = "id") })
	private Role role;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	/**
	 * Method updates already existed {@link User} object with values from the
	 * inputed argument.
	 * 
	 * @param user
	 *            - Object which contains new User values.
	 * @return {@link User} object to which this method applied.
	 */
	public User update(User user) {
		this.username = user.username;
		this.password = user.password;
		this.firstName = user.firstName;
		this.lastName = user.lastName;
		this.tel = user.tel;
		this.email = user.email;
		this.adress = user.adress;
		this.zip = user.zip;
		this.city = user.city;
		this.country = user.country;
		this.role = user.role;
		return this;
	}

}
