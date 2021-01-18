package com.yrgo.helpapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.yrgo.helpapp.entities.Status;

@Repository("statusRepository")
public interface StatusRepository extends JpaRepository<Status, Integer> {

}
