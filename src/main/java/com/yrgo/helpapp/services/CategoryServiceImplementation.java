package com.yrgo.helpapp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrgo.helpapp.entities.Category;
import com.yrgo.helpapp.repositories.CategoryRepository;

@Service("categoryService")
public class CategoryServiceImplementation implements CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public Iterable<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public Category find(int id) {
		return categoryRepository.findById(id).get();
	}

	@Override
	public Category save(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public void delete(int id) {
		categoryRepository.deleteById(id);
	}

}
