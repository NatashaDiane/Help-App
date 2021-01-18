package com.yrgo.helpapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.yrgo.helpapp.entities.Help;

@Repository("ticketRepository")
public interface TicketRepository extends JpaRepository<Help, Integer> {

}
