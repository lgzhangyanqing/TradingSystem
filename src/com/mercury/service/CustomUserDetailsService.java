package com.mercury.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.Person;
import com.mercury.dao.PersonDao;

@Service
@Transactional(readOnly=true)
public class CustomUserDetailsService implements UserDetailsService{
	private PersonDao pd;
		
	public PersonDao getPd() {
		return pd;
	}
	public void setPd(PersonDao pd) {
		this.pd = pd;
	}

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		UserDetails user = null;  
		try {
			Person person = pd.findPersonByEmail(email);	
			Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			authorities.add(new SimpleGrantedAuthority(person.getAuthority()));
			user = new User(
						person.getUsername(),
						person.getPassword(),
						true,
						true,
						true,
						true,
						authorities 
					);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UsernameNotFoundException("Error in retrieving user");
		}
		return user;
	}
}
