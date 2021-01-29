package com.yrgo.helpapp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrgo.helpapp.entities.Status;
import com.yrgo.helpapp.repositories.StatusRepository;

@Service("statusService")
public class StatusServiceImplementation implements StatusService {

	@Autowired
	private StatusRepository statusRepository;
	
	@Override
	public Iterable<Status> findAll() {
		return statusRepository.findAll();
	}

	@Override
	public Status find(int id) {
		return statusRepository.findById(id).get();
	}

	@Override
	public Status save(Status status) {
		return statusRepository.save(status);
	}

	@Override
	public void delete(int id) {
		statusRepository.deleteById(id);
	}

}
