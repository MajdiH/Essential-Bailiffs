package com.mobapp.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mobapp.repository.UserDAO;

@Service
@Transactional(readOnly=true)
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserDAO userDAO;	

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		
		com.mobapp.model.User domainUser = userDAO.getUser(username);
		
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		return new User(
				domainUser.getUsername(), 
				domainUser.getPassword(), 
				enabled, 
				accountNonExpired, 
				credentialsNonExpired, 
				accountNonLocked,
				getAuthorities(domainUser.getRole().getId())
		);
	}
	
	public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {
		List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}
	
	public List<String> getRoles(Integer role) {

		List<String> roles = new ArrayList<String>();

		if (role.intValue() == 1) {
			roles.add("ROLE_ADMIN");
			roles.add("ROLE_BAILLIF");
			roles.add("ROLE_SECRETARY");
		} else if (role.intValue() == 2) {
			roles.add("ROLE_BAILLIF");
			roles.add("ROLE_SECRETARY");
		} else if(role.intValue() == 3){
			roles.add("ROLE_BAILLIF");
			roles.add("ROLE_SECRETARY");
		}
			
		return roles;
	}
	
	public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}

}
