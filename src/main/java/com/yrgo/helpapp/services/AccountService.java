package com.yrgo.helpapp.services;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.yrgo.helpapp.entities.Account;


public interface AccountService extends UserDetailsService{

	public Iterable<Account> findAll();
	
	public Account save(Account account);
	
	public Account findByUsername(String username);
	
	public void delete(int id);
	
}
