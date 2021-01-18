package com.yrgo.helpapp.services;

import com.yrgo.helpapp.entities.Category;

public interface CategoryService {
	
	public Iterable<Category> findAll();
	
	public Category find(int id);
	
	public Category save(Category category);
	
	public void delete(int id);

}
