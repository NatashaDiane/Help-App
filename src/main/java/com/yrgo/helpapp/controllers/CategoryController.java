package com.yrgo.helpapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yrgo.helpapp.entities.Category;
import com.yrgo.helpapp.services.CategoryService;

@Controller
@RequestMapping(value = "category")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	//Shows all the Categories that are available
	@RequestMapping(value= {"", "index"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("categories", categoryService.findAll());
		return "category.index";
	}
	
	//methods to add and save a new category
	@RequestMapping(value= "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
			Category category = new Category();
			category.setStatus(true);
			modelMap.put("category", category);
			return "category.add";
	}
	
	@RequestMapping(value= "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("category") Category category ,ModelMap modelMap) {
		try {
			categoryService.save(category);
			return "redirect:/category";
		}catch (Exception e) {
			modelMap.put("error", "Failed to save. The name is already on the list. No duplicates please!");
			return "category.add";
		}

	}
	
	//methods to edit and save an existing category
	@RequestMapping(value= "edit/{categoryId}", method = RequestMethod.GET)
	public String edit(@PathVariable("categoryId") int id, ModelMap modelMap) {
		Category category = categoryService.find(id);
		modelMap.put("category", category);
		return "category.edit";
	}
	
	@RequestMapping(value= "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("category") Category category, ModelMap modelMap) {
		try {categoryService.save(category);
			return "redirect:/category";
		}catch (Exception e) {
			modelMap.put("error", "Failed to edit. The name is already on the list. No duplicates please!");
			modelMap.put("category", category);
			return "category.edit";
		}

	}
	
	@RequestMapping(value= "delete/{categoryId}", method = RequestMethod.GET)
	public String delete(@PathVariable("categoryId") int id, RedirectAttributes redirectAttributes) {
		try {
			categoryService.delete(id);
		}catch(Exception e) {
			redirectAttributes.addFlashAttribute("error", "Failed to delete");
		}
		
		return "redirect:/category";
	}

}
