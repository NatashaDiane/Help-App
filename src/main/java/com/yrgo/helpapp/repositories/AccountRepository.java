package com.yrgo.helpapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.yrgo.helpapp.entities.Account;

@Repository("accountRepository")
public interface AccountRepository extends JpaRepository<Account, Integer> {

	public Account findByUsername(String username);
}
