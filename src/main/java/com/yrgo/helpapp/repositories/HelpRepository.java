package com.yrgo.helpapp.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yrgo.helpapp.entities.Help;

@Repository("helpRepository")
public interface HelpRepository extends JpaRepository<Help, Integer> {
	
	@Query("FROM Help WHERE account.username = username")
	public List<Help> findHelpByUsername(@Param("username") String username);

}
