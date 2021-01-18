package com.yrgo.helpapp.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.yrgo.helpapp.entities.Account;
import com.yrgo.helpapp.repositories.AccountRepository;


@Service("accountService")
public class AccountServiceImplementation implements AccountService {
	
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Account account = accountRepository.findByUsername(username);
		if (account == null) {
			throw new UsernameNotFoundException("Username not found for " + username);
		}
		List<GrantedAuthority> grandtedAuthorities = new ArrayList<GrantedAuthority>();
		grandtedAuthorities.add(new SimpleGrantedAuthority(account.getRole().getName()));
		return new User(account.getUsername(), account.getPassword(), grandtedAuthorities);
	}

	@Override
	public Account save(Account account) {
		return accountRepository.save(account);

	}

	@Override
	public Account findByUsername(String username) {
		return accountRepository.findByUsername(username);
	}

	@Override
	public Iterable<Account> findAll() {
		return accountRepository.findAll();
	}

}
