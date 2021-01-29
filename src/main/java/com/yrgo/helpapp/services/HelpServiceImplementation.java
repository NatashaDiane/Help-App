package com.yrgo.helpapp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrgo.helpapp.entities.Help;
import com.yrgo.helpapp.repositories.HelpRepository;

@Service("helpService")
public class HelpServiceImplementation implements HelpService {
	
	@Autowired
	private HelpRepository helpRepository;
	
	@Override
	public Help save(Help help) {
		return helpRepository.save(help);
	}

	@Override
	public List<Help> findHelpByUsername(String username) {
		return helpRepository.findHelpByUsername(username);
	}

	@Override
	public Help find(int id) {
		return helpRepository.findById(id).get();
		
	}

}
