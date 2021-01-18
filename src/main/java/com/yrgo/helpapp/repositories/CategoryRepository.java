package com.yrgo.helpapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.yrgo.helpapp.entities.Category;

@Repository("categoryRepository")
public interface CategoryRepository extends JpaRepository<Category, Integer> {

	
}
