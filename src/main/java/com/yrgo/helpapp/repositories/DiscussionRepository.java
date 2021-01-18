package com.yrgo.helpapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.yrgo.helpapp.entities.Discussion;

@Repository("discussionRepository")
public interface DiscussionRepository extends JpaRepository<Discussion, Integer> {

}
