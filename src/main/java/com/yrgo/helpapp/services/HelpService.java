package com.yrgo.helpapp.services;

import java.util.List;

import com.yrgo.helpapp.entities.Help;

public interface HelpService {
	
	public Help save(Help help);
	
	public List<Help> findHelpByUsername(String username);
	
	public Help find(int id);

}
