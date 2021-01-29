package com.yrgo.helpapp.services;

import com.yrgo.helpapp.entities.Status;

public interface StatusService {
	
	public Iterable<Status> findAll();
	
	public Status find(int id);
	
	public Status save(Status status);
	
	public void delete(int id);

}
